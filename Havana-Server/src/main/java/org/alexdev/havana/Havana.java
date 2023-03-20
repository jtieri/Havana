package org.alexdev.havana;

import com.google.gson.Gson;
import io.netty.util.ResourceLeakDetector;
import org.alexdev.havana.dao.Storage;
import org.alexdev.havana.dao.mysql.*;
import org.alexdev.havana.game.GameScheduler;
import org.alexdev.havana.game.achievements.AchievementManager;
import org.alexdev.havana.game.ads.AdManager;
import org.alexdev.havana.game.catalogue.CatalogueManager;
import org.alexdev.havana.game.catalogue.collectables.CollectablesManager;
import org.alexdev.havana.game.commands.CommandManager;
import org.alexdev.havana.game.ecotron.EcotronManager;
import org.alexdev.havana.game.effects.EffectsManager;
import org.alexdev.havana.game.encryption.Cryptography;
import org.alexdev.havana.game.encryption.HugeInt15;
import org.alexdev.havana.game.events.EventsManager;
import org.alexdev.havana.game.fuserights.FuserightsManager;
import org.alexdev.havana.game.games.GameManager;
import org.alexdev.havana.game.games.snowstorm.SnowStormMapsManager;
import org.alexdev.havana.game.infobus.InfobusManager;
import org.alexdev.havana.game.item.ItemManager;
import org.alexdev.havana.game.misc.figure.FigureManager;
import org.alexdev.havana.game.moderation.ChatManager;
import org.alexdev.havana.game.navigator.NavigatorManager;
import org.alexdev.havana.game.player.PlayerManager;
import org.alexdev.havana.game.room.RoomManager;
import org.alexdev.havana.game.room.handlers.walkways.WalkwaysManager;
import org.alexdev.havana.game.room.models.RoomModelManager;
import org.alexdev.havana.game.texts.TextsManager;
import org.alexdev.havana.game.wordfilter.WordfilterManager;
import org.alexdev.havana.messages.MessageHandler;
import org.alexdev.havana.server.mus.MusServer;
import org.alexdev.havana.server.netty.NettyPlayerNetwork;
import org.alexdev.havana.server.netty.NettyServer;
import org.alexdev.havana.server.rcon.RconServer;
import org.alexdev.havana.util.DateUtil;
import org.alexdev.havana.util.StringUtil;
import org.alexdev.havana.util.config.GameConfiguration;
import org.alexdev.havana.util.config.LoggingConfiguration;
import org.alexdev.havana.util.config.ServerConfiguration;
import org.alexdev.havana.util.config.writer.DefaultConfigWriter;
import org.alexdev.havana.util.config.writer.GameConfigWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;

import java.io.IOException;
import java.math.BigInteger;
import java.net.UnknownHostException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Locale;

public class Havana {
    private static final Gson gson = new Gson();
    private static long startupTime;

    private static String serverIP;
    private static int serverPort;

    private static String musServerIP;
    private static int musServerPort;

    private static String rconIP;
    private static int rconPort;

    private static boolean isShutdown;
    
    private static NettyServer server;
    private static MusServer musServer;
    private static RconServer rconServer;

    private static Logger log;

    /**
     * Main call of Java application
     * @param args System arguments
     */
    public static void main(String[] args) {
        startupTime = DateUtil.getCurrentTimeSeconds();

        try {
            LoggingConfiguration.checkLoggingConfig();

            ServerConfiguration.setWriter(new DefaultConfigWriter());
            ServerConfiguration.load("server.ini");

            log = LoggerFactory.getLogger(Havana.class);
            ResourceLeakDetector.setLevel(ResourceLeakDetector.Level.ADVANCED);

            log.info("Havana - Habbo Hotel V31 Emulation");

            if (Storage.connect()) {
                Storage.getLogger().info("Connection to MySQL was a success");
            } else {
                Storage.getLogger().error("Could not connect");
                return;
            }

            NettyPlayerNetwork c = new NettyPlayerNetwork(null, 0);
            c.setToken("65602183985613826120946103332662");

            EncryptionTest(c);

            // Update players online back to 0
            SettingsDao.updateSetting("players.online", "0");

            RoomDao.resetVisitors();
            ItemDao.resetTradeStates();
            PlayerDao.resetOnline();

            /*
            var percentageCheck = 1.0
                    ;

            for (int i = 0; i < 100; i++) {
                var chance = Math.random() * 100;

                if ((100 - percentageCheck) < chance) {
                    log.info("5% chance!");
                }
            }*/

            log.info("Setting up game");

            GameConfiguration.getInstance(new GameConfigWriter());
            InfobusManager.getInstance();
            AchievementManager.getInstance();
            AdManager.getInstance();
            WalkwaysManager.getInstance();
            ItemManager.getInstance();
            CatalogueManager.getInstance();
            EcotronManager.getInstance();
            RoomModelManager.getInstance();
            RoomManager.getInstance();
            PlayerManager.getInstance();
            FuserightsManager.getInstance();
            NavigatorManager.getInstance();
            EffectsManager.getInstance();
            EventsManager.getInstance();
            ChatManager.getInstance();
            GameScheduler.getInstance();
            SnowStormMapsManager.getInstance();
            GameManager.getInstance();
            CommandManager.getInstance();
            MessageHandler.getInstance();
            TextsManager.getInstance();
            WordfilterManager.getInstance();
            CollectablesManager.getInstance();
            FigureManager.getInstance();

            if (GameConfiguration.getInstance().getBoolean("reset.sso.after.login")) {
                PlayerDao.resetSsoTickets();
            }

            setupRcon();
            setupMus();
            setupServer();

            if (GameConfiguration.getInstance().getInteger("delete.chatlogs.after.x.age") > 0) {
                LogDao.deleteChatLogs(GameConfiguration.getInstance().getInteger("delete.chatlogs.after.x.age"));
            }

            if (GameConfiguration.getInstance().getInteger("delete.iplogs.after.x.age") > 0) {
                LogDao.deleteIpAddressLogs(GameConfiguration.getInstance().getInteger("delete.iplogs.after.x.age"));
            }

            Runtime.getRuntime().addShutdownHook(new Thread(Havana::dispose));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void EncryptionTest(NettyPlayerNetwork c) {
        var bigInteer = new BigInteger("24608602965125741349820450175553983127369458959744575225672967737182167903038107964568822983698711007220209902861410");

        System.out.println(Arrays.toString(HugeInt15.getByteArray(bigInteer)));
        /*int[] sharedKey = new int[] { 142, 152, 200, 23, 9, 115, 248, 22, 5, 143, 86, 126, 205, 85, 247, 107, 76, 159, 168, 183, 71, 196, 153, 75, 213, 125, 8, 76, 200, 123, 72, 125, 131, 96, 132, 218, 48, 201, 190, 147, 30, 138, 47, 238, 31, 13, 32, 104 };
        var pDecoder = new Cryptography(sharedKey);

        var pHeaderDecoder = new Cryptography(sharedKey);

        String tContent = "3oDraAn/hxtHIDLhd4s+9uIpq9znHp0woqts43qrv+bqjnxbi7JRd6Lb/e+QOe5EPQHYdk+VZZVu2SV/4Nwca1jsm5H1/Bp7eR6mz25Wldh+ezHDCSdKlt";//new String(decodeBytes, StringUtil.getCharset());
        String pLastContent = "";
        String tBody = "";

        int tOffset = 0;
        int pMsgOffset = 0;
        int pMsgSize = 0;

        System.out.println("tContent: " + tContent);

        //while (tOffset < tContent.length()) {
            if (pLastContent.length() == 0) {
                //player.getNetwork().setRx(NettyPlayerNetwork.iterateRandom(
                //        player.getNetwork().getRx()
                //));

                pMsgOffset = 0;
                String tHeader = tContent.substring(tOffset, tOffset + 6);
                //System.out.println("pMsgSize " + pMsgSize + " / " + tHeader);

                tHeader = pHeaderDecoder.kg4R6Jo5xjlqtFGs1klMrK4ZTzb3R(tHeader);

                int tByte1 = ((int) tHeader.charAt(3)) & 63;
                int tByte2 = ((int) tHeader.charAt(2)) & 63;
                int tByte3 = ((int) tHeader.charAt(1)) & 63;
                /*
                System.out.println("tByte1 " + tByte1);
                System.out.println("tByte2 " + tByte2);
                System.out.println("tByte3 " + tByte3);

                pMsgSize = (tByte2 * 64) | tByte1;
                pMsgSize = (tByte3 * 64 * 64) | pMsgSize;


                //System.out.println("pMsgSize " + pMsgSize + " / " + tHeader);


                tBody = tContent.substring(tOffset + 6, tOffset + 6 + pMsgSize);
                int tLength = tBody.length();
                tOffset = tOffset + 6 + tLength;
                pMsgOffset = pMsgOffset + tLength;
                if (tLength < pMsgSize) {
                    pLastContent = tBody;
                    //buffer.resetReaderIndex();
                    return;
                }
            } else {
                tBody = tContent.substring(tOffset, tOffset + pMsgSize - pMsgOffset);
                int tLength = tBody.length();
                tOffset = tOffset + tLength;
                pLastContent = pLastContent + tBody;
                pMsgOffset = pMsgOffset + tLength;
                if (pLastContent.length() < pMsgSize) {
                    //buffer.resetReaderIndex();
                    return;
                }

                tBody = pLastContent;
                pLastContent = "";
            }

            //System.out.println("tBody " + tBody);
            tBody = pDecoder.kg4R6Jo5xjlqtFGs1klMrK4ZTzb3R(tBody);

            System.out.println(tBody);
       // }*/
    }

    private static void setupServer() throws UnknownHostException {
        String serverIP = ServerConfiguration.getString("server.bind");

        if (serverIP.length() == 0) {
            log.error("Game server bind address is not provided");
            return;
        }

        serverPort = ServerConfiguration.getInteger("server.port");

        if (serverPort == 0) {
            log.error("Game server port not provided");
            return;
        }

        server = new NettyServer(serverIP, serverPort);
        server.createSocket();
        server.bind();
    }

    private static void setupRcon() throws IOException {
        // Create the RCON instance
        rconIP = ServerConfiguration.getString("rcon.bind");

        if (rconIP.length() == 0) {
            log.error("Remote control (RCON) server bind address is not provided");
            return;
        }

        rconPort = ServerConfiguration.getInteger("rcon.port");

        if (rconPort == 0) {
            log.error("Remote control (RCON) server port not provided");
            return;
        }

        rconServer = new RconServer(rconIP, rconPort);
        rconServer.createSocket();
        rconServer.bind();
    }

    private static void setupMus() throws UnknownHostException {
        musServerIP = ServerConfiguration.getString("mus.bind");

        if (musServerIP.length() == 0) {
            log.error("Multi User Server (MUS) bind address is not provided");
            return;
        }

        musServerPort = ServerConfiguration.getInteger("mus.port");

        if (musServerPort == 0) {
            log.error("Multi User Server (MUS) port not provided");
            return;
        }

        musServer = new MusServer(musServerIP, musServerPort);
        musServer.createSocket();
        musServer.bind();
    }

    private static void dispose() {
        try {

            log.info("Shutting down server!");
            isShutdown = true;

            log.info("Saving chat!");
            ChatManager.getInstance().performChatSaving();

            log.info("Saving item updates!");
            GameScheduler.getInstance().performItemSaving();

            log.info("Saving item deletions!");
            GameScheduler.getInstance().performItemDeletion();

            log.info("Disconnecting all users!");
            PlayerManager.getInstance().dispose();

            log.info("Server disposal!");
            server.dispose(false);

            log.info("All done!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean isHappyHour() {
        try {
            Calendar cl = Calendar.getInstance();

            LocalTime from = null;//LocalTime.parse( "20:11:13"  ) ;
            LocalTime to = null;//LocalTime.parse( "14:49:00" ) ;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss", Locale.US);

            if (cl.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY ||
                cl.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
                from = LocalTime.parse(GameConfiguration.getInstance().getString("happy.hour.weekend.start"), formatter);
                to = LocalTime.parse(GameConfiguration.getInstance().getString("happy.hour.weekend.end"), formatter);
            } else {
                from = LocalTime.parse(GameConfiguration.getInstance().getString("happy.hour.weekday.start"), formatter);
                to = LocalTime.parse(GameConfiguration.getInstance().getString("happy.hour.weekday.end"), formatter);
            }

            LocalTime nowUtcTime = LocalTime.parse(DateUtil.getCurrentDate("HH:mm:ss"), formatter);
            return nowUtcTime.isAfter(from) && nowUtcTime.isBefore(to);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return false;
    }

    /**
     * Returns the interface to the server handler
     * 
     * @return {@link NettyServer} interface
     */
    public static NettyServer getServer() {
        return server;
    }

    /**
     * Returns the interface to the server handler
     *
     * @return {@link NettyServer} interface
     */
    public static RconServer getRcon() {
        return rconServer;
    }

    /**
     * Gets the server IPv4 IP address it is currently (or attempting to) listen on
     * @return IP as string
     */
    public static String getServerIP() {
        return serverIP;
    }

    /**
     * Gets the server port it is currently (or attempting to) listen on
     * @return string of IP
     */
    public static int getServerPort() {
        return serverPort;
    }

    /**
     * Gets the rcon IPv4 IP address it is currently (or attempting to) listen on
     * @return IP as string
     */
    public static String getRconIP() {
        return rconIP;
    }

    /**
     * Gets the rcon port it is currently (or attempting to) listen on
     * @return string of IP
     */
    public static int getRconPort() {
        return rconPort;
    }

    /**
     * Gets the startup time.
     *
     * @return the startup time
     */
    public static long getStartupTime() {
        return startupTime;
    }

    /**
     * Are we shutting down?
     *
     * @return boolean yes/no
     */
    public static boolean isShuttingdown() {
        return isShutdown;
    }

    /**
     * Get gson instance.
     *
     * @return the gson instance
     */
    public static Gson getGson() {
        return gson;
    }

    /**
     * Get the Argon2 password encoder instance.
     *
     * @return
     */
    public static Argon2PasswordEncoder getPasswordEncoder() {
        var encoder =new Argon2PasswordEncoder(16, 32, 1, 65536, 2);
        return encoder;
    }
}
package org.alexdev.havana.game.commands.registered.admin;

import org.alexdev.havana.game.catalogue.CatalogueManager;
import org.alexdev.havana.game.catalogue.RareManager;
import org.alexdev.havana.game.commands.Command;
import org.alexdev.havana.game.entity.Entity;
import org.alexdev.havana.game.entity.EntityType;
import org.alexdev.havana.game.item.ItemManager;
import org.alexdev.havana.game.player.Player;
import org.alexdev.havana.game.player.PlayerManager;
import org.alexdev.havana.game.player.PlayerRank;
import org.alexdev.havana.messages.incoming.catalogue.GET_CATALOG_INDEX;
import org.alexdev.havana.messages.outgoing.rooms.user.CHAT_MESSAGE;

public class NextRareCommand extends Command {
    @Override
    public void setPlayerRank() {
        super.setPlayerRank(PlayerRank.ADMINISTRATOR);
    }

    @Override
    public void handleCommand(Entity entity, String message, String[] args) throws Exception {
        if (entity.getType() != EntityType.PLAYER) {
            return;
        }

        Player player = (Player) entity;

        if (player.getRoomUser().getRoom() == null) {
            return;
        }

        RareManager.getInstance().selectNewRare();
        var currentRare = RareManager.getInstance().getCurrentRare();

        StringBuilder msg = new StringBuilder();
        msg.append("Daily rare has been changed to ");
        msg.append(currentRare.getDefinition().getName());
        msg.append(" which costs ");
        msg.append(RareManager.getInstance().getRareCost().get(currentRare));
        msg.append(" credits.");

        player.send(new CHAT_MESSAGE(CHAT_MESSAGE.ChatMessageType.CHAT, player.getRoomUser().getInstanceId(), msg.toString(), 0));
        reset(player);
    }

    @Override
    public String getDescription() {
        return "Changes the daily rare in the catalogue.";
    }

    /**
     * reset will refresh the item and catalogue manager as well as the room collision map.
     * This ensures that after an admin changes the daily rare that those changes are reflected in the catalogue.
     * @param player
     */
    public void reset(Player player) {
        ItemManager.reset();
        CatalogueManager.reset();

        // Regenerate collision map with proper height differences (if they changed).
        player.getRoomUser().getRoom().getMapping().regenerateCollisionMap();
        player.getRoomUser().getRoom().getMapping().sendMap();

        for (Player p : PlayerManager.getInstance().getPlayers()) {
            new GET_CATALOG_INDEX().handle(p, null);
        }
    }
}

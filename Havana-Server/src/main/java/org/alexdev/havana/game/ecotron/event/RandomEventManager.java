package org.alexdev.havana.game.ecotron.event;

import org.alexdev.havana.game.player.Player;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
    Thoughts/Reqs
    ---------------------
    - Maintain a Map of Players->Daily Random Chance Events
    - Set a max # on Daily Random Chance Events so users cannot abuse the ecotron random events
    - Manager of RandomEvents can also hold a List of RandomEvents
    - Each event contains its probability for regular and HC users, a name, and a function that is called if its triggered
    - Need two values back
        - 1. The Random Event
        - 2. A bool that indicates if the rest of the ecotron logic should be executed

    Main Idea:
    ----------------------
    Each time user uses the ecotron activate the Random Chance Event Manager.

    If the user has not already exceeded the daily max on Random Chance Events then proceed
    If user has exceeded the max value then just do regular ecotron

    From EcotronManager call something like EcotronManager.RandomEventManager.tryForEvent
    This will do the random chance event simulation and if the user wins it will return an Event
    If there is an Event then do something like RandomChanceEvent.Invoke()
    Invoke() should return a bool that indicates if the rest of the logic should be executed


     */

public class RandomEventManager {
    private final int MAX_DAILY_EVENTS = 5;
    private List<RandomEvent> randomEvents;
    private Map<Player, Integer> playerWins;

    public RandomEventManager() {
        this.randomEvents = new ArrayList<>();
        this.playerWins = new HashMap<>();
    }

    public RandomEvent tryForEvent(Player player) {


        // remove
        return null;
    }

    public boolean isPlayerEligible(Player player) {
        return playerWins.get(player) < MAX_DAILY_EVENTS;
    }

    public void incrementPlayerWins(Player player) {
        var wins = playerWins.get(player);
        playerWins.put(player, wins + 1);
    }

    /**
     * reset is called daily to reset the map of Players to their daily number of random chance events.
     * This method should be called at the start of each day.
     */
    public void reset() {
        this.playerWins = new HashMap<>();
    }
}

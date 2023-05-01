package org.alexdev.havana.game.ecotron.event;

public abstract class RandomEvent {
    private String name;
    private double normalUserChance;
    private double clubUserChance;

    public RandomEvent(String name, double normalUserChance, double clubUserChance) {
        this.name = name;
        this.normalUserChance = normalUserChance;
        this.clubUserChance = clubUserChance;
    }

    public abstract boolean invoke();
}
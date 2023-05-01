package org.alexdev.havana.game.ecotron.event;

public class CreditsRandomEvent extends  RandomEvent{


    public CreditsRandomEvent(String name, double normalUserChance, double clubUserChance) {
        super(name, normalUserChance, clubUserChance);
    }

    @Override
    public boolean invoke() {

        return false;
    }
}

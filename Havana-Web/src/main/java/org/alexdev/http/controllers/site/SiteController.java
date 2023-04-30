package org.alexdev.http.controllers.site;

import org.alexdev.duckhttpd.server.connection.WebConnection;
import org.alexdev.http.util.XSSUtil;

public class SiteController {
    public static void pixels(WebConnection webConnection) {
        XSSUtil.clear(webConnection);

        if (!webConnection.session().contains("authenticated")) {
            return;
        }

        var template = webConnection.template("pixels");
        webConnection.session().set("page", "credits");
        template.render();
    }

    public static void install_shockwave(WebConnection webConnection) {
        XSSUtil.clear(webConnection);

        var template = webConnection.template("install_shockwave");
        template.render();
    }

    public static void shockwave_app(WebConnection webConnection) {
        XSSUtil.clear(webConnection);

        var template = webConnection.template("shockwave_app");
        template.render();
    }
}


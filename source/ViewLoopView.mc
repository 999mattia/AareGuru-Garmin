import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class ViewLoopView extends WatchUi.View {
    private var object;

    private const COLOR = Graphics.COLOR_BLACK;

    public function initialize(index as Number, object as Object) {
        View.initialize();
        self.object = object;
    }

    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        dc.setColor(COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText((dc.getWidth() / 2), (dc.getHeight() / 4), 
                     Graphics.FONT_SMALL, object.name, 
                     Graphics.TEXT_JUSTIFY_CENTER);

        dc.drawText((dc.getWidth() / 2), (dc.getHeight() / 2.5), 
                     Graphics.FONT_LARGE, object.temperature.format("%.1f")+"°", 
                     Graphics.TEXT_JUSTIFY_CENTER);

        dc.drawText((dc.getWidth() / 2), (dc.getHeight() /1.75), 
                     Graphics.FONT_SYSTEM_XTINY, object.text, 
                     Graphics.TEXT_JUSTIFY_CENTER);
    }
}

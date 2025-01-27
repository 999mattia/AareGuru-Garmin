import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class ViewLoopView extends WatchUi.View {
    private var object;

    private const COLOR = Graphics.COLOR_BLACK;

    public function initialize(index as Number, objectToDisplay) {
        View.initialize();
        object = objectToDisplay;
    }

    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        dc.setColor(COLOR, Graphics.COLOR_TRANSPARENT);
        dc.drawText((dc.getWidth() / 2), 5, Graphics.FONT_SMALL, object, Graphics.TEXT_JUSTIFY_CENTER);
    }

}

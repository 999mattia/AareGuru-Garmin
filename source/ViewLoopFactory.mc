import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class ViewLoopFactory extends WatchUi.ViewLoopFactory {
    private var objects;
    function initialize(objectsToDisplay) {
        ViewLoopFactory.initialize();
        objects = objectsToDisplay;
    }

    function getView(page as Number) as [View] or [View, BehaviorDelegate] {
        return [new $.ViewLoopView(page, objects[page]), new $.Delegate(page)];
    }

    function getSize() {
        return objects.size();
    }
}
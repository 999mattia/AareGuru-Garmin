import Toybox.Lang;
import Toybox.WatchUi;

class Delegate extends WatchUi.BehaviorDelegate {
    private var _index as Number;

    public function initialize(index as Number) {
        BehaviorDelegate.initialize();
        _index = index;
    }
}

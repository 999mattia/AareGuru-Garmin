import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class App extends Application.AppBase {
    private const objects = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

    public function initialize() {
        AppBase.initialize();
    }

    public function onStart(state as Dictionary?) as Void {
    }

    public function onStop(state as Dictionary?) as Void {
    }

    public function getInitialView() as [Views] or [Views, InputDelegates] {
            var factory = new ViewLoopFactory(objects);
            var viewLoop = new WatchUi.ViewLoop(factory, {:page => 0, :wrap => true, :color => Graphics.COLOR_BLUE});
            return [viewLoop, new ViewLoopDelegate(viewLoop)];
    }
}
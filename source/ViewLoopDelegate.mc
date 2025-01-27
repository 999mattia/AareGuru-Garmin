import Toybox.Lang;
import Toybox.WatchUi;

class ViewLoopDelegate extends WatchUi.ViewLoopDelegate {

    private var mViewLoop as ViewLoop;

    function initialize(viewLoop as ViewLoop) {
        ViewLoopDelegate.initialize(viewLoop);
        mViewLoop = viewLoop;
    }

    function onNextView() {
        mViewLoop.changeView(WatchUi.ViewLoop.DIRECTION_NEXT);
        return true;
    }

    function onPreviousView() {
        mViewLoop.changeView(WatchUi.ViewLoop.DIRECTION_PREVIOUS);
        return true;
    }
}
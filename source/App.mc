import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Communications;

class App extends Application.AppBase {
    private var objects = [];
    //Add the cities you want to this array
    //Maximum 4
    //brienz, interlaken, thun, bern, hagneck. biel, olten, brugg
    private const cities = [
        "bern",
        "biel",
    ];

    public function initialize() {
        AppBase.initialize();
        makeRequests();
    }

    public function onStart(state as Dictionary?) as Void {
    }

    public function onStop(state as Dictionary?) as Void {
    }

    public function getInitialView() as [Views] or [Views, InputDelegates] {
        return [new WatchUi.ProgressBar("Loading Data...", null)];
    }

    function onReceive(responseCode as Number, data as Dictionary?) as Void {
        if (responseCode == 200) {
            var object = new Object(data["name"], data["aare"], data["text"]);
            objects.add(object);
            updateView();
        } else {
            System.println("Error: Response Code " + responseCode);
        }
    }

    function updateView() as Void {
        var factory = new ViewLoopFactory(objects);
        var viewLoop = new WatchUi.ViewLoop(factory, {
            :page => 0,
            :wrap => true,
            :color => Graphics.COLOR_BLUE
        });
        
        WatchUi.switchToView(viewLoop, new ViewLoopDelegate(viewLoop), WatchUi.SLIDE_UP);
    }

    function makeRequests() as Void {
        for (var i = 0; i < cities.size(); i++) {
            var url = "https://aareguru.existenz.ch/v2018/today?city=" + cities[i] +
                      "&app=github.com/999mattia/AareGuru-Garmin&version=1.0";

            var params = {};

            var options = {
                :method => Communications.HTTP_REQUEST_METHOD_GET,
                :headers => {
                    "Content-Type" => Communications.REQUEST_CONTENT_TYPE_JSON
                },
                :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
            };

            Communications.makeWebRequest(url, params, options, method(:onReceive));
        }
    }
}

class Object {
    public var name;
    public var temperature;
    public var text;

    public function initialize(name as String, temperature as Number, text as String) {
        self.name = name;
        self.temperature = temperature;
        self.text = text;
    }
}

import UIKit

struct FlightListInstance {
    
    private init() {
    }

    static func viewController() -> FlightsViewController {
        let flightPresenter = presenter()
        let viewController = FlightsViewController(presenter: flightPresenter)
        flightPresenter.view = viewController
        return viewController
    }
    
    private static func presenter() -> FlightsPresenter {
        return FlightsPresenter(getFlights: FlightsInstance.getFlights())
    }
}

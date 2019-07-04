import UIKit

struct FlightsInstance {
    
    private init() {}
    
    static func getFlights() -> GetFlights {
        return GetFlights(repository: flightRepository())
    }
    
    private static func flightRepository() -> FlightRepositoryProtocol {
        return APIFlightRepository(sessionService: SessionService());
    }
}

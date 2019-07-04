import Foundation
import Alamofire
import Alamofire_Synchronous

class APIFlightRepository: FlightRepositoryProtocol {
    
    private let sessionService: SessionService
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func findBy(query: Query) -> [Itinerary] {
        let response = Alamofire.request("\(sessionService.getSession())?apiKey=\(SessionService.API_KEY)&pageIndex=\(query.index)&pageSize=\(query.size)").responseJSON()
        guard let json = response.data,
            let itineraries = try? JSONDecoder().decode(FlightResponse.self, from: json).itineraries() else {
            return [Itinerary]()
        }
        return itineraries
    }
}

import Foundation

protocol FlightRepositoryProtocol {
    func findBy(query: Query) -> [Itinerary]
}

import UIKit
@testable import ArchRx

class StubbedFlightRepository: FlightRepositoryProtocol {
    
    private let amountOfFlights: Int
    
    init(amountOfFlights: Int) {
        self.amountOfFlights = amountOfFlights
    }
    
    func findBy(query: Query) -> [Itinerary] {
        var itineraries = [Itinerary]()
        for _ in 1...amountOfFlights {
            itineraries.append(createItinerary())
        }
        return itineraries
    }
    
    func createItinerary() -> Itinerary {
        let inboundFlight = Flight(carrier: Carrier(name: "carrier1", imageUrl: "http://google.com"), origin: "EDI", destination: "LND", departureTime: Date(), arrivalTime: Date(), stopsCount: 0, totalDurationInMinutes: 90)
        let outboundFlight = Flight(carrier: Carrier(name: "carrier2", imageUrl: "http://google.com"), origin: "LND", destination: "EDI", departureTime: Date(), arrivalTime: Date(), stopsCount: 0, totalDurationInMinutes: 90)
        return Itinerary(outboundLeg: outboundFlight, inboundLeg: inboundFlight, price: 50.0)
    }
}

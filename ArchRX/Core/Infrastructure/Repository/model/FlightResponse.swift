import UIKit

struct FlightResponse: Decodable {
    
    var carriers =  [CarrierRepresentation]()
    var flights =  [LegRepresentation]()
    var places =  [PlaceRepresentation]()
    var itinerariesRepresentation =  [ItineraryRepresentation]()
    
    enum ReviewModelKeys: String, CodingKey {
        case carriers = "Carriers"
        case flights = "Legs"
        case places = "Places"
        case itineraries = "Itineraries"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.carriers = try container.decode([CarrierRepresentation].self, forKey: .carriers)
        self.flights = try container.decode([LegRepresentation].self, forKey: .flights)
        self.places = try container.decode([PlaceRepresentation].self, forKey: .places)
        self.itinerariesRepresentation = try container.decode([ItineraryRepresentation].self, forKey: .itineraries)
    }
    
    func itineraries() -> [Itinerary] {
        return itinerariesRepresentation.compactMap(buildItineraryFrom(itineraryRepresentation:))
    }
    
    private func buildItineraryFrom(itineraryRepresentation: ItineraryRepresentation) -> Itinerary? {
        guard let inboundLegId = itineraryRepresentation.inboundLegId,
            let outboundLegId = itineraryRepresentation.outboundLegId,
            let inboundFlight = buildFlightFrom(legId: inboundLegId),
            let outboundFlight = buildFlightFrom(legId: outboundLegId),
            let price = itineraryRepresentation.priceOptions.first?.price else {
                return nil
        }
        return Itinerary(outboundLeg: outboundFlight,inboundLeg: inboundFlight, price: price)
    }
    
    private func buildFlightFrom(legId: String) -> Flight? {
        guard let flightRepresentation = flights.first(where: { $0.codeId == legId}),
            let inboundCarrier = carriers.first(where: {$0.codeId == flightRepresentation.carriers.first})?.toModel(),
            let origin = places.first(where: {$0.codeId == flightRepresentation.origin})?.code,
            let destination = places.first(where: {$0.codeId == flightRepresentation.destination})?.code,
            let departureTime = flightRepresentation.departure,
            let arrivalTime = flightRepresentation.arrival,
            let totalDurationInMinutes = flightRepresentation.duration else {
                return nil
        }
        let stopsCount = flightRepresentation.stops.count
        return Flight(carrier: inboundCarrier,
                      origin: origin,
                      destination: destination,
                      departureTime: departureTime,
                      arrivalTime: arrivalTime,
                      stopsCount: stopsCount,
                      totalDurationInMinutes: totalDurationInMinutes)
    }
}

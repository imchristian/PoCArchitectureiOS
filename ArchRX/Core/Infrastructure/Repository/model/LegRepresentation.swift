import UIKit

struct LegRepresentation: Decodable {
    var codeId: String?
    var carriers = [Int]()
    var stops = [Int]()
    var duration: Int?
    var departure: Date?
    var arrival: Date?
    var origin: Int?
    var destination: Int?
    
    enum ReviewModelKeys: String, CodingKey {
        case id = "Id"
        case carriers = "Carriers"
        case stops = "Stops"
        case duration = "Duration"
        case departure = "Departure"
        case arrival = "Arrival"
        case origin = "OriginStation"
        case destination = "DestinationStation"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.codeId = try container.decode(String.self, forKey: .id)
        self.carriers = try container.decode([Int].self, forKey: .carriers)
        self.stops =  try container.decode([Int].self, forKey: .stops)
        self.duration =  try container.decode(Int.self, forKey: .duration)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.departure = dateFormatter.date(from:try container.decode(String.self, forKey: .departure))
        self.arrival =  dateFormatter.date(from:try container.decode(String.self, forKey: .arrival))
        self.origin =  try container.decode(Int.self, forKey: .origin)
        self.destination =  try container.decode(Int.self, forKey: .destination)
    }
}

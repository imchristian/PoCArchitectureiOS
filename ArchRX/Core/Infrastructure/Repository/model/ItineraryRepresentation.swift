import UIKit

struct ItineraryRepresentation: Decodable {
    
    var inboundLegId: String?
    var outboundLegId: String?
    var priceOptions = [PricingOptionsRepresentation]()
    
    enum ReviewModelKeys: String, CodingKey {
        case inboundLegId = "InboundLegId"
        case outboundLegId = "OutboundLegId"
        case priceOptions = "PricingOptions"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.inboundLegId = try container.decode(String.self, forKey: .inboundLegId)
        self.outboundLegId = try container.decode(String.self, forKey: .outboundLegId)
        self.priceOptions = try container.decode([PricingOptionsRepresentation].self, forKey: .priceOptions)
    }
}

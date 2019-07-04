import UIKit

struct PricingOptionsRepresentation: Decodable {
    var price: Double?
    
    enum ReviewModelKeys: String, CodingKey {
        case price = "Price"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.price = try container.decode(Double.self, forKey: .price)
    }
}

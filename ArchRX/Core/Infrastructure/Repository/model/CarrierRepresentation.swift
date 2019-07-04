import UIKit

struct CarrierRepresentation: Decodable {
    var codeId: Int?
    var imageUrl: String?
    var name: String?
    
    enum ReviewModelKeys: String, CodingKey {
        case id = "Id"
        case imageUrl = "ImageUrl"
        case name = "Name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.codeId = try container.decode(Int.self, forKey: .id)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.name =  try container.decode(String?.self, forKey: .name)!
    }
    
    func toModel() -> Carrier?  {
        guard let carrierName = name, let carrierImage = imageUrl else {
            return nil
        }
        return Carrier(name: carrierName, imageUrl: carrierImage)
    }
}

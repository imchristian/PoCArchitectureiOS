import UIKit

struct PlaceRepresentation: Decodable {
    var codeId: Int?
    var code: String?
    
    enum ReviewModelKeys: String, CodingKey {
        case id = "Id"
        case code = "Code"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ReviewModelKeys.self)
        self.codeId = try container.decode(Int.self, forKey: .id)
        self.code =  try container.decode(String.self, forKey: .code)
    }
}

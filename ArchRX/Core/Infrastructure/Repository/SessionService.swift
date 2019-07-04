import UIKit
import Alamofire
import Alamofire_Synchronous

class SessionService {
    
    static let API_KEY = "ss630745725358065467897349852985"
    private static let API_URL = "http://partners.api.skyscanner.net/apiservices/pricing/v1.0"
    
    func getSession() -> String {
        let response = Alamofire.request(SessionService.API_URL, method:.post, parameters: parameters()).responseJSON()
        guard let session = response.response?.allHeaderFields["Location"] as? String else {
            return ""
        }
        return session
    }
    
    private func parameters() -> Parameters {
        return [
            "cabinclass" : "Economy",
            "country" : "UK",
            "currency" : "USD",
            "locale" : "en-G",
            "locationSchema" : "sky",
            "originplace" : "EDI-sky",
            "destinationplace" : "LOND-sky",
            "outbounddate" : "2019-02-11",
            "inbounddate" : "2019-02-12",
            "adults" : "1",
            "children" : "0",
            "infants" : "0",
            "apikey" : SessionService.API_KEY
        ]
    }
}

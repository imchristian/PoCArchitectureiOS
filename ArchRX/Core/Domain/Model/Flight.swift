import Foundation

struct Flight {
    let carrier: Carrier
    let origin: String
    let destination: String
    let departureTime: Date
    let arrivalTime: Date
    let stopsCount: Int
    let totalDurationInMinutes: Int
}

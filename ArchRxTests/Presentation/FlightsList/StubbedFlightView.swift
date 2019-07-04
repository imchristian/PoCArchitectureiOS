import UIKit
@testable import ArchRx

class StubbedFlightView: FlightsViewControllerProtocol {
    var calledLoading = false
    var calledShowError = false
    var calledShowFlight = false
    var amountOfFlightToShow = 0
    
    func showFlights(flights: [Itinerary]) {
        calledShowFlight = true
        amountOfFlightToShow = flights.count
    }
    
    func showLoading() {
        calledLoading = true
    }
    
    func hideLoading() {
        calledLoading = true
    }
    
    func showError() {
        calledShowError = true
    }
    
    func hideError() {
        calledShowError = true
    }
}

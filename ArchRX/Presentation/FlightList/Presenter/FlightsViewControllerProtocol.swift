import Foundation

protocol FlightsViewControllerProtocol: class {
    func showLoading()
    func hideLoading()
    func showError()
    func hideError()
    func showFlights(flights: [Itinerary])
}

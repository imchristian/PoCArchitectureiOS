import UIKit

class FlightsViewController: UIViewController {
    
    private static let flightsViewControllerNibName = "FlightsViewController"
    private let presenter: FlightsPresenter
    
    init(presenter: FlightsPresenter) {
        self.presenter = presenter
        super.init(nibName: FlightsViewController.flightsViewControllerNibName, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewPresented()
    }
}

extension FlightsViewController: FlightsViewControllerProtocol {
    
    func showLoading() {
        print("Showing loading")
    }
    
    func hideLoading() {
        print("Hiding loading")
    }
    
    func showError() {
        print("Showing error")
    }
    
    func hideError() {
        print("Hiding error")
    }
    
    func showFlights(flights: [Itinerary]) {
        print("Flights available: \(flights.count)")
    }
}

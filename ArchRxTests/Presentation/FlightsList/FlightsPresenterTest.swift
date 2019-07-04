import XCTest
@testable import ArchRx

class FlightsPresenterTest: XCTestCase {

    var presenter: FlightsPresenter?
    var stubbedGetFlights: StubbedGetFlights?
    var flightView: StubbedFlightView?
    
    func testFetchsFlightsSuccessfullyOnViewPresented() {
        givenFlights(amount: 5)
        whenViewIsPresented()
        thenFlightsAreShown(amount: 5)
    }
    
    private func givenFlights(amount: Int) {
        stubbedGetFlights = StubbedGetFlights(repository: StubbedFlightRepository(amountOfFlights: amount))
        presenter = FlightsPresenter(getFlights: stubbedGetFlights!)
        flightView = StubbedFlightView()
        presenter?.view = flightView
    }
    
    private func whenViewIsPresented() {
        presenter?.viewPresented()
    }
    
    private func thenFlightsAreShown(amount: Int) {
        XCTAssertTrue(flightView!.calledLoading)
        XCTAssertTrue(flightView!.calledShowFlight)
        XCTAssertEqual(flightView!.amountOfFlightToShow, amount)
    }
}

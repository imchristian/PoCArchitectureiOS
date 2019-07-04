import XCTest
@testable import ArchRx

class GetFlightTest: XCTestCase {
    
    var result = [Itinerary]()
    var getFlights: GetFlights?
    
    func testCanGetFiveFlights() {
        givenFiveFlightsAvailable()
        whenIRequestFiveFlights()
        thenIHaveFiveFlights()
    }
    
    private func givenFiveFlightsAvailable() {
        getFlights = GetFlights(repository: StubbedFlightRepository(amountOfFlights: 5))
    }
    
    private func whenIRequestFiveFlights() {
        result = getFlights?.executeWith(data: GetFlights.ActionData(index: 0, size: 5)) ?? []
    }
    
    func  thenIHaveFiveFlights() {
        XCTAssertEqual(result.count, 5)
    }
}

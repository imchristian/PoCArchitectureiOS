import Foundation
@testable import ArchRx
import RxSwift

class StubbedGetFlights: GetFlights {
    
    private let repository: FlightRepositoryProtocol
    private var actionWasCalled = false
    
    override init(repository: FlightRepositoryProtocol) {
        self.repository = repository
        super.init(repository: repository)
    }
    
    override func buildWith(data: ActionData) -> Single<[Itinerary]> {
        actionWasCalled = true
        return Single.just(repository.findBy(query: Query(index: data.index, size: data.size)))
    }
    
    func verifyActionWasCalled() -> Bool {
        return actionWasCalled
    }
}

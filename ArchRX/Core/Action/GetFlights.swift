import Foundation
import RxSwift

class GetFlights {
    
    private let flightsRepository: FlightRepositoryProtocol
    
    init(repository: FlightRepositoryProtocol) {
        self.flightsRepository = repository
    }
    
    func executeWith(data: ActionData) -> [Itinerary] {
        return flightsRepository.findBy(query: Query.init(index: data.index, size: data.size))
    }

    func buildWith(data: ActionData) -> Single<[Itinerary]> {
        return Single.deferred({ () -> PrimitiveSequence<SingleTrait, [Itinerary]> in
            return .just(self.executeWith(data: data))
        })
    }
    
    struct ActionData {
        let index: Int
        let size: Int
    }
}

import Foundation
import RxSwift

class FlightsPresenter {
    
    private let getFlights: GetFlights
    private var index = 0
    private let size = 20
    weak var view: FlightsViewControllerProtocol?
    private var disposables = DisposeBag()
    
    init(getFlights: GetFlights) {
        self.getFlights = getFlights
    }
    
    func viewPresented() {
        view?.showLoading()
        fetchFlights()
    }
    
    func listReachEnd() {
        fetchFlights()
    }
    
    private func fetchFlights() {
        disposables.insert(
            getFlights.buildWith(data: GetFlights.ActionData(index: index, size: size))
            .subscribeOn(SchedulerHelper.subscriberScheduler())
            .observeOn(SchedulerHelper.observerScheduler())
            .subscribe(onSuccess: { [unowned self] (itinerary: [Itinerary]) in
                self.decideNextAction(itineraryList: itinerary)
            }, onError: { (error: Error) in
                self.view?.showError()
            })
        )
    }
    
    private func decideNextAction(itineraryList: [Itinerary]) {
        view?.hideLoading()
        if (isAnEmptyFirstPageOfFlights(itineraryList)) {
            view?.showError()
            return
        }
        view?.hideError()
        view?.showFlights(flights: itineraryList)
        index += 1
    }
    
    func isAnEmptyFirstPageOfFlights(_ itineraryList: [Itinerary]) -> Bool {
        return itineraryList.isEmpty && index == 0
    }
}

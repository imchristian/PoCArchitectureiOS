import RxSwift

class SchedulerHelper {
   
    private init() {
    }
    
    static func subscriberScheduler() -> SchedulerType {
        if let _ = ProcessInfo.processInfo.environment["TESTING"] {
            return ConcurrentMainScheduler.instance
        }
        return SerialDispatchQueueScheduler(qos:.default)
    }
    
    static func observerScheduler() -> SchedulerType {
        if let _ = ProcessInfo.processInfo.environment["TESTING"] {
            return ConcurrentMainScheduler.instance
        }
        return MainScheduler.instance
    }
}

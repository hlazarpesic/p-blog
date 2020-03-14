import RxSwift

struct Schedulers : Singleton {

    static var instance = Schedulers()

    let main: MainScheduler
    let concurrentMain: ConcurrentMainScheduler
    let concurrentBackground : ConcurrentDispatchQueueScheduler

    private init() {
        main = MainScheduler.instance
        concurrentMain = ConcurrentMainScheduler.instance
        concurrentBackground = ConcurrentDispatchQueueScheduler(qos: .background)
    }
}

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        return true
    }
    
    func setupRootViewController() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let flightsVC = FlightListInstance.viewController()
        let nav = UINavigationController.init(rootViewController: flightsVC)
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}


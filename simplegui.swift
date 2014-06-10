func application(application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    var controller: UIViewController = UIViewController()
    var view = UIView(frame: CGRectMake(0, 0, 320, 568))
    view.backgroundColor = UIColor.redColor()
    controller.view = view
    
    var label: UILabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
    label.center = CGPointMake(160, 284)
    label.textAlignment = NSTextAlignment.Center
    label.text = "I'am a test label"
    controller.view.addSubview(label)
    
    self.window!.rootViewController = controller
    self.window!.makeKeyAndVisible()
    return true
}

application()y
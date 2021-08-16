import Vapor

public func application() throws -> Application {
    var environment = try Environment.detect()
    try LoggingSystem.bootstrap(from: &environment)
    let application = Application(environment)
    
    // Insert additional configuration here
    
    return application
}

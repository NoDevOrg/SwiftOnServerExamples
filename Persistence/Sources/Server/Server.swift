import Vapor
import Fluent
import FluentPostgresDriver

enum ApplicationError: Error {
    case missingDatabaseURL
}

public func application() throws -> Application {
    var environment = try Environment.detect()
    try LoggingSystem.bootstrap(from: &environment)
    let application = Application(environment)
    
    // Configure Database
    guard let databaseURL = Environment.get("DATABASE_URL") else {
        throw ApplicationError.missingDatabaseURL
    }
    
    try application.databases.use(.postgres(url: databaseURL), as: .psql)
    return application
}

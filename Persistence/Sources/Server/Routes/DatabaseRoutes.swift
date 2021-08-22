import Vapor
import FluentPostgresDriver

struct DatabaseRoutes: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("database", "version", use: databaseVersion)
    }
    
    func databaseVersion(request: Request) throws -> EventLoopFuture<String> {
        guard let postgres = request.db as? PostgresDatabase else {
            throw Abort(.imATeapot)
        }
        
        return postgres
            .simpleQuery("SELECT version();")
            .map { $0.debugDescription }
    }
}

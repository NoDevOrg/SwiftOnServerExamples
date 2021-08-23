import Fluent

extension User {
    struct Migrations {
        struct Create: Migration {
            func prepare(on database: Database) -> EventLoopFuture<Void> {
                database.schema("users")
                    .id()
                    .field("username", .string, .required)
                    .field("password_hash", .string, .required)
                    .field("created_at", .string)
                    .field("updated_at", .string)
                    .field("deleted_at", .string)
                    .create()
            }
            
            func revert(on database: Database) -> EventLoopFuture<Void> {
                database.schema("users")
                    .delete()
            }
        }
    }
}

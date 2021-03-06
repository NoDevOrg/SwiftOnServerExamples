import Foundation
import Fluent

final class User: Model {
    static var schema: String = "users"

    @ID(key: .id) var id: UUID?
    @Field(key: "username") var username: String
    @Field(key: "password_hash") var passwordHash: String
    @Timestamp(key: "created_at", on: .create) var createdAt: Date?
    @Timestamp(key: "updated_at", on: .update) var updatedAt: Date?
    @Timestamp(key: "deleted_at", on: .delete) var deletedAt: Date?
    
    init() {}
    
    init(username: String, passwordHash: String) {
        self.username = username
        self.passwordHash = passwordHash
    }
}

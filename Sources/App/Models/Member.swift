import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Member: SQLiteModel {
    /// The unique identifier for this `Todo`.
    var id: Int?

    /// A title describing what this `Todo` entails.
    var name: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String) {
        self.id = id
        self.name = title
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Member: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Member: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Member: Parameter { }

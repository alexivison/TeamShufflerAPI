import FluentSQLite
import Vapor

/// A single entry of a Member list.
final class Member: SQLiteModel {
    /// The unique identifier for this `Member`.
    var id: Int?

    /// A title describing what this `Member` entails.
    var name: String

    /// Creates a new `Member`.
    init(id: Int? = nil, title: String) {
        self.id = id
        self.name = title
    }
}

/// Allows `Member` to be used as a dynamic migration.
extension Member: Migration { }

/// Allows `Member` to be encoded to and decoded from HTTP messages.
extension Member: Content { }

/// Allows `Member` to be used as a dynamic parameter in route definitions.
extension Member: Parameter { }

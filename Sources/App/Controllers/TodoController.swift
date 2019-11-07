import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class MemberController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Member]> {
        return Member.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Member> {
        return try req.content.decode(Member.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Member.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}

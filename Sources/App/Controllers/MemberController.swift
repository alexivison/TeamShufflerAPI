import Vapor

struct Shuffle: Content {
    var team1: [Member]
    var team2: [Member]
}

/// Controls basic CRUD operations on `Todo`s.
final class MemberController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Member]> {
        return Member.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Member> {
        return try req.content.decode(Member.self).flatMap { member in
            return member.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Member.self).flatMap { member in
            return member.delete(on: req)
        }.transform(to: .ok)
    }
    
    /// Shuffles the current members
    func shuffle(_ req: Request) throws -> Future<Shuffle> {
        return Member.query(on: req)
            .all()
            .map { members in
                let shuffled = members.shuffled().split()
                return Shuffle(team1: shuffled.left, team2: shuffled.right)
            }
    }
}

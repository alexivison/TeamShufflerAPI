import Vapor

enum Route: String {
    case members
}

public func routes(_ router: Router) throws {
    let memberController = MemberController()
    router.get("/members", use: memberController.index)
    router.get("/members/shuffle", use: memberController.shuffle)
    router.post("/members", use: memberController.create)
    router.delete("/members", Member.parameter, use: memberController.delete)
}

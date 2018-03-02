import SwiftKueryORM

struct Inquiry: Model {
    static var tableName = "Inquiry"
    var name: String
    var email: String
    var body: String
}

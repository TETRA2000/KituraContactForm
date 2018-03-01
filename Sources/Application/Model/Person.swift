import SwiftKueryORM

struct Person: Model {
    static var tableName = "People"
    var name: String
    var age: Int
}

import LoggerAPI
import SwiftKueryORM

func initializePerson(app: App) {
    app.router.get("/person") { request, response, _ in
        if let connection = OrmUtil.sharedInstance.connect() {
            Database.default = Database(single: connection)

            let person = Person(name: "Joe", age: 38)
            person.save { p, error in
                if let error = error {
                    try? response.send("Failed to save. \(error)").end()
                }
            }

            Person.findAll { array, error in
                if let error = error {
                    try? response.send("Failed to findAll. \(error)").end()
                }

                if let array = array {
                    try? response.send("Result = \(array)").end()
                } else {
                    // FIXME necessary?
                    try? response.send("Result is empty.").end()
                }
            }
        } else {
            try response.send("Failed to connect to DB.").end()
        }

        try response.send("Hmm??").end()
    }
}

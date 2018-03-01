import LoggerAPI

func initializePerson(app: App) {
    app.router.get("/person") { request, response, _ in
        if let connection = OrmUtil.instance.connection() {
            let person = Person(name: "Joe", age: 38)
            person.save { p, error in
                if let error = error {
                    response.send("Failed to save.")
                    next()
                    return
                }
            }

            Person.findAll { array, error in
                if let error = error {
                    response.send("Failed to findAll.")
                    next()
                    return
                }

                if let array = array {
                    response.send("Result = \(array)")
                    next()
                    return
                } else {
                    // FIXME necessary?
                    response.send("Result is empty.")
                    next()
                    return
                }
                

            }

        } else {
            response.send("Failed to connect to DB.")
            next()
            return
        }

        response.send("Hmm??")
        next()
    }
}

import SwiftKueryMySQL

class OrmUtil {
    let instance: OrmUtil = new OrmUtil()

    lazy var pool = MySQLConnection.createPool(host: "db", port: 3306, options: [.userName("dbuser"), .password("password")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))

    func connection() -> Connection? {
        if let connection = pool.getConnection() {
            // Build and execute your query here.
            return connection
        }
        else {
            print("Error: failed to get a connection.")
            return nil
        }
    }
}

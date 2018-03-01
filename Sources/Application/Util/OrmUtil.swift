import SwiftKuery
import SwiftKueryMySQL

class OrmUtil {
    static let sharedInstance = OrmUtil()

    lazy var pool = MySQLConnection.createPool(host: "db", user: "dbuser", password: "password", database: "mydb", port: 3306, poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))

    func connect() -> Connection? {
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

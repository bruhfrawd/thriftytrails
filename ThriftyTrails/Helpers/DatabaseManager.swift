import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()
    var db: Connection?

    private init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("ThriftyTrailsDatabase").appendingPathExtension("sqlite3")
            db = try Connection(fileUrl.path)
            createTable()
        } catch {
            print("Error connecting to database: \(error)")
        }
    }

    func createTable() {
        let users = Table("users")
        let id = Expression<Int64>("id")
        let email = Expression<String>("email")
        let username = Expression<String>("username")
        let password = Expression<String>("password")

        do {
            try db?.run(users.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(email, unique: true)
                t.column(username)
                t.column(password)
            })
        } catch {
            print("Error creating table: \(error)")
        }
    }

    func insertUser(email: String, username: String, password: String) {
        let users = Table("users")
        let emailExp = Expression<String>("email")
        let usernameExp = Expression<String>("username")
        let passwordExp = Expression<String>("password")

        let insert = users.insert(emailExp <- email, usernameExp <- username, passwordExp <- password)

        do {
            try db?.run(insert)
        } catch {
            print("Error inserting user: \(error)")
        }
    }

    func fetchUsers() {
        let users = Table("users")
        let emailExp = Expression<String>("email")
        let usernameExp = Expression<String>("username")
        let passwordExp = Expression<String>("password")

        do {
            let allUsers = try db?.prepare(users)
            for user in allUsers! {
                print("Email: \(user[emailExp]), Username: \(user[usernameExp]), Password: \(user[passwordExp])")
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func verifyUser(email: String, password: String) -> Bool {
        let users = Table("users")
        let emailExp = Expression<String>("email")
        let passwordExp = Expression<String>("password")

        do {
            let query = users.filter(emailExp == email && passwordExp == password)
            if let _ = try db?.pluck(query) {
                return true
            }
        } catch {
            print("Error verifying user: \(error)")
        }
        return false
    }

}

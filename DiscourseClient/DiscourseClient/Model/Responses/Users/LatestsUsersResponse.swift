import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestUsersResponse: Codable {
    var users: [User] = []
}

struct User: Codable {
    let id: Int
    let username: String
    let name: String
    let avatarTemplate: String

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
    }
}

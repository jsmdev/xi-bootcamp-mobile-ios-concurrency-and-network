import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestUsersResponse: Codable {
    var users: [User] = []
}

struct User: Codable {
}

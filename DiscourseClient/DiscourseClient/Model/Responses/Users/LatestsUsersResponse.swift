import Foundation

// Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestUsersResponse: Codable {
    var directoryItems: [DirectoryItem]

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
}

struct DirectoryItem: Codable {
    let id, timeRead, likesReceived, likesGiven: Int
    let topicsEntered, topicCount, postCount, postsRead: Int
    let daysVisited: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case timeRead = "time_read"
        case likesReceived = "likes_received"
        case likesGiven = "likes_given"
        case topicsEntered = "topics_entered"
        case topicCount = "topic_count"
        case postCount = "post_count"
        case postsRead = "posts_read"
        case daysVisited = "days_visited"
        case user
    }
}

struct User: Codable {
    let id: Int
    let username: String
    let name: String
    let avatarTemplate: String
    let canEdit: Bool?
    let canEditUsername: Bool?
    let canEditEmail: Bool?
    let canEditName: Bool?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
        case canEdit = "can_edit"
        case canEditUsername = "can_edit_username"
        case canEditEmail = "can_edit_email"
        case canEditName = "can_edit_name"
    }
}

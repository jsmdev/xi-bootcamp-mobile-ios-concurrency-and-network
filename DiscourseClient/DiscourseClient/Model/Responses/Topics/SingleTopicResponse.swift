import Foundation

// Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct SingleTopicResponse: Codable {
    let id: Int
    let title: String
    let postsCount, replyCount: Int
    let createdAt, lastPostedAt: String
    let categoryID: Int
    let details: TopicDetail

    enum CodingKeys: String, CodingKey {
        case id, title, details
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case categoryID = "category_id"
    }
}

struct TopicDetail: Codable {
    let canEdit, canDelete, canCreatePost: Bool?
    let participants: [User]
    let createdBy: User

    enum CodingKeys: String, CodingKey {
        case canEdit = "can_edit"
        case canDelete = "can_delete"
        case canCreatePost = "can_create_post"
        case participants
        case createdBy = "created_by"
    }
}

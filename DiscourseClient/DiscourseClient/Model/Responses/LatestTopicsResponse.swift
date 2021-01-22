import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestTopicsResponse: Codable {
    var topics: [Topic] = []
}

struct Topic: Codable {
    let id: Int
    let title: String
    let postsCount, replyCount: Int
    let createdAt, lastPostedAt: String
    let visible, closed, archived: Bool
    let views, likeCount: Int
    let hasSummary: Bool
    let categoryID: Int

    enum CodingKeys: String, CodingKey {
        case id, title
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case visible, closed, archived, views
        case likeCount = "like_count"
        case hasSummary = "has_summary"
        case categoryID = "category_id"
    }
}

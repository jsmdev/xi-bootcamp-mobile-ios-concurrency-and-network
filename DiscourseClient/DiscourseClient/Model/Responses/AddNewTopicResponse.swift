import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct AddNewTopicResponse: Codable {
    let id, topicId: Int
    let name, topicSlug, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case topicId = "topic_id"
        case topicSlug = "topic_slug"
        case createdAt = "created_at"
    }
}

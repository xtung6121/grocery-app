
import Foundation

struct Banners: Decodable {
    let banners: [Banner]
}

struct Banner: Decodable {
    let id: String
    let imageUrl: String
    let deepLink: String
    let altText: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image_url"
        case deepLink = "deeplink"
        case altText = "alt_text"
    }
}


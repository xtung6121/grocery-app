
import Foundation

enum SplashItemType: String, Decodable {
    case skippable = "skippable"
    case notSkippable = "not_skippable"
}

struct SplashDataResponse: Decodable {
    let version: Int
    let canSkipAll: Bool
    let items: [SplashData]
}

struct SplashData: Decodable {
    let id: String
    let title: String
    let description: String
    let image: String
    let type: SplashItemType
    let cta: String
    let order: Int
}

import Foundation

protocol APIEndpoint {
    var url: URL { get }
    var method: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}

enum SplashAPI {
    static let baseURL = URL(string: "https://easy-node-backend-1.onrender.com")!

    case getSplash
}

extension SplashAPI: APIEndpoint {
    var url: URL {
        switch self {
        case .getSplash:
            return SplashAPI.baseURL.appendingPathComponent("/api/splash")
        }
    }

    var method: String {
        switch self {
        case .getSplash:
            return "GET"
        }
    }

    var headers: [String: String] {
        [
            "Accept": "application/json"
        ]
    }
    
    var body: Data? {
        nil
    }
}

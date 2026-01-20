import Foundation

enum SplashAPI {
    static let baseURL = URL(string: "https://easy-node-backend-1.onrender.com")!

    case getSplash
    case getAuth
}

extension SplashAPI {
    var url: URL {
        switch self {
        case .getSplash:
            return SplashAPI.baseURL.appendingPathComponent("/api/splash")
        case .getAuth:
            return SplashAPI.baseURL.appendingPathComponent("/api/auth/register")
        }
    }

    var method: String {
        switch self {
        case .getSplash:
            return "GET"
        case .getAuth:
            return "GET"	
        }
    }

    var headers: [String: String] {
        [
            "Accept": "application/json"
        ]
    }
}

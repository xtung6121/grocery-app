import Foundation

enum AuthAPI {
    static let baseURL = URL(string: "https://easy-node-backend-1.onrender.com")!

    case postRegister(body: RegisterRequest)
    case postLogin(body: LoginRequest)
}

extension AuthAPI: APIEndpoint {
    var body: Data? {
        switch self {
        case .postLogin(let request):
            return try? JSONEncoder().encode(request)

        case .postRegister(let request):
            return try? JSONEncoder().encode(request)
        }
    }

    var url: URL {
        switch self {
        case .postRegister:
            return AuthAPI.baseURL.appendingPathComponent("/api/auth/register")
        case .postLogin:
            return AuthAPI.baseURL.appendingPathComponent("/api/auth/login")
        }
    }

    var method: String {
        switch self {
        case .postRegister:
            return "POST"
        case .postLogin:
            return "POST"
        }
    }

    var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}

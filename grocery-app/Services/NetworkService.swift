import Foundation

final class NetworkService {

    static let shared = NetworkService()
    private init() {}

    func request<T: Decodable>(
        api: SplashAPI,
        responseType: T.Type
    ) async throws -> T {

        var request = URLRequest(url: api.url)
        request.httpMethod = api.method
        request.allHTTPHeaderFields = api.headers

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}

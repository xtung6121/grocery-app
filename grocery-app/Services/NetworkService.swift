import Foundation

final class NetworkService {

    static let shared = NetworkService()
    private init() {}

    func request<T: Decodable>(
        api: APIEndpoint,
        responseType: T.Type
    ) async throws -> T {

        var request = URLRequest(url: api.url)
        request.httpMethod = api.method
        request.allHTTPHeaderFields = api.headers
        request.httpBody = api.body

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        print("STATUS: ", httpResponse.statusCode)
        
        if !(200..<300).contains(httpResponse.statusCode) {
                print("ERROR BODY:", String(data: data, encoding: .utf8) ?? "")
                throw URLError(.badServerResponse)
            }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("DECODE ERROR:", error)
            print("LOG JSON:", String(data: data, encoding: .utf8) ?? "")
            throw error
        }

    }
}

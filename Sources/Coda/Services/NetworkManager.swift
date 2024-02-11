//
//  File.swift
//  
//
//  Created by Treydin Winward on 2/5/24.
//

import Foundation

final class NetworkManager {
    
    func request<T: Codable>(session: URLSession = .shared,
                             _ endPoint: Endpoint,
                             type: T.Type) async throws -> T {
        
        guard let url = endPoint.url else {
            throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, endPoint: endPoint)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // TODO: refactor to get 400 errors?
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print(String(data: data, encoding: .utf8) ?? "")
                throw NetworkingError.invalidStatusCode(statusCode: statusCode)
            }
            throw NetworkingError.failedToDecodeData
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let res = try decoder.decode(T.self, from: data)
        
        return res
    }
}
    
// MARK: - REQUEST BUILDER
private extension NetworkManager {
    func buildRequest(from url: URL,
                      endPoint: Endpoint) -> URLRequest {
        
        var request = URLRequest(url: url)
        
        switch endPoint.methodType {
        case .GET:
            request.httpMethod = "GET"
            
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data
            
        case .PUT(let data):
            request.httpMethod = "PUT"
            request.httpBody = data
        }
        
        switch endPoint {
        case .listAvailableDocs:
            endPoint.headerItems?.forEach {
                request.setValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        
        return request
    }
}

    
extension NetworkManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case invalidStatusCode(statusCode: Int)
        case custom(error: Error)
        case invalidData
        case failedToDecodeData

    }
}

extension NetworkManager.NetworkingError {

     var errorDescription: String? {
         switch self {
         case .invalidUrl:
             return "URL is invalid"
         case .invalidStatusCode(let statusCode):
             return "Status code falls into the wrong range: \(statusCode)"
         case .invalidData:
             return "Response data is invalid"
         case .failedToDecodeData:
             return "Failed to decode"
         case .custom(let err):
             return "Something went wrong \(err.localizedDescription)"

         }
     }
 }

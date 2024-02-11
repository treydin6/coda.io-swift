//
//  File.swift
//  
//
//  Created by Treydin Winward on 2/5/24.
//

import Foundation

final class NetworkManager {
    
//    func request<T: Codable>(session: URLSession = .shared,
//                             _ endPoint: Endpoint,
//                             type: T.Type) async throws -> T {
//
//        guard let url = endPoint.url else {
//            throw NetworkingError.invalidUrl
//        }
//
//        let request = buildRequest(from: url, endPoint: endPoint)
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        // TODO: refactor to get 400 errors?
//        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
//            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
//                print(String(data: data, encoding: .utf8) ?? "")
//                throw NetworkingError.invalidStatusCode(statusCode: statusCode)
//            }
//            throw Error
//        }
//
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let res = try decoder.decode(T.self, from: data)
//
//        return res
//    }
}

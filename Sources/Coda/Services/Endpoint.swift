//
//  Endpoint.swift
//
//
//  Created by Treydin Winward on 2/10/24.
//

import Foundation

/// Represents various endpoints for making API requests.
///
/// This enum defines different cases for making API requests to various endpoints.
/// Each case corresponds to a specific type of API request and may accept parameters
/// as described below:
///
public enum Endpoint: Equatable {
    case listAvailableDocs(queryItems: [URLQueryItem], apiKey: String)
}

extension Endpoint {
    /// A computed property that provides human-readable descriptions for each case of the `Endpoint` enum.
    /// It returns a string describing the purpose or API operation associated with each case.
    var description: String {
        switch self {
        case .listAvailableDocs:
            return "Returns a list of available docs in your org"
        }

    }
}

extension Endpoint {
    /// An extension of the `Endpoint` enum that defines HTTP methods for API requests.
    ///
    /// This extension introduces an inner enum `MethodType` that represents various HTTP methods
    /// used for making API requests. The available methods are:
    ///
    /// - `GET`: Represents the HTTP GET method, used for retrieving data from the server.
    ///
    /// - `POST(data: Data?)`: Represents the HTTP POST method, used for creating or updating
    ///   resources on the server. It accepts an optional `Data` parameter for request body data.
    ///
    /// - `PUT(data: Data?)`: Represents the HTTP PUT method, used for updating or replacing
    ///   existing resources on the server. It also accepts an optional `Data` parameter for request
    ///   body data.
    ///
    enum MethodType: Equatable {
        case GET
        case POST(data: Data?)
        case PUT(data: Data?)
    }
}

// MARK: Properties
extension Endpoint {

    /// Enter the host of the url
    /// Example as follows for the coda API https://coda.io/apis/v1/docs?docId={id} the host will be `'coda.io'`
    var host: String {
        switch self {
        case .listAvailableDocs:
            return "coda.io/apis/v1"
        }
    }

    /// Enter the path of the url
    /// Example as follows for the coda API https://coda.io/apis/v1/docs?docId={id} the path will be `'/apis/v1/docs'`
    var path: String {
        switch self {
        case .listAvailableDocs:
            return "/docs"
        }
    }

    var methodType: MethodType {
        switch self {
        case .listAvailableDocs:
            return .GET
        }
    }

    var headerItems: [String: String]? {
        switch self {
        case .listAvailableDocs(_, let apiKey):
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .listAvailableDocs(let queryItems, _):
            return queryItems
        }
    }
}

extension Endpoint {

    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path

        var requestQueryItems = [URLQueryItem]()
        
        // sorting query items so they dont fail tests by getting switched in orders
        let sortedQueryItems = queryItems?.sorted { $0.name < $1.name }
        if let sortedQueryItems = sortedQueryItems {
            requestQueryItems = sortedQueryItems
        }

        urlComponents.queryItems = requestQueryItems
        print(urlComponents.url ?? "error constructing url")
        return urlComponents.url
    }
}

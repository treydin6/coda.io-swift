//
//  File.swift
//  
//
//  Created by Treydin Winward on 2/5/24.
//

import Foundation

/// all Functionality regarding /docs
extension CodaApi {
    
    /// Retrieves a list of available documents based on specified criteria from the Coda API.
    ///
    /// - Parameters:
    ///   - isOwner: Show only documents owned by the user. (Optional)
    ///   - isPublished: Show only published documents. (Optional)
    ///   - queryString: Search term used to filter down results. (Optional)
    ///   - sourceDoc: Show only documents copied from the specified doc ID. (Optional)
    ///   - isStarred: If true, returns documents that are starred. If false, returns documents that are not starred. (Optional)
    ///   - inGallery: Show only documents visible within the gallery. (Optional)
    ///   - workspaceId: Show only documents belonging to the given workspace. (Optional)
    ///   - folderId: Show only documents belonging to the given folder. (Optional)
    ///   - limit: Maximum number of results to return in this query. Defaults to 25 if not specified. (Non-Optional)
    ///   - pageToken: An opaque token used to fetch the next page of results. (Optional)
    ///
    /// - Note: Omitted parameters will use their default values or be excluded from the API request.
    ///
    /// Example Usage:
    /// ```swift
    /// let api = CodaApi(apiKey: "your_api_key")
    /// api.listAvailabledocs(isOwner: true, isPublished: true, queryString: "example", limit: 10)
    /// ```
    ///
    /// - Important: Ensure you have a valid API key set before making this request.
    func listAvailableDocs(queryParams: ListAvailableDocsParams) -> CodaDoc? {
        
        let params: [URLQueryItem] = queryParams.queryItems()
        
        // todo: create etwork Request
        return nil
    }

    
    
}


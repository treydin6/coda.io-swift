//
//  File.swift
//  
//
//  Created by Treydin Winward on 2/5/24.
//

import Foundation

struct ListAvailableDocsParams {
    /// Show only documents owned by the user.
    var isOwner: Bool?
    
    /// Show only published documents.
    var isPublished: Bool?
    
    /// Search term used to filter down results.
    var queryString: String?
    
    /// Show only documents copied from the specified doc ID.
    var sourceDoc: String?
    
    /// If true, returns documents that are starred. If false, returns documents that are not starred.
    var isStarred: Bool?
    
    /// Show only documents visible within the gallery.
    var inGallery: Bool?
    
    /// Show only documents belonging to the given workspace.
    var workspaceId: String?
    
    /// Show only documents belonging to the given folder.
    var folderId: String?
    
    /// Maximum number of results to return in this query. defaults to 25
    var limit: Int?
    
    /// An opaque token used to fetch the next page of results.
    var pageToken: String?
    
    /// Initializes a new instance of `ListAvailableDocsParameters`.
    init() {}
    
    /// Constructs an array of URLQueryItem from the struct properties.
    func queryItems() -> [URLQueryItem] {
        var items: [URLQueryItem] = []
        
        if let isOwner = isOwner {
            items.append(URLQueryItem(name: "isOwner", value: "\(isOwner)"))
        }
        
        if let isPublished = isPublished {
            items.append(URLQueryItem(name: "isPublished", value: "\(isPublished)"))
        }
        
        if let queryString = queryString {
            items.append(URLQueryItem(name: "queryString", value: queryString))
        }
        
        if let sourceDoc = sourceDoc {
            items.append(URLQueryItem(name: "sourceDoc", value: sourceDoc))
        }
        
        if let isStarred = isStarred {
            items.append(URLQueryItem(name: "isStarred", value: "\(isStarred)"))
        }
        
        if let inGallery = inGallery {
            items.append(URLQueryItem(name: "inGallery", value: "\(inGallery)"))
        }
        
        if let workspaceId = workspaceId {
            items.append(URLQueryItem(name: "workspaceId", value: workspaceId))
        }
        
        if let folderId = folderId {
            items.append(URLQueryItem(name: "folderId", value: folderId))
        }
        
        if let limit = limit {
            var limit = limit
            if limit < 0 {
                limit = 1
            }
            #warning("Check the max")
            if limit > 100 {
                limit = 100
            }
            items.append(URLQueryItem(name: "limit", value: "\(limit)"))
        }
        
        if let pageToken = pageToken {
            items.append(URLQueryItem(name: "pageToken", value: pageToken))
        }
        
        return items
    }
}

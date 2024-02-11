//
//  CodaDoc.swift
//  
//
//  Created by Treydin Winward on 2/10/24.
//

import Foundation

public struct CodaDoc: Codable {
    let items: [Doc]
    let href: String
    let nextPageToken: String?
    let nextPageLink: String?
}

struct Doc: Codable {
    let id: String
    let type: String
    let href: String
    let browserLink: String
    let name: String
    let owner: String
    let ownerName: String
    let createdAt: String
    let updatedAt: String
    let workspace: WorkspaceReference
    let folder: FolderReference
    let icon: Icon
    let docSize: DocSize
    let sourceDoc: SourceDoc?
    let published: DocPublished?
}

struct WorkspaceReference: Codable {
    let id: String
    let type: String
    let browserLink: String
    let organizationId: String?
    let name: String?
}

struct FolderReference: Codable {
    let workspaceId: String
    let folderId: String
}

struct Icon: Codable {
    let name: String
    let type: String
    let browserLink: String
}

struct DocSize: Codable {
    let totalRowCount: Int
    let tableAndViewCount: Int
    let pageCount: Int
    let overApiSizeLimit: Bool
}

struct SourceDoc: Codable {
    let id: String
    let type: String
    let href: String
    let browserLink: String
}

struct DocPublished: Codable {
    let browserLink: String
    let discoverable: Bool
    let earnCredit: Bool
    let mode: DocPublishMode
    let categories: [DocCategory]
    let description: String?
    let imageLink: String?

    enum DocPublishMode: String, Codable {
        case view
        case play
        case edit
    }

    struct DocCategory: Codable {
        let name: String
        let description: String?
    }
}

//
//  File.swift
//  
//
//  Created by Treydin Winward on 2/5/24.
//

import XCTest
@testable import Coda

final class ListAvailableDocsTests: XCTestCase {
    
    func testExample() throws {
        let coda = CodaApi(apiKey: "c408da02-4db3-43cf-9d5e-59ffbe2775b5")
        var queryParams = ListAvailableDocsParams()
        queryParams.isOwner = true
        queryParams.isPublished = true
        queryParams.queryString = "query string"
        queryParams.sourceDoc = "source doc"
        queryParams.isStarred = false
        queryParams.inGallery = true
        queryParams.workspaceId = "workspavcedi"
        queryParams.folderId = "folderid"
        queryParams.limit = 23
        queryParams.pageToken = "page token"
        let res = coda.listAvailabledocs(queryParams: queryParams)
        print(res)
    }
}

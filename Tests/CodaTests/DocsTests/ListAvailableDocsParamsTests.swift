//
//  ListAvailableDocsParamsTests.swift
//  
//
//  Created by Treydin Winward on 2/10/24.
//

import XCTest
@testable import Coda

final class ListAvailableDocsParamsTests: XCTestCase {

    func testQueryParams() {
        var queryParams = ListAvailableDocsParams()
        queryParams.isOwner = true
        queryParams.isPublished = true
        queryParams.queryString = "query string"
        queryParams.sourceDoc = "source doc"
        queryParams.isStarred = false
        queryParams.inGallery = false
        queryParams.workspaceId = "work space Id"
        queryParams.folderId = "folder Id"
        queryParams.limit = 23
        queryParams.pageToken = "page token"
        
        XCTAssert(queryParams.isOwner == true)
        XCTAssert(queryParams.isPublished == true)
        XCTAssert(queryParams.isStarred == false)
        XCTAssert(queryParams.inGallery == false)
        
        XCTAssert(queryParams.queryString == "query string")
        XCTAssert(queryParams.sourceDoc == "source doc")
        XCTAssert(queryParams.workspaceId == "work space Id")
        XCTAssert(queryParams.folderId == "folder Id")
        XCTAssert(queryParams.pageToken == "page token")
    }
    
    func test_limit_with_negative(){
        let queryParams = ListAvailableDocsParams(limit: -5)
        let params = queryParams.queryItems()
        
        
        XCTAssertEqual(params[0].name, "limit")
        XCTAssertEqual(params[0].value, "1")
    }
    
    func test_limit_with_positive(){
        let queryParams = ListAvailableDocsParams(limit: 150)
        let params = queryParams.queryItems()

        XCTAssertEqual(params[0].name, "limit")
        XCTAssertEqual(params[0].value, "100")
    }
}

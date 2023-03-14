//
//  PhotoViewModelTest.swift
//  firstTests
//
//  Created by Sanjay, Vaishnavi on 03/03/23.
//

import XCTest
@testable import first

class PhotoViewModelTest: XCTestCase {
    var photoArray: [Photos]!
    
    override func setUp() {
        super.setUp()
        var photoArray = [Photos]()
    }

    func testGetPersonList() {
        let expectation = XCTestExpectation(description: #function)
        var apiResult : Result = .failure

        let viewModel = photoViewModel()
        viewModel.getPhotoList { result in

            switch result {
            case .success:
                apiResult = result
            case .failure:
                apiResult = result
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)

        XCTAssert( apiResult == .success, "Error while accessing the value")



        XCTAssert(viewModel.numberOfRows() > 0)
        XCTAssert(viewModel.numberOfSections() > 0)
    }

    override func tearDown() {
        photoArray = nil
        super.tearDown()
    }
}

    
    

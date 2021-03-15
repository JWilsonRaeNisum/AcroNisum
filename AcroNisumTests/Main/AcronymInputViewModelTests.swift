//
//  AcronymInputViewModelTests.swift
//  AcroNisumTests
//
//  Created by Joaquin Wilson on 15-03-21.
//

import XCTest
import AcroNisum

class AcronymInputViewModelTests: XCTestCase {

    var mockAPI: MockAPIAcronym?
    var sut: AcronymInputViewModel?

    override func setUp() {
        super.setUp()
        mockAPI = MockAPIAcronym(isSuccess: true)
        sut = AcronymInputViewModel(api: mockAPI!)
    }

    override func tearDown() {
        sut = nil
        mockAPI = nil
        super.tearDown()
    }


    func testViewModelApiSuccessCall() {
        //given

        //when
        mockAPI?.getAcronymFor(
            shortForm: "testShort",
            longForm: nil,
            onSuccess: {_,_ in },
            onError: {_, _ in}
        )

        //then
        XCTAssertTrue(mockAPI!.getAcronymForCalled)
        XCTAssertEqual("testShort", mockAPI!.getAcronymForShortForm)
    }


}

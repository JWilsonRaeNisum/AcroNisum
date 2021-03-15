//
//  MockAPIAcronym.swift
//  AcroNisumTests
//
//  Created by Joaquin Wilson on 15-03-21.
//

import Foundation

class MockAPIAcronym: APIAcronymService {
    var isSuccess: Bool
    var getAcronymForCalled = false
    var getAcronymForSuccessCalled = false
    var getAcronymForFailureCalled = false

    var getAcronymForShortForm: String = ""

    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }

    func getAcronymFor(
        shortForm: String,
        longForm: String?,
        onSuccess: @escaping ([AcronymResponse], Int) -> Void,
        onError: @escaping ErrorCallBack) {

        getAcronymForCalled = true
        getAcronymForShortForm = shortForm
    }
}

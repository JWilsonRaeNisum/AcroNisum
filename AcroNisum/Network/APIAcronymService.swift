//
//  APIAcronymService.swift
//  AcroNisum
//
//  Created by Joaquin Wilson on 15-03-21.
//

protocol APIAcronymService {
    func getAcronymFor(shortForm: String,
                       longForm: String?,
                       onSuccess: @escaping ([AcronymResponse], Int) -> Void,
                       onError: @escaping ErrorCallBack)
}

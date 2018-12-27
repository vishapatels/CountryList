
//
//  File.swift
//  CountryList
//
//  Created by smitesh patel on 2018-12-26.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

protocol ManagerInjected {}

extension ManagerInjected {
    
    var apiManager: APIManagerProtocol {
        return ManagerInjector.apiManager
    }

}

struct ManagerInjector {
    static var apiManager: APIManagerProtocol = APIManager()

}

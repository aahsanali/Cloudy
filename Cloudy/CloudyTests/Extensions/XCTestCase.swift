//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Naveed A. on 03.01.23.
//  Copyright © 2023 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase{
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data{
     
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        return try! Data(contentsOf: url!)
    }
    
}

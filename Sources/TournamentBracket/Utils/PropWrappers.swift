//
//  PropWrappers.swift
//  Brackets
//
//  Created by Manikandan on 20/08/24.
//

import Foundation


@propertyWrapper

struct Capitalised{
    var wrappedValue: String{
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

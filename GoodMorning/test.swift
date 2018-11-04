//
//  test.swift
//  GoodMorning
//
//  Created by Stephanie Fong on 11/3/18.
//  Copyright © 2018 Esha Madhekar. All rights reserved.
//

import UIKit

class test: NSObject {
    func trial() {
        var a = Info()
        print(a)
        a.addTag(category: "Cold", tag: "Sweater")
        print(a)
    }
}

struct Info {
    var data: [String: [String]] = [:]
    
    init () {
        let categories: [String] = ["Cold", "Hot", "Winter", "Summer"]
        for category in categories {
            data[category] = []
        }
    }
    
    mutating func addTag(category: String, tag: String) {
        data[category]?.append(tag)
    }
    
}

var a = test()

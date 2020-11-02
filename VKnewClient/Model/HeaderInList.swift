//
//  File.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 29.10.2020.
//

import Foundation

struct Menu {
    var header: Sting!
    var row: [Sting]!
    
    init(header: Sting, row: [Sting]) {
        self.header = header
        self.row = row
    }
}

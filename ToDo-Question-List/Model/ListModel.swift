//
//  ListModel.swift
//  ToDo-List
//
//  Created by Ahmed Fathy on 12/09/2021.
//

import Foundation

struct ListModel: Codable {
    var title: String
    var discription: String
    var isClosed:Bool? = false
}

//
//  File.swift
//  catfact
//
//  Created by subrata Samartha on 25/04/23.
//

//step-1 create a datamodel to decode the json response from api

import Foundation
struct APIDataModel:Decodable {
    var fact: String
//    var length: Int
}

//
//  photos.swift
//  againyoutube
//
//  Created by Sanjay, Vaishnavi on 21/02/23.
//

import Foundation
struct Photos : Decodable{
    let albumId : Int
    let id : Int
    let title : String
    let url : String
    let thumbnailUrl: String
}

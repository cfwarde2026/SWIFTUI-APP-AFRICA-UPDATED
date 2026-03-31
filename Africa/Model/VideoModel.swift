//
//  VideoModel.swift
//  Africa
//
//  Created by Cormac Warde on 3/31/26.
//

import Foundation

struct Video: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
   
    //COMPUTED PROPERTY
    var thumbnail: String {
        "video-\(id)"
    }
}

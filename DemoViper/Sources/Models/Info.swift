//
//  Info.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class Info {
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let owner: Owner

    init(id: Int,
         name: String,
         fullName: String,
         description: String,
         owner: Owner) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.description = description
        self.owner = owner
    }
}

// MARK: - Codable
extension Info: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case owner
    }
}

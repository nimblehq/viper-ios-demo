//
//  RepoRouterInput.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol RepoRouterInput: AnyObject {
    func back()
    func showError(_ error: Error)
    func openWebPage(at path: String)
}
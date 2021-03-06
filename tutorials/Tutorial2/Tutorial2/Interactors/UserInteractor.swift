//
//  UserInteractor.swift
//  Tutorial2
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import Foundation

protocol UserInteractorInput: AnyObject {

    var isLoggedIn: Bool { get }
    var savedEmail: String? { get }

    func validate(email: String) -> Bool
    func validate(pass: String) -> Bool
    func logIn(email: String, pass: String)
    func logOut()
}

protocol UserInteractorOutput: AnyObject {

    func userDidLogin()
    func userDidFailToLogin(message: String)
}

final class UserInteractor {

    weak var output: UserInteractorOutput?

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

// MARK: - UserInteractorInput

extension UserInteractor: UserInteractorInput {

    var isLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: "UserInteractor.isLoggedIn")
        }
        set {
            userDefaults.set(newValue, forKey: "UserInteractor.isLoggedIn")
        }
    }

    var savedEmail: String? {
        get {
            return userDefaults.string(forKey: "UserInteractor.savedEmail")
        }
        set {
            userDefaults.set(newValue, forKey: "UserInteractor.savedEmail")
        }
    }

    func validate(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func validate(pass: String) -> Bool {    
        return !pass.isEmpty
    }

    func logIn(email: String, pass: String) {
        // just fake login logic
        if email.lowercased() == "admin@admin.admin" && pass.lowercased() == "admin" {
            isLoggedIn = true
            savedEmail = email
            output?.userDidLogin()
        } else {
            output?.userDidFailToLogin(message: "Wrong email or password!")
        }
    }

    func logOut() {
        userDefaults.removeObject(forKey: "UserInteractor.isLoggedIn")
        userDefaults.removeObject(forKey: "UserInteractor.savedEmail")
        userDefaults.synchronize()
    }
}

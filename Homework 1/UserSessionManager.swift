//
//  UserSessionManager.swift
//  Homework 1
//
//  Created by Руслан Канжарбеков on 30.03.2024.
//

import Foundation

class UserSessionManager {
    static let shared = UserSessionManager()
    
    private var name: String?
    private var surname: String?
    private var phone: String?
    private var sessionCreationDate: Date?
    
    private init() {
        
    }
    
    func startSession(name: String, surname: String, phone: String) {
        self.name = name
        self.surname = surname
        self.phone = phone
        sessionCreationDate = Date()
    }
    
    func endSession() {
        name = nil
        surname = nil
        phone = nil
        sessionCreationDate = nil
    }
    
    func isSessionActive() -> Bool {
        return name != nil && surname != nil && phone != nil && sessionCreationDate != nil
    }
    
    func getName() -> String? {
        return name
    }
    
    func getSurname() -> String? {
        return surname
    }
    
    func getPhone() -> String? {
        return phone
    }
}

//
//  userFavoriteData.swift
//  catfact
//
//  Created by subrata Samartha on 27/04/23.
//

import Foundation

class UserData {
    static var shared = UserData()

//      Accessing shared default objects
    let userDefaults = UserDefaults.standard
    
    var favFactArrat: [String] = []
    
    private init() {
        favFactArrat = (userDefaults.object(forKey: "favFacts") as? [String])!
    }
    
    func addFactToUserData(factOnScreen:String) {
        if !favFactArrat.contains(factOnScreen) {
            favFactArrat.append(factOnScreen)
            userDefaults.set(favFactArrat, forKey: "favFacts")
            print("fact added to User Data")
        }
    }
    
    func updateUserData() {
        userDefaults.set(favFactArrat, forKey: "favFacts")
        print("User Data Updated")
    }
    

    
    
}

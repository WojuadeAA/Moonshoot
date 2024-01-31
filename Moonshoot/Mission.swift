//
//  Mission.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 18/01/2024.
//

import Foundation



struct Mission : Codable , Identifiable, Hashable{
    
    
  
    
    
    struct CrewRole : Codable, Hashable {
        let name : String
        let role : String
        
    }
    static func == (lhs: Mission, rhs: Mission) -> Bool {
       return lhs.id == rhs.id
    }
    let id: Int
    let crew : [CrewRole]
    let description : String
    let launchDate : Date?
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var longForamttedLaunchDate : String {
        launchDate?.formatted(date: .complete, time: .standard) ?? "N/A"
    }
    
}

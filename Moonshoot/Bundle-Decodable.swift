//
//  Bundle-Decodable.swift
//  Moonshoot
//
//  Created by Wojuade Abdul Afeez on 18/01/2024.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String )-> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load data of \(file)")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "Y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Unable to decode loaded data from \(file)")
        }
        
        return decodedData
    }
}

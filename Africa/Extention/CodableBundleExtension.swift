//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Cormac Warde on 3/30/26.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // LOCATE THE JSON FILE
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        //CREATE PROPERTY FOR DATA
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //CREATE A DECODER
        let decoder = JSONDecoder()
        
        //CREATE PROPERTY FOR DECODED DATA
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        //RETURN THE READY-TO-USE DATA
        
        return loaded
    }
    
}

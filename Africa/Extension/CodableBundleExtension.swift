//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by pranay chander on 26/03/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf:url) else {
            fatalError("failed to load \(file) from bundle")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("failed to decode \(file) from bundle")
        }

        return loaded

    }
}

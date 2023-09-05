//
//  CastData.swift
//  Obi
//
//  Created by Devin Ercolano on 4/20/23.
//

import Foundation

class CastData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("scrums.data")
    }
    @Published var casts: [CastResult] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
#if DEBUG
                DispatchQueue.main.async {
                    self?.casts = CastResult.data
                }
#endif
                return
            }
            guard let listCasts = try? JSONDecoder().decode([CastResult].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.casts = listCasts
            }
        }
    }
}

//
//  Notes.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Note : Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var note: String
    var date: String
}

extension Encodable {
    func asDictionary() -> [String: Any]  {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

//
//  ToDoOptions.swift
//  ThriftyTrails
//
//  Created by Tanvi Shah on 11/05/2024.
//

import Foundation

struct OptionModel: Hashable {
    var title: String
    var subtitle: String?
    var isSelected: Bool = false
}

extension OptionModel {
    static func getToDoList() -> [OptionModel] {
        let options = ["Kid Friendly", "Museums", "Art & Cultural", "Shopping", "Outdoor Adventures", "Historical"]
        
        return options.map { OptionModel(title: $0) }
    }
    
    static func getActivityPerDayList() -> [OptionModel] {
        [
            OptionModel(title: "Chill", subtitle: "1 - 2 activities"),
            OptionModel(title: "Touristy", subtitle: "2 - 3 activities"),
            OptionModel(title: "Packed", subtitle: "3 or more activities")
        ]
    }

}

//
//  ReminderService.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 05/06/2023.
//

import Foundation
import CoreData
import UIKit

class ReminderService {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    static func save() throws {
        try viewContext.save()
    }
    
    // ** go to Provider after this  **
    static func saveMyList(_ name: String, _ color:UIColor, _ medname: String, _ dose: String)
    
    throws {
        let myList = MyList(context: viewContext)
        myList.name = name
        myList.medname = medname
        myList.dose = dose
        myList.color = color
        try save()
        
    }
    
    static func deleteMyList(_ myList: MyList) throws {
        viewContext.delete(myList)
        try save()
    }
    
}



//    static func updateReminder(reminder: Reminder, editConfig: ReminderEditConfig) throws -> Bool {
//
//        let reminderToUpdate = reminder
//        reminderToUpdate.isCompleted = editConfig.isCompleted
//        reminderToUpdate.title = editConfig.title
//        reminderToUpdate.notes = editConfig.notes
//        reminderToUpdate.reminderDate = editConfig.hasDate ? editConfig.reminderDate: nil
//        reminderToUpdate.reminderTime = editConfig.hasTime ? editConfig.reminderTime: nil
//
//        try save()
//        return true
//    }


//    static func saveReminderToMyList(myList: MyList, myListName: String) throws {
//        let myList = MyList(context: viewContext)
//        myList.name = myListName
//        try save()
//    }
    

//    static func getRemindersByList(myList: MyList) -> NSFetchRequest<Reminder> {
//        let request = Reminder.fetchRequest()
//        request.sortDescriptors = []
//        request.predicate = NSPredicate(format: "list = %@ AND isCompleted = false", myList)
//        return request
//    }
//}

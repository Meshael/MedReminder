//
//  MyList+CoreDataProperties.swift
//  MedReminder
//
//  Created by Mashael Alharbi on 05/06/2023.
//

import Foundation
import CoreData
import UIKit

extension MyList {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList> (entityName: "MyList")
      }
        
        @NSManaged public var name: String
        @NSManaged public var medname: String
        @NSManaged public var dose: String
//        @NSManaged public var meddate: Date
//        @NSManaged public var med: UIImage
        @NSManaged public var color: UIColor

    }

extension MyList: Identifiable {

//    public var id = UUID()
        // Add properties here
    
}

//extension MyList {
    
//    @objc(addRemindersObject:)
//    @NSManaged public func addToReminders(_ value: Reminder)
//
//    @objc(removeRemindersObject:)
//    @NSManaged public func removeFromReminders(_ value: Reminder)
//
//    @objc(addReminders:)
//    @NSManaged public func addToReminders(_ value: NSSet)
//
//    @objc(removeReminders:)
//    @NSManaged public func removeFromReminders(_ value: NSSet)
//
//}

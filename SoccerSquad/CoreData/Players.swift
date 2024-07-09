//
//  Players+CoreDataProperties.swift
//
//
//  Created by Роман on 08.07.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Players)
public class Players: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        return NSFetchRequest<Players>(entityName: "Players")
    }

    
    @NSManaged public var number: Int16
    @NSManaged public var age: Int16
    @NSManaged public var foto: UIImage?
    @NSManaged public var name: String?

}

extension Players : Identifiable {

}

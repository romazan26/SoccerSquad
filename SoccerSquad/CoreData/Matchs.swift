//
//  Matchs+CoreDataProperties.swift
//
//
//  Created by Роман on 10.07.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Matchs)
public class Matchs: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Matchs> {
        return NSFetchRequest<Matchs>(entityName: "Matchs")
    }

    @NSManaged public var colorFirst: UIColor?
    @NSManaged public var colorSecond: UIColor?
    @NSManaged public var scoreFirst: Int16
    @NSManaged public var scoreSecond: Int16
    @NSManaged public var titleFirst: String?
    @NSManaged public var titleSecond: String?
    @NSManaged public var winFirst: Bool

}

extension Matchs : Identifiable {

}

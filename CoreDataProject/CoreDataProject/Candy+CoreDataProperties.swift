//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Munir Wanis | Stone on 07/04/20.
//  Copyright © 2020 Munir Wanis. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

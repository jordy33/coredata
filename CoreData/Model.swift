//
//  Model.swift
//  CoreData
//
//  Created by Jorge Macias on 11/21/14.
//  Copyright (c) 2014 Diincasa. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)
class Model: NSManagedObject {
    @NSManaged var item: String
    @NSManaged var quantity: String
    @NSManaged var info:String
}

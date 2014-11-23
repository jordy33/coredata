//
//  itemViewController.swift
//  CoreData
//
//  Created by Jorge Macias on 11/21/14.
//  Copyright (c) 2014 Diincasa. All rights reserved.
//

import UIKit
import CoreData

class itemViewController: UIViewController {
    var data = [NSManagedObject]()
    @IBOutlet weak var textFieldItem: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var textFieldInfo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func saveTapped(sender: UIBarButtonItem) {
//        // Referebce to our app delegate
//        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as AppDelegate
//        // Reference moc Managed Object Context
//        let contxt: NSManagedObjectContext! = appDel.managedObjectContext
//        let en = NSEntityDescription.entityForName("List",inManagedObjectContext:contxt)
//        // Create instance of our data model and initialize
//        var newItem = Model(entity:en!,insertIntoManagedObjectContext: contxt)
//        // Map our properties
//        newItem.item = textFieldItem.text
//        newItem.quantity = textFieldItem.text
//        newItem.info = textFieldItem.text
//        // Save our context
//        contxt.save(nil)
//        println("Data:")
//        println(newItem)
        //
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity =  NSEntityDescription.entityForName("List",
            inManagedObjectContext:
            managedContext)
        let newData = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        newData.setValue(textFieldItem.text, forKey: "item")
        newData.setValue(textFieldQuantity.text, forKey: "quantity")
        newData.setValue(textFieldInfo.text, forKey: "info")
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        println(newData)
        println("Object Saved")

        // navigate back to root vc
        self.navigationController?.popToRootViewControllerAnimated(true)
            }
    
    
    @IBAction func BackButtonTapped(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"List")
        //fetchRequest.predicate = NSPredicate(format: "username= %@",labelUserName.text)
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        if let results = fetchedResults {
            data = results
            println("Registers: \(data.count)")
            for i in 0..<data.count {
                let item=data[i]
                println(item.valueForKey("item") as String?)
                println(item.valueForKey("quantity") as String?)
                println(item.valueForKey("info") as String?)
             }
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }

    }
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
         self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

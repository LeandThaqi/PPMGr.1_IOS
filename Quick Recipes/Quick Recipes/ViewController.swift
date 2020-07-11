//
//  ViewController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 5.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    
    var sentCategory=""
   
    var config = Realm.Configuration(
               // Set the new schema version. This must be greater than the previously used
               // version (if you've never set a schema version before, the version is 0).
               schemaVersion: 4,
               
               // Set the block which will be called automatically when opening a Realm with
               // a schema version lower than the one set above
               migrationBlock: { migration, oldSchemaVersion in
                   // We haven’t migrated anything yet, so oldSchemaVersion == 0
                   if (oldSchemaVersion < 1) {
                       // Nothing to do!
                       // Realm will automatically detect new properties and removed properties
                       // And will update the schema on disk automatically
                   }
           })
    
  
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background_main.png")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
         let realm = try! Realm(configuration: config)
        //FillDatabase().fillDatabase()
       
       // print(realm.configuration.fileURL)
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])        // Do any additional setup after loading the view.
    }
    

    @IBAction func mainDishesBtn(_ sender: UIButton) {
        sentCategory="MainDishes"
        performSegue(withIdentifier: "showTableView", sender: self)
    }
    
    
    
    @IBAction func healthyBtn(_ sender: UIButton) {
        sentCategory="Healthy"
        performSegue(withIdentifier: "showTableView", sender: self)
    }
    
    @IBAction func dessertsBtn(_ sender: UIButton) {
        sentCategory="Desserts"
        performSegue(withIdentifier: "showTableView", sender: self)
    }
    
    @IBAction func drinksBtn(_ sender: UIButton) {
        sentCategory="Drinks"
        performSegue(withIdentifier: "showTableView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC=segue.destination as! MyTableViewController
        nextVC.recievedCategory=sentCategory
    }
}


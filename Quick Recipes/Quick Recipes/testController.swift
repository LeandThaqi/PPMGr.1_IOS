//
//  testController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 6.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit
import RealmSwift

class testController: UIViewController {

    @IBOutlet weak var labela: UILabel!
    var config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 2,
        
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
    var realm:Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FillDatabase().fillDatabase()
        realm = try! Realm(configuration: config)
        /*
        try! realm.write{
            realm.deleteAll()
        }*/
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func test(_ sender: UIButton) {
       let recipes=realm.objects(Recipe.self)
       labela.text=recipes[0].instructions    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

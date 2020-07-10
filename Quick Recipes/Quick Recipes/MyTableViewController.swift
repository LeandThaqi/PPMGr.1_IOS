//
//  TableViewController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 6.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit
import RealmSwift

class MyTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var recievedCategory=""
    var sentName=""
    var config = Realm.Configuration(
               // Set the new schema version. This must be greater than the previously used
               // version (if you've never set a schema version before, the version is 0).
               schemaVersion: 3,
               
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
    
    var recipes:Results<Recipe>!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=indexPath.row
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        customCell.configure(with: recipes[row].name, imgFood: recipes[row].imagePath, time: recipes[row].timeNeeded,
                             imgTime:"ic_access_time_18pt.png", persons:recipes[row].persons, imgPersons: "ic_people_12pt_2x.png")
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sentName=recipes[indexPath.row].name
        performSegue(withIdentifier: "fromCellToRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC=segue.destination as! RecipeViewController
        nextVC.receivedName=sentName
    }
    
    
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=recievedCategory
        let realm = try! Realm(configuration: config)
        recipes=realm.objects(Recipe.self).filter("category contains '"+recievedCategory+"'")
        myTableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        myTableView.delegate=self
        myTableView.dataSource=self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

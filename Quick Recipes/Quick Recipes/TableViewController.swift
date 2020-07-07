//
//  TableViewController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 6.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var table: UITableView!
    let realm = try! Realm()
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
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        //recipes=realm.objects(Recipe.self)
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.delegate=self
        table.dataSource=self

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

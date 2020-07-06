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
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        //FillDatabase().fillDatabase()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func test(_ sender: UIButton) {
        let recipes=realm.objects(Recipe.self)
        labela.text=recipes[0].instructions
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

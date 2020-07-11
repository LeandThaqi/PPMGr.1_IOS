//
//  RecipeViewController.swift
//  Quick Recipes
//
//  Created by Leand Thaqi on 8.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeViewController: UIViewController {

    @IBOutlet weak var imageViewFood: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageViewTime: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imageViewPersons: UIImageView!
    @IBOutlet weak var lblPersons: UILabel!
    @IBOutlet weak var txtViewInstructions: UITextView!
    @IBOutlet weak var txtViewIngredients: UITextView!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var isFavorite=false
    var receivedName=""
    var realm:Realm!
    
    var recipe:Results<Recipe>!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm(configuration: config)
        recipe=realm.objects(Recipe.self).filter("name contains '"+receivedName+"'")
        print("Leandi : %@",recipe.count)
        print("Query: name contains '"+receivedName+"'")
        imageViewFood.image=UIImage(named: recipe[0].imagePath)
        lblName.text=recipe[0].name
        imageViewTime.image=UIImage(named:"ic_access_time_18pt.png")
        imageViewPersons.image=UIImage(named:"ic_people_12pt_2x.png")
        lblTime.text=recipe[0].timeNeeded
        lblPersons.text=recipe[0].persons
        txtViewIngredients.text=recipe[0].ingredients
        txtViewInstructions.text=recipe[0].instructions
        
        isFavorite=recipe[0].isFavorite
        setFavoriteImage()
        
       
        
        // Do any additional setup after loading the view.
    }
    
    func setFavoriteImage(){
        if(isFavorite){
            btnFavorite.setImage(UIImage(named: "fillHeart.png"), for: .normal)
        }else{
            btnFavorite.setImage(UIImage(named: "Heart.png"), for: .normal)
        }
    }
    @IBAction func setFavorite(_ sender: UIButton) {
        btnFavorite.isEnabled=false
        if(isFavorite){
            try! realm.write{
                recipe[0].isFavorite=false
            }
            isFavorite=false
            setFavoriteImage()
            btnFavorite.isEnabled=true
            
        }
        else{
            try! realm.write{
                recipe[0].isFavorite=true
            }
            isFavorite=true
            setFavoriteImage()
            btnFavorite.isEnabled=true
        }
        
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

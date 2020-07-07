//
//  MyTableViewCell.swift
//  Quick Recipes
//
//  Created by Egzona Grashtica on 7.7.20.
//  Copyright © 2020 Leand Thaqi. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier="MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle:nil)
    }
    
    public func configure(with name:String, imgFood:String,time:String,imgTime:String,persons:String,imgPersons:String){
        lblName.text = name
        imgViewFood.image = UIImage(named:imgFood)
        lblTime.text = time
        imgViewTime.image=UIImage(named: imgTime)
        lblPersons.text=persons
        imgViewPersons.image=UIImage(named: imgPersons)
    }
    
    @IBOutlet weak var lblPersons: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgViewPersons: UIImageView!
    @IBOutlet weak var imgViewTime: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgViewFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ContactCollectionViewCell.swift
//  ColectionView
//
//  Created by Teslenko Anastasiya on 11.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {
    //MARK:Сonnect nib file
    static let identifier = "ContactCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ContactCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    var setContact: Contact! {
           didSet {
            contactPhoto.image = setContact.photo
            //contactNumber.text = setContact.name
            contactName.text = setContact.name
           }
       }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

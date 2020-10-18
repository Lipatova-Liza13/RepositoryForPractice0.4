//
//  Contact.swift
//  ColectionView
//
//  Created by Teslenko Anastasiya on 11.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

class Contact {
    let photo : UIImage?
    let number : String
    let name : String
    
    init? (photo : UIImage?, number : String, name : String){
        //MARK: check
        /*
        guard !(number.range(of: "\\(\\+380\\)[0-9]{9}", options: .regularExpression) == nil)else {
            return nil}
        */
        guard !name.isEmpty else {
            return nil
        }
        
        //MARK: Initializator
        self.photo = photo
        self.number = number
        self.name = name
        
    }
    
}

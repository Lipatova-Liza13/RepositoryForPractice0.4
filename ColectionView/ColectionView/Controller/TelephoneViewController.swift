//
//  TelephoneViewController.swift
//  ColectionView
//
//  Created by Teslenko Anastasiya on 11.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

class TelephoneViewController: UIViewController {
    var contacts = [Contact]()
    @IBOutlet weak var PhoneColectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellWidthHeight()
        configureCollectionView()
    }
    private func cellWidthHeight() {
           let viewWidth = view.bounds.width
           let flowLayout = UICollectionViewFlowLayout()
           //отступы от крaя view
           let padding : CGFloat = 5
           flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
           
           let distanceBetweenCell : CGFloat = 13
           let availableWidth = viewWidth - (padding * 2) - (distanceBetweenCell * 2)
           let cellWidth = availableWidth / 2
           let cellHeight = cellWidth + 50
           flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
           
           PhoneColectionView.collectionViewLayout = flowLayout
       }
    private func configureCollectionView() {
        PhoneColectionView.register(ContactCollectionViewCell.nib(), forCellWithReuseIdentifier: ContactCollectionViewCell.identifier)
    }
    

}

extension TelephoneViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }

    //UIKit raises an assertion if you return nil
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Create your cell using the table view's
        let cell = PhoneColectionView.dequeueReusableCell(withReuseIdentifier: ContactCollectionViewCell.identifier, for: indexPath) as! ContactCollectionViewCell
        cell.setContact = contacts[indexPath.item]
        return cell
    }
    
    private func loadContacts() {
        /*
        let avatar1 = UIImage(named: "Watermelon")
        let avatar2 = UIImage(named: "Blouse")
        let avatar3 = UIImage(named: "Trousers")

        guard let shop1 = Shop(avatar: avatar1, itemName: "Watermelon", price: "789") else {
            fatalError("Unable to instantiate item1")
        }

        guard let shop2 = Shop(avatar: avatar2, itemName: "Blouse", price: "340") else {
            fatalError("Unable to instantiate item2")
        }

        guard let shop3 = Shop(avatar: avatar3, itemName: "Trousers", price: "40") else {
            fatalError("Unable to instantiate item3")
        }

        shops += [shop1, shop2, shop3]
 */
    }
    
    
}

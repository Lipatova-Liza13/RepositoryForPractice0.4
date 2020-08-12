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
        configureCollectionView()
        cellWidthHeight()
        
        loadContacts()
        PhoneColectionView.register(ContactCollectionViewCell.nib(), forCellWithReuseIdentifier: ContactCollectionViewCell.identifier)
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
        
        let avatar1 = UIImage(named: "tyrionlannister")
        let avatar2 = UIImage(named: "VerkaSerduchka")
        let avatar3 = UIImage(named: "smurf")
        let avatar4 = UIImage(named: "tyrionlannister")
        let avatar5 = UIImage(named: "Pushkin")
        let avatar6 = UIImage(named: "angelaMerkel")
        guard let cont1 = Contact(photo: avatar1, number: "+(380)959677839", name: "Tyrion Lannister") else {
            fatalError("Unable to instantiate contact1")
        }

        guard let cont2 = Contact(photo: avatar2, number: "+(380)959677839", name: "Verka Serduchka") else {
            fatalError("Unable to instantiate contact2")
        }

        guard let cont3 = Contact(photo: avatar3, number: "+(380)959677839", name: "Smurf") else {
            fatalError("Unable to instantiate contact3")
        }
        guard let cont4 = Contact(photo: avatar4, number: "+(380)959677839", name: "Tyrion Lannister") else {
            fatalError("Unable to instantiate contact4")
        }

        guard let cont5 = Contact(photo: avatar5, number: "+(380)959677839", name: "Tyrion Lannister") else {
            fatalError("Unable to instantiate contact5")
        }

        guard let cont6 = Contact(photo: avatar6, number: "+(380)959677839", name: "Angela Merkel") else {
            fatalError("Unable to instantiate contact6")
        }
        contacts += [cont1, cont2, cont3, cont4, cont5, cont6]
 
    }
    
    
}

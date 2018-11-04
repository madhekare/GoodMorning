//
//  AddViewController.swift
//  GoodMorning
//
//  Created by Stephanie Fong on 11/3/18.
//  Copyright © 2018 Esha Madhekar. All rights reserved.
//

import UIKit
import Photos

class AddViewController: UIViewController {
    
    @IBOutlet weak var addCollectionView: UICollectionView!
    let cellIdentifier = "CollectionViewCell"
    
    let numberOfSections = 1
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    let photoLibrary = PhotoLibrary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.addCollectionView.delegate = self
        self.addCollectionView.dataSource = self
        
        self.addCollectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // when view is about to appear, let's fetch the library and reload the collection view
        photoLibrary.fetchLibrary()
        self.addCollectionView.reloadData()
    }
}

extension AddViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoLibrary.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        // Set the cell's imageView to show image at correct index
        cell.cellImageView.image = photoLibrary.images[indexPath.row]
        return cell
    }
}

fileprivate let numberOfElementsInRow: Int = 4
fileprivate let cellMargin: CGFloat = 16

extension AddViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // What's our screen size
        let viewSize = self.view.bounds.size
        // Divide evenly and subtract some margin
        let cellLength = (viewSize.width / CGFloat(numberOfElementsInRow)) - cellMargin
        return CGSize(width: cellLength, height: cellLength)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let myCell = cell as! CollectionViewCell
//        myCell.cellImageView.image = nil
//        DispatchQueue.global(qos: .background).async {
//            self.photoLibrary.setPhoto(at: indexPath.row) { image in
//                if let image = image {
//                    DispatchQueue.main.async {
//                        myCell.cellImageView.image = image
//                    }
//                }
//            }
//        }
    }
}


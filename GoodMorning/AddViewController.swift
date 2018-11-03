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
    
    let numberOfSections = 1
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    let photoLibrary = PhotoLibrary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        PHPhotoLibrary.requestAuthorization { [weak self] result in
            if let _self = self {
                if result == .authorized {
                    DispatchQueue.main.async {
                        _self.addCollectionView.reloadData()
                    }
                }
            }
        }
        
        self.addCollectionView.delegate = self
        self.addCollectionView.dataSource = self

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

extension AddViewController: UICollectionViewDataSource {
    
    fileprivate var numberOfElementsInRow: Int {
        return 4
    }
    
    var sizeForCell: CGSize {
        let _numberOfElementsInRow = CGFloat(numberOfElementsInRow)
        let allWidthBetwenCells = _numberOfElementsInRow == 0 ? 0 : collectionViewFlowLayout.minimumInteritemSpacing*(_numberOfElementsInRow-1)
        let width = (addCollectionView.frame.width - allWidthBetwenCells)/_numberOfElementsInRow
        return CGSize(width: width, height: width)
    }
    
    func initCollectionView() {
        addCollectionView.dataSource = self
        addCollectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photoLibrary.count)
        return self.photoLibrary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
}

extension AddViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let myCell = cell as! CollectionViewCell
        myCell.cellImageView.image = nil
        DispatchQueue.global(qos: .background).async {
            self.photoLibrary.setPhoto(at: indexPath.row) { image in
                if let image = image {
                    DispatchQueue.main.async {
                        myCell.cellImageView.image = image
                    }
                }
            }
        }
    }
}


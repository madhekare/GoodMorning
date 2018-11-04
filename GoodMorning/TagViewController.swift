//
//  TagViewController.swift
//  GoodMorning
//
//  Created by Joy  Dong on 11/3/18.
//  Copyright © 2018 Esha Madhekar. All rights reserved.
//

import UIKit
import Photos

class TagViewController: UIViewController {
    /*
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "yourImage.png")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView) //This add it the view controller without constraints
        someImageViewConstraints() //This function is outside the viewDidLoad function that controls the constraints
    }
    
    // do not forget the `.isActive = true` after every constraint
    func someImageViewConstraints() {
        someImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }*/
    
}

/*
class TagViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 175)
        
        let imageArray = AddViewController.imgs
        
        for i in 0..<imageArray.count{
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(10, 50, 100, 300));
            imageView.image = UIImage(named:imageArray[i])
            self.view.addSubview(imageView)
            
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleToFill
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
        }
    }
}
 */
    /*
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet var dismissSegue: UISwipeGestureRecognizer!
    @IBOutlet weak var tagView: UICollectionView!
    
    @IBAction func didDismisss() {
        
    }
    let cellIdentifier = "CollectionViewCell"
    
    
    let numberOfSections = 1
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    let photoLibrary = PhotoLibrary()
    var indices = [Int]()
    
    static var imgs: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tagView.delegate = self
        self.tagView.dataSource = self
        
        self.tagView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
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
        self.tagView.reloadData()
    }
    

}

extension TagViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imgCell = collectionView.cellForItem(at: indexPath)
        
        if !(isSelected(i: indexPath, arr: indices)) {
            imgCell?.layer.borderColor = UIColor.red.cgColor
            imgCell?.layer.borderWidth = 4
            indices.append(indexPath.row)
        } else {
            if let index = indices.index(of: indexPath.row) {
                indices.remove(at: index)
            }
            imgCell?.layer.borderWidth = 0
        }
    }
    
    func isSelected(i: IndexPath, arr: [Int]) -> Bool {
        return arr.contains(i.row)
    }
}

extension TagViewController: UICollectionViewDataSource
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

extension TagViewController: UICollectionViewDelegateFlowLayout
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
    
}
*/

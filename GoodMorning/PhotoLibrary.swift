//
//  PhotoLibrary.swift
//  GoodMorning
//
//  Created by Stephanie Fong on 11/3/18.
//  Copyright © 2018 Esha Madhekar. All rights reserved.
//

import UIKit
import Photos

class PhotoLibrary
{
    var images: [UIImage] = []
    
    // Fetch images from the system photo library
    func fetchLibrary() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: true)]
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        
        fetchResult.enumerateObjects { (asset, index, stop) in
            // Convert each PHAsset into an UIImage
            PHImageManager.default().requestImage(for: asset,
                                                  targetSize: CGSize(width: 100, height: 100),
                                                  contentMode: .aspectFit,
                                                  options: requestOptions)
            { [weak self] (image: UIImage?, info) in
                // if image isn't nil, let's add it
                if let image = image { self?.images.append(image) }
            }
        }
    }
    
//    func setPhoto(at index: Int, completion block: @escaping (UIImage?)->()) {
//        
//        if index < fetchResult.count  {
//            imgManager.requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: UIScreen.main.bounds.size, contentMode: PHImageContentMode.aspectFill, options: requestOptions) { (image, _) in
//                block(image)
//            }
//        } else {
//            block(nil)
//        }
//    }
//    
//    func getAllPhotos() -> [UIImage] {
//        
//        var resultArray = [UIImage]()
//        for index in 0..<fetchResult.count {
//            imgManager.requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: UIScreen.main.bounds.size, contentMode: PHImageContentMode.aspectFill, options: requestOptions) { (image, _) in
//                
//                if let image = image {
//                    resultArray.append(image)
//                }
//            }
//        }
//        return resultArray
//    }
}

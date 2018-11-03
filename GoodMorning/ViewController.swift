//
//  ViewController.swift
//  GoodMorning
//
//  Created by Esha Madhekar on 11/3/18.
//  Copyright © 2018 Esha Madhekar. All rights reserved.
//

import UIKit
import Photos
import AVFoundation
import Vision

class MainViewController: UIViewController {
    
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var myClosetButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    fileprivate var photoLibrary: PhotoLibrary!
    fileprivate var numberOfSections = 0
    
    override func viewDidLoad() {
        
    }
    

    @IBAction func didTapGenButton() {
        NSLog("Gen")
    }
    @IBAction func didTapAddButton() {
        NSLog("added")
    }
    
    @IBAction func didTapMyClosetButton(){
        NSLog("closet")
    }

    func setupCaptureSession() {
        
        // creates a new capture session
        let captureSession = AVCaptureSession()
        
        // search for available capture devices
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        
        
        
        // get capture device, add device input to capture session
        do {
            if let captureDevice = availableDevices.first {
                let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
                
                captureSession.addInput(captureDeviceInput)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // setup output, add output to our capture session
        let captureOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(captureOutput)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
        
    }

}


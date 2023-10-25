//
//  ImageSelectedViewController.swift
//  iHolyLand
//
//  Created by duckmoutain on 2023/10/22.
//

import Foundation
import UIKit
import Photos

class ImageSelectedViewController: UIImagePickerController, UIImagePickerControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let asset = info[.phAsset] as? PHAsset
        print(asset?.creationDate ?? "None")
        print(asset?.location ?? "None")
        dismiss(animated: true, completion:nil)
    }
}

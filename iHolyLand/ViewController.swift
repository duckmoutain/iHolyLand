//
//  ViewController.swift
//  iHolyLand
//
//  Created by duckmoutain on 2023/10/22.
//

import UIKit
import SnapKit
import Photos
import CoreLocation

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var plusButton: UIButton! = nil
    var personalBtn: UIButton! = nil
    var holyLandItem: UIView = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.layoutCustomSubViews()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func layoutCustomSubViews() {
        
        let ujiItem = HolyItemView(dataModel: HolyLandModel(title: "uji", context: "LoganTestTest"))
        view.addSubview(ujiItem)
        
        let statusHeight = (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.size.height)!
        
        plusButton = UIButton()
        plusButton.setImage(UIImage(systemName: "plus"), for: UIControl.State.normal)
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(Int(statusHeight))
            make.width.height.equalTo(40)
            make.right.equalTo(view).offset(-12)
        }
        
        ujiItem.snp.makeConstraints { make in
            make.top.equalTo(plusButton.snp.bottom).offset(6)
            make.left.right.equalTo(view)
        }
        ujiItem.layoutItemSubviews()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let asset = info[.phAsset] as? PHAsset
        print(asset?.creationDate ?? "None")
        print(asset?.location?.coordinate ?? "None")
        
        let geocoder = CLGeocoder()
        let location = asset?.location ??  CLLocation(latitude: 39.6895, longitude: 139.6917)
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
                NSLog(error?.localizedDescription ?? "error")
            } else if let placemark = placemarks?.first {
                let cityName = placemark.locality
                NSLog(cityName ?? "None")
            }
        }
        
        dismiss(animated: true, completion:nil)
    }
    
    @objc func handlePlusButton() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { PHAuthorizationStatus in
            switch PHAuthorizationStatus {
                    
            case .notDetermined: break
                
            case .restricted:
                break;
            case .denied:
                break;
            case .limited:
                break;
            case .authorized:
                DispatchQueue.main.async {
                    let vc = ImageSelectedViewController()
                    vc.delegate = self
                    self.navigationController?.present(vc, animated: true)
                }
                break;
            @unknown default:
                break;
            }
        }
    }
    
    @objc func handlePersonBtn() {
        NSLog("个人按钮点击")
    }
}


//
//  ViewController.swift
//  DemoUI
//
//  Created by Hasibur Rahman on 16/4/23.
//
import PhotosUI
import UIKit

class ViewController: UIViewController, PHPickerViewControllerDelegate {

    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClicked(_ sender: UIButton) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
         let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
         self.present(picker, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self){
                object, error in
                if let image = object as? UIImage{
                    self.images.append(image)
                    print(self.images.count)
                    // better way
                   //   DispatchQueue.main.async {
                    //        if results.count == self.images.count{
                     //           self.goTo()
                     //       }
                    print(image)
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.goTo()
        }
    }
    
    func goTo(){
        print("In GoTo")
       // singleton.images = images
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewVC") as! PhotoViewVC // storeyboard id for PhotoViewVC used  no segue is used
        vc.images = images
        navigationController?.pushViewController(vc, animated: true)
    }
}


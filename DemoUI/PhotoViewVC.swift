//
//  PhotoViewVCViewController.swift
//  DemoUI
//
//  Created by Hasibur Rahman on 16/4/23.
//

import UIKit

class PhotoViewVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var enlargeImage: UIImageView!
    var timer: Timer!
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("IN PhotoViewVC \(images.count)")
        // Do any additional setup after loading the view.
        
        // set ImageView to slideshow all the images repeatedly
        startTimer()
    }
    
    // set ImageView to slideshow all the images repeatedly
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setImages), userInfo: nil, repeats: true)
        
       
    }
                                     
    @objc func setImages(){
        print("Startin Timer...")
        enlargeImage.image = images.randomElement()
        
            
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
       // cell.slidingImage.image = images[indexPath.row]
        cell.layer.cornerRadius = 10.0
        cell.myLabel.text = "Image no. \(indexPath.row)"
        
        return cell
        
    }
    
    
    
    
    // making the image show in the canvas
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       print("In didSelect")
//        enlargeImage.image = images[indexPath.item]
//        print("Done")
//    }
    
    
    
    
    // delegate flowlayout
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: (collectionView.frame.size.width)/1.5 - 10.0, height: (collectionView.frame.size.width)/1.5 - 10.0 )
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
    

}

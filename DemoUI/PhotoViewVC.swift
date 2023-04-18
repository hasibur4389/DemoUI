//
//  PhotoViewVCViewController.swift
//  DemoUI
//
//  Created by Hasibur Rahman on 16/4/23.
//

import UIKit

class PhotoViewVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet var myProgressView: UIProgressView!
    @IBOutlet var enlargeImage: UIImageView!
    var timer: Timer!
    var progressViewInterval: Float!
    
    var currentIndex: Int!
    
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("IN PhotoViewVC \(images.count)")
        
        myProgressView.progress = 0.0
        progressViewInterval = (1.0/Float(images.count))
        currentIndex = 0
        
        // Do any additional setup after loading the view.
        
        // set ImageView to slideshow all the images repeatedly
        // startTimer()
        //startSlideShow()
        
        let queue = DispatchQueue(label: "hasibur Queues", attributes: .concurrent)
        
        queue.async { [self] in
            
            let imagePreview = ImagePreview()
            imagePreview.startSlideShow(delegate: self)
            
        }
        
     //  animateProgressView()
        
    }
    
    
    func animateProgressView(){
       
        let duration = TimeInterval(images.count)
        
        print("in ProgresMethod and the duration is \(duration)")
        
        
            UIView.animate(withDuration: duration, animations: {
                
                
                    self.myProgressView.setProgress(1.0, animated: true)
                
               
            }, completion: { finished in
                
               
                    self.myProgressView.setProgress(0.0, animated: false)
                    self.animateProgressView()
                
            })
        
            
        
        
        
    }
        
        //set ImageView to slideshow all the images repeatedly
        //    func startTimer(){
        //        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setImages), userInfo: nil, repeats: true)
        //
        
        //    }
        
        //View Disapear
        //    override func viewDidAppear(_ animated: Bool) {
        //        images = []
        //        myProgressView.progress = 0.0
        //    }
        
        
        
        
        //    func startSlideShow(){
        //        print("in Slideshow..")
        //        while true{
        //            print("in while true")
        //            for _ in 0...images.count-1{
        //                print("in for loop")
        //                self.setImages()
        ////                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        ////                    print("This is dispatch")
        ////
        ////
        ////                }
        //                sleep(5)
        //            }
        //        }
        //    }
        //        func setImages(){
        //        print("Starting to set Images...")
        //       // enlargeImage.image = images.randomElement()
        //
        //        // taking the images from the array sequently
        //        enlargeImage.image = images[currentIndex]
        //        currentIndex = (currentIndex + 1) % images.count
        //
        //        // progressView
        //        print("progress is \(myProgressView.progress)")
        //        if myProgressView.progress == 1.0{
        //            print("TRUE")
        //            myProgressView.progress = 0.0
        //            currentIndex = 0
        //
        //            // code
        //
        //        }
        
        
        // trying to smoothen the progress
        //        UIView.animate(withDuration: 1.0, animations: { () -> Void in
        //          // code like myProgressView.setProgress()
        //        })
        
        
        //        self.myProgressView.progress += self.progressViewInterval
        //        for i in stride(from: self.myProgressView.progress - (Float(self.currentIndex + 1) * self.progressViewInterval), through: self.myProgressView.progress, by: 0.01) {
        //
        //                self.myProgressView.setProgress(i, animated: true)
        //            }
        //            myProgressView.progress += progressViewInterval
        //            myProgressView.setProgress(myProgressView.progress, animated: true)
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
        //
        //
        //
        //            self.setImages()
        //
        //        }
        //
        //
        //        }
        
        
        
        
        
        
        
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


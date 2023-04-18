//
//  ImagePreview.swift
//  DemoUI
//
//  Created by Hasibur Rahman on 18/4/23.
//

import UIKit

class ImagePreview: NSObject {
    
    
    func startSlideShow(delegate: PhotoViewVC){
        print("in Slideshow..")
        while true{
            print("in while true")
            for _ in 0...delegate.images.count-1{
                print("in for loop")
                self.setImages(delegate: delegate)
                sleep(1)
            }
            
        }
        
    }
    
    
    func setImages(delegate: PhotoViewVC){
        print("Starting to set Images...")
      
        
        // taking the images from the array sequently
        DispatchQueue.main.async {
            delegate.enlargeImage.image = delegate.images[delegate.currentIndex]
            delegate.currentIndex = (delegate.currentIndex + 1) % delegate.images.count
            
             //progressView
              print("progress is \(delegate.myProgressView.progress)")
        if delegate.myProgressView.progress == 1.0{
                print("TRUE")
                delegate.myProgressView.progress = 0.0
                delegate.currentIndex = 0
            
        }
        delegate.myProgressView.progress += delegate.progressViewInterval
            delegate.myProgressView.setProgress(delegate.myProgressView.progress, animated: true)
            
        }
        
       
        
    }
}

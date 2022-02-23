//
//  BasicAlumbImagePickerViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/05/04.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit

class BasicAlumbImagePickerViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideSystemNavigationBar()
        
        self.imagePicker = ImagePicker(presentationController: self)
       
        self.imagePicker.didSelect = {
            (image: UIImage) in
            
            self.imageView.image = image
        }
    }
    
    @IBAction func onButtonCloseClick(_ sender: Any) {
        finish()
    }
    
    @IBAction func onButtonPickClick(_ sender: Any) {

        self.imagePicker.present(from: sender as! UIView)
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

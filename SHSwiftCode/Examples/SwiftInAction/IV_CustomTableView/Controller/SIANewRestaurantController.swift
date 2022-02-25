//
//  SIANewRestaurantController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/25.
//

import UIKit

class SIANewRestaurantController: UITableViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 10.0
            imageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var textFieldName: RoundedTextField! {
        didSet {
            // MARK: 不論是按鈕或者文字欄位（或任何視圖物件），你可以使用 tag 屬性來儲存標籤值。在上列的程式碼中，我們為每一個文字欄位與文字視圖指定不同的標籤值。此處的名稱欄位有著最小的標籤值，並且是第一個響應者。
            textFieldName.tag = 1
            textFieldName.becomeFirstResponder()
            textFieldName.delegate = self
        }
    }
    
    @IBOutlet var textFieldType: RoundedTextField! {
        didSet {
            textFieldType.tag = 2
            textFieldType.delegate = self
        }
    }
    
    @IBOutlet var textFieldAddress: RoundedTextField! {
        didSet {
            textFieldAddress.tag = 3
            textFieldAddress.delegate = self
        }
    }
    
    @IBOutlet var textFieldPhone: RoundedTextField! {
        didSet {
            textFieldPhone.tag = 4
            textFieldPhone.delegate = self
        }
    }
    
    @IBOutlet var textViewDescription: UITextView! {
        didSet {
            textViewDescription.tag = 5
            
            textViewDescription.layer.cornerRadius = 10.0
            textViewDescription.layer.masksToBounds = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigation()
        constraintImageView()
        setListener()
   
        tapSpaceToEndEditing()
        
    }
    
    // 这个用于解决诡异的上下灰色横条问题
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    // 这个用于解决诡异的上下灰色横条问题
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func setListener() {
        imageView.setOnClickListener(self, action: #selector(onImageViewClick))
    }
    @objc func onImageViewClick() {
        
        showAction(title: "", message: "Choose your photo source", actionArray: ["Camera", "Photo library"], onAction: {
            _, action in
            
            if action == "Camera" {
                
                SystemPhotoPicker.instance.camera(from: self, onImageSelected: {
                    image in
                    
                    self.imageView.image = image
                    self.imageView.contentMode = .scaleAspectFill
                    self.imageView.clipsToBounds = true
                    
                    return self
                })
            }
            
            if action == "Photo library" {
                
                SystemPhotoPicker.instance.photoLibrary(from: self, onImageSelected: {
                    image in
                    
                    self.imageView.image = image
                    self.imageView.contentMode = .scaleAspectFill
                    self.imageView.clipsToBounds = true
                    
                    return self
                })
                
            }
            
        }, cancelTitle: "Cancel")
    }
    
    func customNavigation() {
        
        // Customize the navigation bar appearance
        if let appearance = navigationController?.navigationBar.standardAppearance {

            if let customFont = UIFont(name: "Nunito-Bold", size: 40.0) {

                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
                appearance.backgroundColor = UIColor.white
            }

            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func constraintImageView() {
        
        // 取得父視圖的佈局
        let margins = imageView.superview!.layoutMarginsGuide

        // 關掉自動調整調整大小遮罩，以程式來使用自動佈局
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // 定位圖片視圖的前緣為邊距的前邊緣
        imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    
        // 定位圖片視圖的後緣為邊緣的後緣為邊距的後邊緣
        imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        // 定位圖片視圖的頂部邊緣為邊距的頂部邊緣
        imageView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true

        // 定位圖片視圖的底部邊緣為邊距的底部邊緣
        imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    @IBAction func onSaveClick(_ sender: Any) {
       
        let name = textFieldName.text ?? ""
        let type = textFieldType.text ?? ""
        let address = textFieldAddress.text ?? ""
        let phone = textFieldPhone.text ?? ""
        let description = textViewDescription.text ?? ""
        
        if checkEmpty(text: name) && checkEmpty(text: type) && checkEmpty(text: address) && checkEmpty(text: phone) && checkEmpty(text: description) {
            
        }
    }
    
    func checkEmpty(text: String) -> Bool {
        if text == "" {
            showAlert(title: "Oops", message: "We can't proceed because one of fields is blank. Please note that all fields are required.", confirmTitle: "OK")
            return false
        }
        
        return true
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

extension SIANewRestaurantController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }

        return true
    }
}

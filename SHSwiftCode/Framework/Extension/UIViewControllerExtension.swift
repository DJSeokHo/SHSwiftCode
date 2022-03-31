//
//  UIViewControllerExtension.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/04.
//  Copyright © 2022 SWein. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    
    /**
     swipe to pop will be disable when we set the left navigation item.
     so, we need this.
     */
    /*
     MARK: set swipe to pop gesture
     */
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    /*
     MARK: enable swipe to pop
     */
    public func enableSwipeToPop() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    public func presentUIViewController(
        target viewController: UIViewController,
        withNavigation: Bool = false,
        withAnimated animated: Bool = true,
        withStyle style: UIModalPresentationStyle = UIModalPresentationStyle.fullScreen,
        withCompletion completion: (() -> Void)? = nil
    ) {
        
        viewController.modalPresentationStyle = style
        
        if withNavigation {
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: animated, completion: completion)
        }
        else {
            self.present(viewController, animated: animated, completion: completion)
        }
     
    }
    
    public func finish(withAnimated animated: Bool = true, withCompletion completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
    
    
    public func pushUIViewController(from: UIViewController, target: UIViewController, animated: Bool) {
        from.navigationController?.pushViewController(target, animated: animated)
    }
    
    public func popUIViewController(from: UIViewController, animated: Bool) {
        from.navigationController?.popViewController(animated: animated)
    }
    
    
    public func showAlert(
        title: String = "",
        message: String = "",
        confirmTitle: String = "",
        onConfirm: ((UIAlertAction) -> Void)? = nil,
        cancelTitle: String = "",
        onCancel: ((UIAlertAction) -> Void)? = nil
    ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if confirmTitle != "" {
            alert.addAction(UIAlertAction(title: confirmTitle, style: UIAlertAction.Style.default, handler: onConfirm))
        }
        
        if cancelTitle != "" {
            alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: onCancel))
        }
        
        self.present(alert, animated: true)
    }
    
    public func showAction(
        title: String = "",
        message: String = "",
        actionArray: [String] = [],
        onAction: ((UIAlertAction, String) -> Void)? = nil,
        cancelTitle: String = "",
        onCancel: ((UIAlertAction) -> Void)? = nil
    ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for action in actionArray {
            let alertAction = UIAlertAction(title: action, style: .default, handler: { alertAction in
                
                if onAction != nil {
                    onAction!(alertAction, action)
                }
               
            })
            alert.addAction(alertAction)
        }
        
        if cancelTitle != "" {
            alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: onCancel))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     UIActivityViewController 類別是一個提供數種標準服務的標準視圖控制器，如複製項目至剪貼簿、分享內容至社群媒體網站、透過 Message 傳送項目等。使用這個類別非常簡單，例如：你有想要分享的訊息，你只需要以訊息物件來建立 UIActivityViewController 的實例，然後將這個控制器呈現在畫面即可。這是我們前面的程式碼所完成的部分。
     */
    public func showActivity(activityItems: [Any], applicationActivities: [UIActivity]? = nil, completion: (() -> Void)? = nil) {
        
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        self.present(activityController, animated: true, completion: completion)
      
    }
    
    public func hideSystemNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public func showSystemNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public func getNavigationBarAndStatusBarHeight() -> CGFloat {
        return (navigationController?.navigationBar.frame.size.height ?? 0) + DisplayUtility.getStatusBarHeight()
    }
    
    public func tapSpaceToEndEditing() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    public func setStatusBarTheme(isDark: Bool) {
        navigationController?.navigationBar.barStyle = isDark ? .black : .default
    }
    
    /**
     要自訂導覽列，首先需要先取得目前的 UINavigationBarAppearance 物件。standard Appearance 屬性包含了目前標準大小導覽列的外觀設定。下一步是修改 appearance 物件的屬性，並應用我們自訂的內容。configureWithTransparentBackground() 函數設置導覽列為透明背景與無陰影。
     欲變更導覽列標題的顏色與字型，可修改 titleTextAttributes 與 largeTitleTextAttributes 屬性。這兩個屬性接收一組鍵/ 值格式的屬性。titleTextAttributes 設計為標準尺寸的標題，而 largeTitleTextAttributes 屬性則用於顯示大尺寸標題。在上述的程式中，我們修改字型顏色與實施自訂的字型。

     即使我們完成了 appearance 物件的修改，自訂的結果不會立即應用於導覽列，你必須指定物件至standardAppearance、 compactAppearance 與 scrollEdgeAppearance 屬性，每一個屬性負責導覽列於不同狀態的外觀。standardAppearance 屬性儲存標準尺寸導覽列的設定，compactAppearance 的設定控制小尺寸導覽列的外觀，scrollEdgeAppearance 則為滾動內容滾到導覽列邊緣時的外觀設定。
     */
    public func setNavigationBar(textColor: UIColor, backgroundColor: UIColor) {
        
        if let appearance = navigationController?.navigationBar.standardAppearance {

            appearance.configureWithTransparentBackground()

            appearance.titleTextAttributes = [.foregroundColor: textColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: textColor]
            appearance.backgroundColor = backgroundColor

            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
    }
    
    public func setNavigationBarTintColor(color: UIColor) {
        navigationController?.navigationBar.barTintColor = color
    }
    
    public func setNavigationBarCenterView(title: String, color: UIColor? = nil) {
        
        navigationItem.titleView = nil
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 17)
        
        if color != nil {
            label.textColor = color!
        }
     
        navigationItem.titleView = label
    }
    
    public func setNavigationBarLeadingView(image: UIImage, size: CGSize, action: Selector) {
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        
        button.setOnTouchListener(self, action: action)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: size.height).isActive = true
      
        navigationItem.leftBarButtonItem = barButtonItem
    }

    public func setNavigationBarTrailingView(image: UIImage, size: CGSize, action: Selector) {
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        
        button.setOnTouchListener(self, action: action)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: size.height).isActive = true
      
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
//    public func showTwoButtonWithOneInputAlertView(from: UIViewController, setTitle title: String, setMessage message: String, setInputPlaceHolder placeHolder: String, setContent content: String, setConfirmButtonTitle confirmTitle: String, setCancelButtonTitle cancelTitle: String, setConfirmDelegate confirmDelegate: @escaping (String) -> Void) {
//        
//        let alertController = UIAlertController(title: title, message: message, preferredStyle:  UIAlertController.Style.alert)
//
//        alertController.addTextField {
//            (textField: UITextField!) -> Void in
//            textField.placeholder = placeHolder
//            textField.text = content
//        }
//      
//        let confirmAction = UIAlertAction(
//            title: confirmTitle,
//            style: UIAlertAction.Style.default) {
//                (action: UIAlertAction!) -> Void in
//                
//                let content = (alertController.textFields?.first)! as UITextField
//               
//                if content.text == nil || content.text == "" {
//                    return
//                }
//                
//                confirmDelegate(content.text!)
//            }
//        
//        alertController.addAction(confirmAction)
//        
//        alertController.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: nil))
//        from.present(alertController, animated: true)
//    }
}

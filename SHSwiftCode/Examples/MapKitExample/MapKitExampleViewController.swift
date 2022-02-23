//
//  MapKitExampleViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/02/22.
//

import UIKit
import MapKit

/**
 使用地图时，在调试时会有一个诡异的错误导致崩溃。
 那是因为地图使用了某些Metal API，所以需要去掉debug时对这些错误的捕捉。
 点击上方的项目名，编辑Scheme，把Metal API那里去掉打勾。
 Scheme > Edit Scheme... > Run > Diagnostics > Metal API Validation.
 */
class MapKitExampleViewController: UIViewController {
    
    public static func start(from parentViewController: UIViewController, withStoryboard: Bool = true) {
        
        var viewController: UIViewController
        
        if withStoryboard {
            viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "MapKitExample", withClassName: "MapKitExampleViewController") as! MapKitExampleViewController
        }
        else {
            viewController = MapKitExampleViewController()
        }
        
        parentViewController.presentUIViewController(target: viewController)
    }

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

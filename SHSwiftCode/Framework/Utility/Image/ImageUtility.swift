//
//  ImageUtility.swift
//  SHSwiftCode
//
//  Created by Seok Ho on 2020/05/08.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import UIKit

class ImageUtility {
    
    /**
    Image Orientations
    case up
    The original pixel data matches the image's intended display orientation.

    case down
    The image has been rotated 180° from the orientation of its original pixel data.

    case left
    The image has been rotated 90° counterclockwise from the orientation of its original pixel data.

    case right
    The image has been rotated 90° clockwise from the orientation of its original pixel data.

    case upMirrored
    The image has been horizontally flipped from the orientation of its original pixel data.

    case downMirrored
    The image has been vertically flipped from the orientation of its original pixel data.

    case leftMirrored
    The image has been rotated 90° clockwise and flipped horizontally from the orientation of its original pixel data.

    case rightMirrored
    The image has been rotated 90° counterclockwise and flipped horizontally from the orientation of its original pixel data.
    */
    public static func getImageOrientation(rawValue: Int) -> UIImage.Orientation {
        switch rawValue {
            case 0:
                return UIImage.Orientation.up
            case 1:
                return UIImage.Orientation.down
            case 2:
                return UIImage.Orientation.left
            case 3:
                return UIImage.Orientation.right
            case 4:
                return UIImage.Orientation.upMirrored
            case 5:
                return UIImage.Orientation.downMirrored
            case 6:
                return UIImage.Orientation.leftMirrored
            case 7:
                return UIImage.Orientation.rightMirrored
            default:
                return UIImage.Orientation.up
        }
    }
}

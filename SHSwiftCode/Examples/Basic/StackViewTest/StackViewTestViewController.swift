//
//  StackViewTestViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/01/19.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

/**
 
 UIStackViewDistribution是个枚举值， 各个值如下， 配有示例图， 看不懂就只能自求多福了：
 
 UIStackViewDistributionFill ：它就是将 arrangedSubviews 填充满整个 StackView ，如果设置了spacing，那么这些 arrangedSubviews 之间的间距就是spacing。如果减去所有的spacing，所有的 arrangedSubview 的固有尺寸( intrinsicContentSize )不能填满或者超出 StackView 的尺寸，那就会按照 Hugging 或者 CompressionResistance 的优先级来拉伸或压缩一些 arrangedSubview 。如果出现优先级相同的情况，就按排列顺序来拉伸或压缩。
 
 UIStackViewDistributionFillEqually ：这种就是 StackView 的尺寸减去所有的spacing之后均分给 arrangedSubviews ，每个 arrangedSubview 的尺寸是相同的。

 UIStackViewDistributionFillProportionally ：这种跟FillEqually差不多，只不过这个不是讲尺寸均分给 arrangedSubviews ，而是根据 arrangedSubviews 的 intrinsicContentSize 按比例分配。

 UIStackViewDistributionEqualSpacing ：这种是使 arrangedSubview 之间的spacing相等，但是这个spacing是有可能大于 StackView 所设置的spacing，但是绝对不会小于。这个类型的布局可以这样理解，先按所有的 arrangedSubview 的 intrinsicContentSize 布局，然后余下的空间均分为spacing，如果大约 StackView 设置的spacing那这样就OK了，如果小于就按照 StackView 设置的spacing，然后按照 CompressionResistance 的优先级来压缩一个 arrangedSubview 。

 
 UIStackViewDistributionEqualCentering ：这种是使 arrangedSubview 的中心点之间的距离相等，这样没两个 arrangedSubview 之间的spacing就有可能不是相等的，但是这个spacing仍然是大于等于 StackView 设置的spacing的，不会是小于。这个类型布局仍然是如果 StackView 有多余的空间会均分给 arrangedSubviews 之间的spacing，如果空间不够那就按照 CompressionResistance 的优先级压缩 arrangedSubview 。

 
 */
class StackViewTestViewController: UIViewController {

    @IBOutlet var buttonHide: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
    }

    @IBAction func onButtonShowClick(_ sender: Any) {
        buttonHide.isHidden = false
    }
    
    @IBAction func onButtonCloseClick(_ sender: Any) {
        buttonHide.isHidden = true
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

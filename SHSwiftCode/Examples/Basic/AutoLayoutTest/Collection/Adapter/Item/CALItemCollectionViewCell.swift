//
//  CALItemCollectionViewCell.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2021/03/18.
//  Copyright © 2021 SWein. All rights reserved.
//

import UIKit

protocol CALItemCollectionViewCellDelegate {
    func onClick(_ bean: CALItemBean)
    func onButton(_ bean: CALItemBean)
}

class CALItemCollectionViewCell: UICollectionViewCell {

    public static let TAG = "CALItemCollectionViewCell"
    
    @IBOutlet var label: UILabel!
    
    public var delegate: CALItemCollectionViewCellDelegate?
    
    @IBOutlet var viewContent: UIView!
    @IBOutlet var button: UIButton!
    @IBOutlet var stackView: UIStackView!
    
    public var bean: CALItemBean!
    
    private var contentLC: NSLayoutConstraint!
    private var labelLC: NSLayoutConstraint!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentLC = AutoLayoutManager.instance.createLayoutConstraintHeight(view: viewContent)
        labelLC = AutoLayoutManager.instance.createLayoutConstraintHeight(view: label)
        
        viewContent.setOnClickListener(self, action: #selector(onItemClick))
        
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
            
    }
    @objc private func onItemClick() {
        
        bean.isSmall = !bean.isSmall
        
        if bean.isSmall {
            
            bean.labelHeight = CALItemBean.LABEL_VIEW_HEIGHT
            
        }
        else {
            let tempLabelHeight = bean.content.height(withConstrainedWidth: DisplayUtility.getFullScreenSize().width - 20, font: UIFont.systemFont(ofSize: 15))
            
            if tempLabelHeight < CALItemBean.LABEL_VIEW_HEIGHT {
                bean.labelHeight = CALItemBean.LABEL_VIEW_HEIGHT
            }
            else {
                bean.labelHeight = tempLabelHeight
            }
            
        }
        
        bean.viewHeight = CALItemBean.VIEW_HEIGHT + bean.labelHeight + stackView.frame.height
        
        delegate?.onClick(bean)
    }
    @objc private func onButtonClick() {
        createView()
        delegate?.onButton(bean)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func createView() {
           
        let view = UIView()
        view.frame.size = CGSize(width: DisplayUtility.getFullScreenSize().width, height: 40)
        
        if bean.list.count % 2 == 0 {
               view.backgroundColor = UIColor.blue
        }
        else {
           view.backgroundColor = UIColor.black
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
       
        bean.list.append(view)
        
        bean.stackViewHeight = CGFloat(bean.list.count * 40)

        bean.viewHeight = CALItemBean.VIEW_HEIGHT + bean.labelHeight + bean.stackViewHeight
        
    }
    
    public func updateView() {
//        ILog.debug(tag: #file, content: "update View \(40 + 40 * viewList.count)")
        
        
        ILog.debug(tag: #file, content: "label height is \(bean.labelHeight)")
        ILog.debug(tag: #file, content: "view height is \(bean.viewHeight)")
        
        label.text = bean.content
        label.frame.size = CGSize(width: DisplayUtility.getFullScreenSize().width - 20, height: bean.labelHeight
        )
        
        
//        ILog.debug(tag: #file, content: "??? stack height \(bean.stackViewHeight)")
//
        stackView.frame = CGRect(x: 10, y: 52 + (bean.labelHeight - CALItemBean.LABEL_VIEW_HEIGHT), width:  DisplayUtility.getFullScreenSize().width - 20, height: bean.stackViewHeight)
        
//        ILog.debug(tag: #file, content: "!!! \(stackView.frame.width) \(stackView.frame.height)")
        
       
        for i in 0..<bean.list.count {
            stackView.addArrangedSubview(bean.list[i])
        }
    }
    
}

//
//  StoryCell.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 10/02/24.
//

import UIKit

final class StoryCell:UICollectionViewCell {
    
    let imageView = UIImageView()
    
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: 110, height:120)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

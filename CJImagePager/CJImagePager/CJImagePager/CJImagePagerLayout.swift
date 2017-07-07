//
//  CJImagePagerLayout.swift
//  CJImagePager
//
//  Created by CJ on 2017/7/7.
//  Copyright © 2017年 CJ. All rights reserved.
//

import UIKit

class CJImagePagerLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        //1.计算scrollview最后停留的范围
        let lastRect = CGRect.init(origin: proposedContentOffset, size: (self.collectionView?.frame.size)!)
        
        //2.取出这个范围内的所有属性
        let array:[UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: lastRect)!
        
        //计算屏幕最中间的x
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.size.width)! / 2 ;
        
        //3.遍历所有的属性
        var adjustOffsetX = CGFloat(MAXFLOAT);
        for attrs in array {
            if(abs(attrs.center.x - centerX) < abs(adjustOffsetX)){//取出最小值
                adjustOffsetX = attrs.center.x - centerX;
            }
        }
        
        return CGPoint.init(x:proposedContentOffset.x + adjustOffsetX, y:proposedContentOffset.y);
    }
}

//
//  CJImagePager.swift
//  CJImagePager
//
//  Created by CJ on 2017/6/22.
//  Copyright 2017 CJ. All rights reserved.
//

import UIKit

class CJImagePager: UIView {
    
    var leftRightMargin:CGFloat = 0
    var imageMargin:CGFloat = 0
    
    fileprivate struct Config {
        static let cellID = "ImagePageCell"
    }
    
    // 懒加载 collectionView
    fileprivate lazy var collectionView:UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout();
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = 0
        collectionView.register(UINib.init(nibName: Config.cellID, bundle: Bundle.main), forCellWithReuseIdentifier: Config.cellID)
        
        return collectionView
    }()
    
    // 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.frame = self.bounds
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 数据
    var imageUrls:[String]! {
        didSet{
            collectionView.reloadData()
        }
    }
}

// MARK:UIScrollViewDelegate

extension CJImagePager: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print("scrollViewDidEndDecelerating.x = \(scrollView.contentOffset.x)")
        
        setCollectionViewContentOffset(scrollView: scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging = \(scrollView.contentOffset.x)")
        
        setCollectionViewContentOffset(scrollView: scrollView)
    }
    
    func setCollectionViewContentOffset(scrollView:UIScrollView) {
        
        let itemWidth:CGFloat = self.bounds.width - leftRightMargin * 2
        let itemWidthHalf:CGFloat = itemWidth / 2
        
        let offsetX:CGFloat = scrollView.contentOffset.x
        
        guard offsetX > 0 else {
            return
        }
        
        guard offsetX <= (itemWidth + imageMargin) * CGFloat(imageUrls.count - 1) else {
            return
        }
        
        if offsetX < itemWidthHalf {
            collectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            return
        }
        
        let index = Int((offsetX - itemWidthHalf) / (itemWidth + imageMargin)) + 1
        
        collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
}

extension CJImagePager: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    // 设置 CollectionViewCell 的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    // 设置 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Config.cellID, for: indexPath) as! ImagePageCell
        
        cell.imageUrl = imageUrls[indexPath.row]
        
        return cell
    }
    
    // 点击了 CollectionViewCell 时调用的监听方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击item
    }
    
    // 设置 CollectionViewCell 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.bounds.width - leftRightMargin * 2, height: self.bounds.height)
    }
    
    // 设置 CollectionViewCell 四周的边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, leftRightMargin, 0, leftRightMargin)
    }
    
    // 设置 CollectionViewCell 行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 设置 CollectionViewCell 列间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imageMargin
    }

}











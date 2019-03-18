//
//  UIView+TableViewCell.h
//
//
//  Created by lixiangdong on 14-9-15.
//  Copyright (c) 2014年 . All rights reserved.
//
//  UITableViewCell的子控件关联NSIndexPath

#import <UIKit/UIKit.h>

@interface UIView (TableViewCell)

- (void)setIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPath;

@end

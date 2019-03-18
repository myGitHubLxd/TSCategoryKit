//
//  UIView+TableViewCell.m
//
//
//  Created by lixiangdong on 14-9-15.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UIView+TableViewCell.h"
#import <objc/runtime.h>

@implementation UIView (TableViewCell)

const char *indexPathType = "IndexPath";

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, indexPathType, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)indexPath
{
    NSIndexPath *data = objc_getAssociatedObject(self, indexPathType);
    return data;
}

@end

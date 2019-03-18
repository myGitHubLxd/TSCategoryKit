//
//  UITableViewCell+CreateByCode.h
//
//
//  Created by lixiangdong on 16/7/21.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CreateByCode)

/**
 * 代码动态创建自定义cell
 * param identifyStr --- 重用标签
 * param classStr    --- 类名
 * param tableView   --- 表
 */
+ (__kindof UITableViewCell*)createCellBycode:(NSString *)identifyStr
                                    cellClass:(NSString*)classStr
                                    tableView:(UITableView*)tableView;

@end

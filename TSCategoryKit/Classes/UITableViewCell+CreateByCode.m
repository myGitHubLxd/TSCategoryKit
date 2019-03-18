//
//  UITableViewCell+CreateByCode.m
//
//
//  Created by lixiangdong on 16/7/21.
//  Copyright © 2016年 . All rights reserved.
//

#import "UITableViewCell+CreateByCode.h"

/**
 *  字符串 非空判断 内联函数
 *
 *  @param string 指定字符串
 *
 *  @return YES/NO
 */
CG_INLINE BOOL stringIsEmpty(NSString *string) {
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (string == nil) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    NSString *text = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([text length] == 0) {
        return YES;
    }
    return NO;
}


@implementation UITableViewCell (CreateByCode)

/**
 * 代码动态创建自定义cell
 * param identifyStr --- 重用标签
 * param classStr    --- 类名
 * param tableView   --- 表
 */
+ (__kindof UITableViewCell*)createCellBycode:(NSString *)identifyStr
                                    cellClass:(NSString*)classStr
                                    tableView:(UITableView*)tableView
{
    UITableViewCell *commonCell = [tableView dequeueReusableCellWithIdentifier:identifyStr];
    if(!stringIsEmpty(classStr))
    {
        if(!commonCell)
        {
            commonCell = [[NSClassFromString(classStr) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyStr];
        }
    }
    else
    {//默认创建UITableViewCell
        commonCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyStr];
    }
    
    return commonCell;
}

@end

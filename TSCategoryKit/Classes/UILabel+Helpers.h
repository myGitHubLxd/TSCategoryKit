//
//  UILabel+Helpers.h
//
//
//  Created by lixiangdong on 16/3/10.
//  Copyright © 2016年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel(AddAttributed)


/**
 
 * 一个已知uilabel的字符串，设置它任意子串（可重复）的颜色、字体大小
 * labelStr是uilabel的字符串，subStr是子字符串，后面依次可传入该子串的颜色、字体
 * 可变参数，最后一个哨兵参数传入nil
 */
-(void)setLabelSubStr:(NSString *)labelStr subStr:(NSString *)subStr, ...;


/**
 * 定制label
 */
+ (UILabel*)createPrivateLabel:(UIColor*)color font:(UIFont*)font alignment:(NSTextAlignment)alignment;


/**
 *  计算文本占用的size
 *
 *  @param text        文本
 *  @param lines       行数，lines = 0不限制行数
 *  @param font        字体类型
 *  @param lineSpacing 行间距
 *  @param cSize       文本显示的最大区域
 *
 *  @return 文本占用的size
 */
+ (CGSize)sizeWithText:(NSString *)text lines:(NSInteger)lines font:(UIFont*)font andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)cSize;

/**
 *  设置显示文本多行可控间距
 *
 *  @param text        文本
 *  @param lines       行数，lines = 0不限制行数
 *  @param lineSpacing 行间距
 *  @param cSize       文本显示的最大区域
 *
 *  @return 文本占用的size
 */
- (CGSize)setText:(NSString *)text lines:(NSInteger)lines andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)cSize;

@end

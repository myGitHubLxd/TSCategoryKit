//
//  UIButton+Helpers.m
//  
//
//  Created by lixiangdong on 16/3/23.
//  Copyright © 2016年 . All rights reserved.
//

#import "UIButton+Helpers.h"

@implementation UIButton(Attribute)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 * 设置按钮文字颜色
 */
- (void)setBtnTitleColor:(UIColor*)normalColor pressColor:(UIColor*)preColor
{
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:preColor forState:UIControlStateHighlighted];
}

/**
 * 设置按钮背景色和按压时背景色
 * @param norColor -- 正常状态颜色
 * @param preColor -- 点击时背景色
 */
- (void)setBtnBackgroundColor:(UIColor*)normalColor pressColor:(UIColor*)preColor
{
//    UIImage *norColorImage = [[CommonTool sharedInstance] getImageByColor:normalColor sizeImage:self.frame.size];
//    UIImage *preColorImage = [[CommonTool sharedInstance] getImageByColor:preColor sizeImage:self.frame.size];
//    
//    [self setBackgroundImage:norColorImage forState:UIControlStateNormal];
//    [self setBackgroundImage:preColorImage forState:UIControlStateHighlighted];
}

/**
 * 设置通用按钮颜色（正常时背景为蓝色，点击时背景色为深蓝色，正常和点击文字都为白色）
 */
- (void)setBtnColor
{
//    [self setBtnBackgroundColor:[ThemeManager colorMain] pressColor:[ThemeManager colorButtonNormalPressed]];
//    [self setBtnTitleColor:[ThemeManager colorButtonAssis] pressColor:[ThemeManager colorButtonAssisPressed]];
}

/**
 * 去掉背景色
 */
- (void)setBtnClearColor
{
    [self setBackgroundImage:nil forState:UIControlStateNormal];
    [self setBackgroundImage:nil forState:UIControlStateHighlighted];
}

@end

//
//  UILabel+Helpers.m
//
//
//  Created by lixiangdong on 16/3/10.
//  Copyright © 2016年 . All rights reserved.
//

#import "UILabel+Helpers.h"

@implementation UILabel(AddAttributed)


- (void)setTheAttribute:(NSMutableAttributedString*)attriTitle
                    obj:(id)eachObject
               theRange:(NSRange)range
               twoRange:(NSRange)secondRange
{
    if([eachObject isKindOfClass:[UIColor class]]){
        if(secondRange.length > 0){
            [attriTitle addAttribute:NSForegroundColorAttributeName value:eachObject range:range];//设置颜色
            [attriTitle addAttribute:NSForegroundColorAttributeName value:eachObject range:secondRange];//设置颜色
            [self setAttributedText:attriTitle];
        }else{
            [attriTitle addAttribute:NSForegroundColorAttributeName value:eachObject range:range];//设置颜色
            [self setAttributedText:attriTitle];
        }
    }
    
    if([eachObject isKindOfClass:[UIFont class]]){
        if(secondRange.length > 0){
            [attriTitle addAttribute:NSFontAttributeName value:eachObject range:range];//设置字体
            [attriTitle addAttribute:NSFontAttributeName value:eachObject range:secondRange];//设置字体
            [self setAttributedText:attriTitle];
        }else{
            [attriTitle addAttribute:NSFontAttributeName value:eachObject range:range];//设置字体
            [self setAttributedText:attriTitle];
        }
    }
}


/**
 
 * 一个已知uilabel的字符串，设置它任意子串（可重复）的颜色、字体大小
 * labelStr是uilabel的字符串，subStr是子字符串，后面依次可传入该子串的颜色、字体
 * 可变参数，最后一个哨兵参数传入nil
 */
-(void)setLabelSubStr:(NSString *)labelStr subStr:(NSString *)subStr,...
{
    if(!labelStr)
        return;
    
    va_list param;
    va_start(param, subStr);
    id eachObject = subStr;
    
    //NSRange secondRange;
    
    NSMutableAttributedString *attriTitle = [[NSMutableAttributedString alloc] initWithString:labelStr];
    if(subStr){
        do{
            //NSLog(@"%@",[eachObject description]);
            NSRange range;
            NSRange secondRange;
            if([eachObject isKindOfClass:[NSString class]]){
                range = [labelStr rangeOfString:eachObject];
                if([eachObject hasSuffix:@"%"])//检查字符串是否以%结尾
                    secondRange = [labelStr rangeOfString:eachObject options:NSBackwardsSearch];
                else{
                    secondRange.length = 0;
                }
            }
            
            
            if(range.location == NSNotFound){
                break;
            }
            
            [self setTheAttribute:attriTitle obj:eachObject theRange:range twoRange:secondRange];
        }while((eachObject = va_arg(param, id)));//返回参数列表中指针所指的参数，返回类型为NSString，并使参数指针指向参数列表中下一个参数。
    }
    va_end(param);//清空参数列表，并置参数指针args无效。
    
    return;
}


+ (UILabel*)createPrivateLabel:(UIColor*)color font:(UIFont*)font alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    return label;
}


- (CGSize)setText:(NSString *)text lines:(NSInteger)lines andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)cSize{
    
    self.numberOfLines = lines;  //限定行数
    if (!text && text.length !=0) {
        return CGSizeZero;
    }
    
    CGSize textSize = [self.class sizeWithText:text lines:lines font:self.font andLineSpacing:lines constrainedToSize:cSize];
    
    if ([self p_isSingleLine:textSize.height font:self.font]) {
        lineSpacing = 0.0f;
    }
    //设置文字的属性
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    [self setAttributedText:attributedString];
    return CGSizeMake(textSize.width, textSize.height);
}

+ (CGSize)sizeWithText:(NSString *)text lines:(NSInteger)lines font:(UIFont*)font andLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)cSize{
    
    if (!text && text.length !=0) {
        return CGSizeZero;
    }
    
    CGFloat oneRowHeight = [@"占位" sizeWithAttributes:@{NSFontAttributeName:font}].height;
    CGSize textSize = [text boundingRectWithSize:cSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGFloat rows = textSize.height / oneRowHeight;
    CGFloat realHeight = oneRowHeight;
    // 0 不限制行数
    if (lines == 0) {
        if (rows >= 1) {
            realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
        }
    }else{
        if (rows >= lines) {
            rows = lines;
        }
        realHeight = (rows * oneRowHeight) + (rows - 1) * lineSpacing;
    }
    return CGSizeMake(textSize.width, realHeight);
}

//单行的判断
- (BOOL)p_isSingleLine:(CGFloat)height font:(UIFont*)font{
    
    BOOL isSingle = NO;
    CGFloat oneRowHeight = [@"占位" sizeWithAttributes:@{NSFontAttributeName:font}].height;
    if (fabs(height - oneRowHeight)  < 0.001f) {
        isSingle = YES;
    }
    return isSingle;
}

@end

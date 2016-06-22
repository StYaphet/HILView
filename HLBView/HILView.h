//
//  HILView.h
//  HLBView
//
//  Created by 郝一鹏 on 16/6/22.
//  Copyright © 2016年 bupt. All rights reserved.
//


#import <UIKit/UIKit.h>

#define HexRGB(hexColor) rgbaFromHex(hexColor, 1)
//  右移16位与0xFF相与取得r，右移8位与0xFF相与取得g，与0xFF相与取得b

UIColor *rgbaFromHex(NSInteger hexColor, CGFloat alpha);

UIColor *rgba(int r, int g, int b, float alpha);

@interface HILView : UIView

@property (nonatomic, copy) NSString *image;

- (instancetype)initWithFrame:(CGRect)frame fontSize:(CGFloat)fontSize;
- (void)setTitle:(NSString *)title titleColor:(CGFloat)titleColor;
- (void)addTarget:(id)target action:(nonnull SEL)action;

@end
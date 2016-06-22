//
//  HILView.m
//  HLBView
//
//  Created by 郝一鹏 on 16/6/22.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "HILView.h"

UIColor *rgba(int r, int g, int b, float alpha) {
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}

UIColor *rgbaFromHex(NSInteger hexColor, CGFloat alpha) {
    return rgba((hexColor >> 16) & 0xFF, (hexColor >> 8) & 0xFF, hexColor & 0xFF, alpha);
}

@implementation HILView{
    UIImageView *_imageView;
    UILabel *_label;
    UITapGestureRecognizer *_tapGesture;
}

//  全能初始化方法
- (instancetype)initWithFrame:(CGRect)frame fontSize:(CGFloat)fontSize {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:fontSize];
        [self addSubview:_label];
        
        _tapGesture= [[UITapGestureRecognizer alloc] init];
        [self addGestureRecognizer:_tapGesture];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title titleColor:(CGFloat)titleColor {
    _label.text = title;
    _label.textColor = HexRGB(titleColor);
    [_label sizeToFit];
}

- (void)setImage:(NSString *)image {
    UIImage *img = [UIImage imageNamed:image];
    __block UIImage *reImage;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        CGFloat length = MIN(self.frame.size.width, self.frame.size.height);
        UIGraphicsBeginImageContext(CGSizeMake(length, length));
        [img drawInRect:CGRectMake(0, 0, length, length)];
        reImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            _imageView.image = reImage;
        });
    });
}

- (void)layoutSubviews {
    CGRect imageFrame =  CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    CGRect lableFrame = CGRectMake((self.frame.size.width - _label.frame.size.width) / 2, self.frame.size.height - _label.frame.size.height, _label.frame.size.width, _label.frame.size.height);
    _imageView.frame = imageFrame;
    _label.frame = lableFrame;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame fontSize:14];
}

- (void)addTarget:(id)target action:(nonnull SEL)action {
    [_tapGesture addTarget:target action:action];
}

@end



//
//  BinButton.m
//  BinButton
//
//  Created by jerryzhang on 15/9/27.
//  Copyright (c) 2015年 jerryzhang. All rights reserved.

#import "BinButton.h"

#define kBinButtonDefaultTitle @"BinButton"
#define kBinButtonDefaultImageName @"BinButtonDefaultImageName"
#define kBinButtonDefaultImageTitleMargin 10.f
#define kBinButtonDefaultTitleColor [UIColor blackColor]

@interface BinButton ()
@property (nonatomic, assign) BinButtonStyle buttonStyle;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, assign) NSLineBreakMode lineBreakMode;
@property (nonatomic, strong) NSMutableParagraphStyle *style;

@property (nonatomic, assign) BOOL sizeNeedToFitAtHorizontal;
@property (nonatomic, assign) BOOL sizeNeedToFitAtVertical;
@property (nonatomic, assign) BOOL sizeNeedToFreeAtHorizontal;
@property (nonatomic, assign) BOOL sizeNeedToFreeAtVertical;

@end

@implementation BinButton
+ (instancetype)buttonWithStyle:(BinButtonStyle)buttonStyle frame:(CGRect)frame {
    BinButton *btn = [BinButton buttonWithType:UIButtonTypeCustom];
    if (btn) {
        [btn commonInit];
        
        btn.frame = frame;
        btn.buttonStyle = buttonStyle;
    }
    return btn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self commonInit];
}

- (void)commonInit {
    self.isAllowHighlighted = YES;
    self.sizeNeedToFreeAtHorizontal = YES;
    self.sizeNeedToFreeAtVertical = YES;
    self.imageTitleMargin = kBinButtonDefaultImageTitleMargin;
    self.style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
#if BinButtonDebugMode
    self.titleLabel.backgroundColor = [UIColor blueColor];
    self.imageView.backgroundColor = [UIColor orangeColor];
#endif
}

- (void)setButtonStyle:(BinButtonStyle)buttonStyle {
    _buttonStyle = buttonStyle;
    
    switch (buttonStyle) {
        case BinButtonStyleTitleCenter:
        case BinButtonStyleTitleLeft:
        case BinButtonStyleTitleRight: {
            [self setTitle:kBinButtonDefaultTitle forState:UIControlStateNormal];
            [self setTitleColor:kBinButtonDefaultTitleColor forState:UIControlStateNormal];
        }
            break;
        case BinButtonStyleImageCenter:
        case BinButtonStyleImageLeft:
        case BinButtonStyleImageRight:
            [self setImage:[UIImage imageNamed:kBinButtonDefaultImageName] forState:UIControlStateNormal];
            break;
        case BinButtonStyleHorizontalImageCenterTitleCenter:
        case BinButtonStyleHorizontalImageLeftTitleCenter:
        case BinButtonStyleHorizontalImageCenterTitleRight:
        case BinButtonStyleHorizontalReverseImageCenterTitleCenter:
        case BinButtonStyleHorizontalReverseImageRightTitleCenter:
        case BinButtonStyleHorizontalReverseImageCenterTitleLeft:
        case BinButtonStyleVerticalImageCenterTitleCenter:
        case BinButtonStyleVerticalImageTopTitleCenter:
        case BinButtonStyleVerticalImageCenterTitleBottom: {
            [self setImage:[UIImage imageNamed:kBinButtonDefaultImageName] forState:UIControlStateNormal];
            [self setTitle:kBinButtonDefaultTitle forState:UIControlStateNormal];
            [self setTitleColor:kBinButtonDefaultTitleColor forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
    [self setNeedsLayout];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    
    //  imageRectForContentRect方法比titleRectForContentRect方法先调用，所以这里拿到相关titleLabel的属性
    self.titleFont = self.titleLabel.font;
    self.lineBreakMode = self.titleLabel.lineBreakMode;
    
    CGFloat imageX = imageRect.origin.x;
    CGFloat imageY = imageRect.origin.y;
    CGFloat imageW = imageRect.size.width;
    CGFloat imageH = imageRect.size.height;
    
    if (self.buttonStyle == BinButtonStyleImageCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleImageLeft) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleImageRight) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = contentRect.size.width - self.imageRightMargin - imageRect.size.width;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            CGRect titleRect = [super titleRectForContentRect:contentRect];
            CGFloat W = titleRect.size.width + imageRect.size.width + self.imageTitleMargin;
            imageX = (contentRect.size.width - W) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageLeftTitleCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleRight) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageCenterTitleCenter) {
        CGRect titleRect = [super titleRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            CGFloat W = imageRect.size.width + self.imageTitleMargin + titleRect.size.width;
            imageX = (contentRect.size.width - W) * 0.5f + titleRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.titleLeftMargin + titleRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageRightTitleCenter) {
        CGRect titleRect = [super titleRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = contentRect.size.width - self.imageRightMargin - imageRect.size.width;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.titleLeftMargin + titleRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageCenterTitleLeft) {
        CGRect titleRect = [super titleRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.titleLeftMargin + titleRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleCenter) {
        CGRect titleRect = [self titleRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageRect.size.height - self.imageTitleMargin - titleRect.size.height) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageTopTitleCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = self.imageTopMargin;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleBottom) {
        if (self.sizeNeedToFreeAtHorizontal) {
            imageX = (contentRect.size.width - imageW) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            imageY = (contentRect.size.height - imageH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            imageX = self.imageLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            imageY = self.imageTopMargin;
        }
        return CGRectMake(imageX, imageY, imageW, imageH);
    }
    return imageRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    // 在titleRectForContentRect里面去调用self.titleLabel会死循环
    if (!self.titleFont || ![self currentTitle]) return [super titleRectForContentRect:contentRect];
    
    self.style.lineBreakMode = self.lineBreakMode;
    CGRect titleRect = [[self currentTitle] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.titleFont, NSParagraphStyleAttributeName : self.style} context:nil];
    
    CGFloat titleX = 0.f;
    CGFloat titleY = 0.f;
    CGFloat titleW = titleRect.size.width;
    CGFloat titleH = titleRect.size.height;
    
    if (self.buttonStyle == BinButtonStyleTitleCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleW) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleTitleLeft) {
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleTitleRight) {
        CGFloat titleX = contentRect.size.width - titleRect.size.width - self.titleRightMargin;
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = contentRect.size.width - titleRect.size.width - self.titleRightMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleCenter) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            CGFloat W = imageRect.size.width + titleRect.size.width + self.imageTitleMargin;
            titleX = (contentRect.size.width - W) * 0.5f + imageRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.imageLeftMargin + imageRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageLeftTitleCenter) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.imageLeftMargin + imageRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    }else if(self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleRight){
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleRect.size.width - self.titleRightMargin);
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.imageLeftMargin + imageRect.size.width + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageCenterTitleCenter) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            CGFloat W = titleRect.size.width + self.imageTitleMargin + imageRect.size.width;
            titleX = (contentRect.size.width - W) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageRightTitleCenter) {
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageCenterTitleLeft) {
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.titleTopMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleCenter) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleRect.size.width) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            CGFloat H = imageRect.size.height + self.imageTitleMargin + titleRect.size.height;
            titleY = (contentRect.size.height - H) * 0.5f + imageRect.size.height + self.imageTitleMargin;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.imageTopMargin + imageRect.size.height + self.imageTitleMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageTopTitleCenter) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleW) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = (contentRect.size.height - titleH) * 0.5f;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.imageTopMargin + imageRect.size.height + self.imageTitleMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    } else if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleBottom) {
        CGRect imageRect = [super imageRectForContentRect:contentRect];
        if (self.sizeNeedToFreeAtHorizontal) {
            titleX = (contentRect.size.width - titleW) * 0.5f;
        }
        if (self.sizeNeedToFreeAtVertical) {
            titleY = contentRect.size.height - self.titleBottomMargin - titleH;
        }
        if (self.sizeNeedToFitAtHorizontal) {
            titleX = self.titleLeftMargin;
        }
        if (self.sizeNeedToFitAtVertical) {
            titleY = self.imageTopMargin + imageRect.size.height + self.imageTitleMargin;
        }
        return CGRectMake(titleX, titleY, titleW, titleH);
    }
    return titleRect;
}

- (CGRect)contentRectForBounds:(CGRect)bounds {
    return [super contentRectForBounds:bounds];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateFrame];
}

#pragma mark - update frame
- (void)updateFrame {
    
    CGRect tempButtonRect = self.frame;
    CGRect tempTitleLabelRect = self.titleLabel.frame;
    CGRect tempImageViewRect = self.imageView.frame;
    
    if (self.buttonStyle != BinButtonStyleVerticalImageCenterTitleCenter && self.buttonStyle != BinButtonStyleVerticalImageTopTitleCenter && self.buttonStyle != BinButtonStyleVerticalImageCenterTitleBottom) {
        NSAssert(tempButtonRect.size.width >= tempTitleLabelRect.size.width + tempImageViewRect.size.width, @"the width of content is beyond the width of button");
    }
    
    if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleCenter || self.buttonStyle == BinButtonStyleVerticalImageTopTitleCenter || self.buttonStyle == BinButtonStyleVerticalImageCenterTitleBottom) {
        NSAssert(tempButtonRect.size.height >= tempTitleLabelRect.size.height + tempImageViewRect.size.height, @"the height of content is beyond the height of button");
    }
    
    if (self.buttonStyle == BinButtonStyleTitleCenter || self.buttonStyle == BinButtonStyleTitleLeft || self.buttonStyle == BinButtonStyleTitleRight) {
        if (self.sizeNeedToFitAtHorizontal) {
            tempButtonRect.size.width = self.titleLeftMargin + tempTitleLabelRect.size.width + self.titleRightMargin;
            self.frame = tempButtonRect;
        }
        
        if (self.sizeNeedToFitAtVertical) {
            tempButtonRect.size.height = self.titleTopMargin + tempTitleLabelRect.size.height + self.titleBottomMargin;
            self.frame = tempButtonRect;
        }
    } else if (self.buttonStyle == BinButtonStyleImageCenter || self.buttonStyle == BinButtonStyleImageLeft || self.buttonStyle == BinButtonStyleImageRight) {
        if (self.sizeNeedToFitAtHorizontal) {
            tempButtonRect.size.width = self.imageLeftMargin + tempImageViewRect.size.width + self.imageRightMargin;
            self.frame = tempButtonRect;
        }
        
        if (self.sizeNeedToFitAtVertical) {
            tempButtonRect.size.height = self.imageTopMargin + tempImageViewRect.size.height + self.imageBottomMargin;
            self.frame = tempButtonRect;
        }
    } else if (self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleCenter || self.buttonStyle == BinButtonStyleHorizontalImageLeftTitleCenter || self.buttonStyle == BinButtonStyleHorizontalImageCenterTitleRight) {
        if (self.sizeNeedToFitAtHorizontal) {
            tempButtonRect.size.width = self.imageLeftMargin + tempImageViewRect.size.width + self.imageTitleMargin + tempTitleLabelRect.size.width + self.titleRightMargin;
            self.frame = tempButtonRect;
        }
        if (self.sizeNeedToFitAtVertical) {
            tempButtonRect.size.height = MAX(self.imageTopMargin + tempImageViewRect.size.height + self.imageBottomMargin, self.titleTopMargin + tempTitleLabelRect.size.height + self.titleBottomMargin);
            self.frame = tempButtonRect;
        }
    } else if (self.buttonStyle == BinButtonStyleHorizontalReverseImageCenterTitleCenter || self.buttonStyle == BinButtonStyleHorizontalReverseImageRightTitleCenter || self.buttonStyle ==BinButtonStyleHorizontalReverseImageCenterTitleLeft) {
        if (self.sizeNeedToFitAtHorizontal) {
            tempButtonRect.size.width = self.titleLeftMargin + tempTitleLabelRect.size.width + self.imageTitleMargin + tempImageViewRect.size.width + self.imageRightMargin;
            self.frame = tempButtonRect;
        }
        if (self.sizeNeedToFitAtVertical) {
            tempButtonRect.size.height = MAX(self.imageTopMargin + tempImageViewRect.size.height + self.imageBottomMargin, self.titleTopMargin + tempTitleLabelRect.size.height + self.titleBottomMargin);
            self.frame = tempButtonRect;
        }
    } else if (self.buttonStyle == BinButtonStyleVerticalImageCenterTitleCenter || self.buttonStyle == BinButtonStyleVerticalImageTopTitleCenter || self.buttonStyle == BinButtonStyleVerticalImageCenterTitleBottom) {
        if (self.sizeNeedToFitAtHorizontal) {
            tempButtonRect.size.width = MAX(self.titleLeftMargin + tempTitleLabelRect.size.width + self.titleRightMargin, self.imageLeftMargin + tempImageViewRect.size.width + self.imageRightMargin);
            self.frame = tempButtonRect;
        }
        if (self.sizeNeedToFitAtVertical) {
            tempButtonRect.size.height = self.imageTopMargin + tempImageViewRect.size.height + self.imageTitleMargin + tempTitleLabelRect.size.height + self.titleBottomMargin;
            self.frame = tempButtonRect;
        }
    }
}

#pragma mark - setter
- (void)setTitleTopMargin:(CGFloat)titleTopMargin {
    if (_titleTopMargin == titleTopMargin) return;
    
    _titleTopMargin = titleTopMargin;
    [self setNeedsLayout];
}

- (void)setTitleBottomMargin:(CGFloat)titleBottomMargin {
    if (_titleBottomMargin == titleBottomMargin) return;
    
    _titleBottomMargin = titleBottomMargin;
    [self setNeedsLayout];
}

- (void)setTitleLeftMargin:(CGFloat)titleLeftMargin {
    if (_titleLeftMargin == titleLeftMargin) return;
    
    _titleLeftMargin = titleLeftMargin;
    [self setNeedsLayout];
}

- (void)setTitleRightMargin:(CGFloat)titleRightMargin {
    if (_titleRightMargin == titleRightMargin) return;
    
    _titleRightMargin = titleRightMargin;
    [self setNeedsLayout];
}

- (void)setImageTopMargin:(CGFloat)imageTopMargin {
    if (_imageTopMargin == imageTopMargin) return;
    
    _imageTopMargin = imageTopMargin;
    [self setNeedsLayout];
}

- (void)setImageBottomMargin:(CGFloat)imageBottomMargin {
    if (_imageBottomMargin == imageBottomMargin) return;
    
    _imageBottomMargin = imageBottomMargin;
    [self setNeedsLayout];
}

- (void)setImageLeftMargin:(CGFloat)imageLeftMargin {
    if (_imageLeftMargin == imageLeftMargin) return;
    
    _imageLeftMargin = imageLeftMargin;
    [self setNeedsLayout];
}

- (void)setImageTitleMargin:(CGFloat)imageTitleMargin {
    if (_imageTitleMargin == imageTitleMargin) return;
    
    _imageTitleMargin = imageTitleMargin;
    [self setNeedsLayout];
}

- (void)setImageRightMargin:(CGFloat)imageRightMargin {
    if (_imageRightMargin == imageRightMargin) return;
    
    _imageRightMargin = imageRightMargin;
    [self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)highlighted {
    if(self.isAllowHighlighted){
        [super setHighlighted:highlighted];
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if ([self backgroundImageForState:UIControlStateNormal]) {
        [super setBackgroundColor:backgroundColor];
    } else {
        [self setBackgroundImage:[self buttonImageWithColor:backgroundColor size:CGSizeMake(1.f, 1.f)] forState:UIControlStateNormal];
    }
}

#pragma mark - control UI smoothly
- (void)sizeToFitAtHorizontal {
    self.sizeNeedToFreeAtHorizontal = NO;
    self.sizeNeedToFitAtHorizontal = YES;
    
    [self setNeedsLayout];
}

- (void)sizeToFitAtVertical {
    self.sizeNeedToFreeAtVertical = NO;
    self.sizeNeedToFitAtVertical = YES;
    
    [self setNeedsLayout];
}

- (void)sizeToFreeAtHorizontal {
    self.sizeNeedToFitAtHorizontal = NO;
    self.sizeNeedToFreeAtHorizontal = YES;
    
    [self setNeedsLayout];
}

- (void)sizeToFreeAtVertical {
    self.sizeNeedToFitAtVertical = NO;
    self.sizeNeedToFreeAtVertical = YES;
    
    [self setNeedsLayout];
}

#pragma mark - helper method
- (UIImage *)buttonImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

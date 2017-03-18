//
//  BinButton.h
//  BinButton
//
//  Created by jerryzhang on 15/9/27.
//  Copyright (c) 2015年 jerryzhang. All rights reserved.
//  Verson 1.0

/**
 1. 這套button裏面涵蓋了幾乎所有我們日常開發的UI,是一套很好的button框架,支持用戶繼承自定義UI,擴展性很好.
 2. 本框架暫時不支持autolayout的環境,以後會加.
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BinButtonStyle) {
    BinButtonStyleNone = 0,
    
    BinButtonStyleTitleCenter = 1,
    BinButtonStyleTitleLeft,
    BinButtonStyleTitleRight,
    
    BinButtonStyleImageCenter = 5,
    BinButtonStyleImageLeft,
    BinButtonStyleImageRight,
    
    BinButtonStyleHorizontalImageCenterTitleCenter = 9,
    BinButtonStyleHorizontalImageLeftTitleCenter,
    BinButtonStyleHorizontalImageCenterTitleRight,
    
    BinButtonStyleHorizontalReverseImageCenterTitleCenter = 13,
    BinButtonStyleHorizontalReverseImageRightTitleCenter,
    BinButtonStyleHorizontalReverseImageCenterTitleLeft,
    
    BinButtonStyleVerticalImageCenterTitleCenter = 17,
    BinButtonStyleVerticalImageTopTitleCenter,
    BinButtonStyleVerticalImageCenterTitleBottom
};

@interface BinButton : UIButton

@property (nonatomic, assign, readonly) BinButtonStyle buttonStyle;

@property (nonatomic, assign) CGFloat titleTopMargin;

@property (nonatomic, assign) CGFloat titleBottomMargin;

@property (nonatomic, assign) CGFloat titleLeftMargin;

@property (nonatomic, assign) CGFloat titleRightMargin;

@property (nonatomic, assign) CGFloat imageTopMargin;

@property (nonatomic, assign) CGFloat imageBottomMargin;

@property (nonatomic, assign) CGFloat imageLeftMargin;

@property (nonatomic, assign) CGFloat imageRightMargin;

@property (nonatomic, assign) CGFloat imageTitleMargin;

/**
 是否允許按鈕高亮
 */
@property (nonatomic, assign) BOOL isAllowHighlighted;

+ (instancetype)buttonWithStyle:(BinButtonStyle)buttonStyle frame:(CGRect)frame;

- (void)sizeToFitAtHorizontal;
- (void)sizeToFreeAtHorizontal;
- (void)sizeToFitAtVertical;
- (void)sizeToFreeAtVertical;

@end

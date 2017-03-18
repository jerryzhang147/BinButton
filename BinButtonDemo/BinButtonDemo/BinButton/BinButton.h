//
//  BinButton.h
//  BinButton
//
//  Created by jerryzhang on 15/9/27.
//  Copyright (c) 2015年 jerryzhang. All rights reserved.
//  Verson 1.0

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BinButtonStyle) {
    BinButtonStyleNone = 0,
    
    BinButtonStyleTitleCenter = 1,
    BinButtonStyleTitleLeft,
    BinButtonStyleTitleRight,
    
    BinButtonStyleImageCenter,
    BinButtonStyleImageLeft,
    BinButtonStyleImageRight,
    
    BinButtonStyleHorizontalImageCenterTitleCenter,
    BinButtonStyleHorizontalImageLeftTitleCenter,
    BinButtonStyleHorizontalImageCenterTitleRight,
    
    BinButtonStyleHorizontalReverseImageCenterTitleCenter,
    BinButtonStyleHorizontalReverseImageRightTitleCenter,
    BinButtonStyleHorizontalReverseImageCenterTitleLeft,
    
    BinButtonStyleVerticalImageCenterTitleCenter,
    BinButtonStyleVerticalImageTopTitleCenter,
    BinButtonStyleVerticalImageCenterTitleBottom
};

@interface BinButton : UIButton

@property (nonatomic, assign, readonly) BinButtonStyle buttonStyle;

/** default is 0.f */
@property (nonatomic, assign) CGFloat titleTopMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat titleBottomMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat titleLeftMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat titleRightMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat imageTopMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat imageBottomMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat imageLeftMargin;

/** default is 0.f */
@property (nonatomic, assign) CGFloat imageRightMargin;

/** default is 10.f */
@property (nonatomic, assign) CGFloat imageTitleMargin;

@property (nonatomic, assign) BOOL isAllowHighlighted;

/**
 initialize method

 @param buttonStyle a style of BinButtonStyle
 @param frame button frame
 @return a instance of BinButton
 */
+ (instancetype)buttonWithStyle:(BinButtonStyle)buttonStyle frame:(CGRect)frame;

/**
    The button width to fit according to content and settings at horizontal direction
 */
- (void)sizeToFitAtHorizontal;
/**
 The button width to free according to content and settings at horizontal direction
 */
- (void)sizeToFreeAtHorizontal;
/**
 The button height to fit according to content and settings at Vertical direction
 */
- (void)sizeToFitAtVertical;
/**
 The button height to free according to content and settings at Vertical direction
 */
- (void)sizeToFreeAtVertical;

@end

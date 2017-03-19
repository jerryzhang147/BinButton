//
//  BinButton.h
//  BinButton
//
//  Created by jerryzhang on 15/9/27.
//  Copyright (c) 2015年 jerryzhang. All rights reserved.
//  Verson 1.0

#import <UIKit/UIKit.h>

// you can set is to 1, the content can have backgroundColor
#define kBinButtonDebugMode 0

typedef NS_ENUM(NSUInteger, BinButtonStyle) {
    BinButtonStyleNone = 0,
    
    BinButtonStyleTitleCenter,
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

/** Default is 0.f */
@property (nonatomic, assign) CGFloat titleTopMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat titleBottomMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat titleLeftMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat titleRightMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat imageTopMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat imageBottomMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat imageLeftMargin;

/** Default is 0.f */
@property (nonatomic, assign) CGFloat imageRightMargin;

/** Default is 10.f */
@property (nonatomic, assign) CGFloat imageTitleMargin;

/** Weather button can be highlighted */
@property (nonatomic, assign) BOOL isAllowHighlighted;

/**
 Initialize method

 @param buttonStyle a style of BinButtonStyle
 @param frame button frame
 @return a instance of BinButton
 */
+ (instancetype)buttonWithStyle:(BinButtonStyle)buttonStyle frame:(CGRect)frame;

/**
    The button width to fit according to content and properties at horizontal direction
 */
- (void)sizeToFitAtHorizontal;
/**
 The button width to free according to content and properties at horizontal direction
 */
- (void)sizeToFreeAtHorizontal;
/**
 The button height to fit according to content and properties at Vertical direction
 */
- (void)sizeToFitAtVertical;
/**
 The button height to free according to content and properties at Vertical direction
 */
- (void)sizeToFreeAtVertical;

@end

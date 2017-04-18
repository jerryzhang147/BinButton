//
//  BinButton.h
//  BinButton
//
//  Created by jerryzhang on 15/9/27.
//  Copyright (c) 2015年 jerryzhang. All rights reserved.
//  Verson 1.0.1

#import <UIKit/UIKit.h>

/// *** Pay attention:
/// If you want to debug the BinButton's layout, you can add 'BinButtonDebugMode = 1' macro in the target's debug preprocessing macro

typedef NS_ENUM(NSUInteger, BinButtonStyle) {
    BinButtonStyleNone = 0, // is normal, the same as the UIButton
    
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

/** Default is BinButtonStyleNone */
@property (nonatomic, assign) BinButtonStyle buttonStyle;

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

/** Whether button can be highlighted */
@property (nonatomic, assign) BOOL isAllowHighlighted;

/**
 Initialize method

 @param buttonStyle a style of BinButtonStyle
 @return a instance of BinButton
 */
- (instancetype)initWithButtonStyle:(BinButtonStyle)buttonStyle;

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

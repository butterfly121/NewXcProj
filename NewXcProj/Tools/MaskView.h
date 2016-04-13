//
//  MaskView.h
//  newProject
//
//  Created by xhm on 16/4/5.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MaskViewDelegate <NSObject>

@required
- (void)maskViewClicked;

@end

@interface MaskView : UIView
@property (nonatomic, assign) id<MaskViewDelegate> delegate;

@end



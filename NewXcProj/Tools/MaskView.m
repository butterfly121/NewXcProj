//
//  MaskView.m
//  newProject
//
//  Created by xhm on 16/4/5.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "MaskView.h"
#define COLORA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@implementation MaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor: COLORA(0, 0, 0, 0.2)];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(maskViewClicked)]) {
        [self.delegate performSelector:@selector(maskViewClicked)];
    }
}

@end

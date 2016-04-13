//
//  XCTabBarButton.m
//  CommunityService
//
//  Created by zhangmm on 15/6/4.
//  Copyright (c) 2015年 lee. All rights reserved.
//
#define XCTabBarButtonImageRatio 0.6
#import "XCTabBarButton.h"
#import "UIView+Extension.h"

#define KTabNumBubbleFrame ( CGRectMake(self.frame.size.width*0.55, 2, width, height) )

@interface XCTabBarButton ()

//未读帖子小红点
@property (nonatomic, strong) UIImageView* redDot;
//未读评论消息数字气泡
@property (nonatomic, strong) UIImageView* redNumBubble;

//未读评论消息数
@property (nonatomic, strong) NSString* custUnReadMsgCount;
//未读私信数量
@property (nonatomic, strong) NSString* privateLetterCount;
//未读私信数字气泡
@property (nonatomic, strong) UIButton* privateMsgredBubble;

@end

@implementation XCTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.imageView.contentMode = UIViewContentModeCenter;
        

        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
  
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
       
        [self setTitleColor:COLOR_TABBAR_NORMAL forState:UIControlStateNormal];
        [self setTitleColor:COLOR_TABBAR_Selected forState:UIControlStateSelected];
        
     
        
    }
    return self;
}



- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * XCTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.height * XCTabBarButtonImageRatio;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
  
    [self setTitle:item.title forState:UIControlStateNormal];
 
    [self setImage:item.image forState:UIControlStateNormal];
  
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    

    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    
}


- (void)removeFromSuperview
{
    [super removeFromSuperview];

    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  当利用KVO监听到某个对象的属性改变了, 就会调用这个方法
 *
 *  @param keyPath 被改变的属性的名称
 *  @param object  被监听的那个对象
 *  @param change  存放者被改变属性的值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
   
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}

- (void)setHighlighted:(BOOL)highlighted { }

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end

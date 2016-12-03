//
//  OneViewController.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/9.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fsUIScorllView.h"
@interface OneViewController : UIViewController <UIScrollViewDelegate>
{
    NSMutableArray *classArray;
    fsUIScrollView *classScrollView;
}
@property(nonatomic,strong) NSMutableArray *classArray;
@property(nonatomic,strong) fsUIScrollView *classScrollView;

@end

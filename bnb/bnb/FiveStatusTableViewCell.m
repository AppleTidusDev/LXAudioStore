//
//  FiveStatusTableViewCell.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/14.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "FiveStatusTableViewCell.h"
#import "FiveStatus.h"
#define KCColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜色宏定义
#define kStatusTableViewCellControlSpacing 10 //控件间距
#define kStatusTableViewCellBackgroundColor KCColor(251,251,251)
#define kStatusGrayColor KCColor(50,50,50)
#define kStatusLightGrayColor KCColor(120,120,120)

#define kStatusTableViewCellAvatarWidth 120 //头像宽度
#define kStatusTableViewCellAvatarHeight 80
#define kStatusTableViewCellTitleFontSize 20
#define kStatusTableViewCellMbTypeWidth 13 //会员图标宽度
#define kStatusTableViewCellMbTypeHeight kStatusTableViewCellMbTypeWidth
#define kStatusTableViewCellTextFontSize 13
#define kStatusTableViewCellSmallFontSize 10

@interface FiveStatusTableViewCell(){
    UILabel*_words1;
    UILabel *_words2;
    UIImageView *_line1;
    UILabel *_number1;
    UILabel *_number2;
    UIImageView *_left;
    UILabel *_right;
    UILabel *_title;
    UIImageView *_p1;
    UIImageView *_p2;
    UIImageView *_p3;
    UIImageView *_p4;
    UILabel *_w1;
    UILabel *_w2;
    UILabel *_w3;
    UILabel *_w4;
    UIImageView *_line2;
    UIImageView *_line3;
    UIImageView *_line4;
    UIImageView *_line0;
}

@end
@implementation FiveStatusTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

#pragma mark 初始化视图
-(void)initSubView{
    //头像控件
    

    _title=[[UILabel alloc]init];
    _title.textColor=kStatusGrayColor;
    _title.font=[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    _title.numberOfLines=0;
    _title.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_title];
    



    _right=[[UILabel alloc]init];
    _right.textColor=kStatusGrayColor;
    _right.font=[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    _right.numberOfLines=0;
    _right.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_right];

    _w1=[[UILabel alloc]init];
    _w1.textColor=kStatusGrayColor;
    _w1.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
    _w1.numberOfLines=0;
    _w1.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_w1];
    
    _w2=[[UILabel alloc]init];
    _w2.textColor=kStatusGrayColor;
    _w2.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
    _w2.numberOfLines=0;
    _w2.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_w2];
    
    _w3=[[UILabel alloc]init];
    _w3.textColor=kStatusGrayColor;
    _w3.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
    _w3.numberOfLines=0;
    _w3.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_w3];
    
    _w4=[[UILabel alloc]init];
    _w4.textColor=kStatusGrayColor;
    _w4.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
    _w4.numberOfLines=0;
    _w4.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:_w4];
    
    _left=[[UIImageView alloc]init];
    [self.contentView addSubview:_left];
    
    _line0=[[UIImageView alloc]init];
    [self.contentView addSubview:_line0];
    
    _line1=[[UIImageView alloc]init];
    [self.contentView addSubview:_line1];

    _line2=[[UIImageView alloc]init];
    [self.contentView addSubview:_line2];
    
    _line3=[[UIImageView alloc]init];
    [self.contentView addSubview:_line3];
    
    _line4=[[UIImageView alloc]init];
    [self.contentView addSubview:_line4];
    
    _p1=[[UIImageView alloc]init];
    [self.contentView addSubview:_p1];
    
    _p2=[[UIImageView alloc]init];
    [self.contentView addSubview:_p2];
    
    _p3=[[UIImageView alloc]init];
    [self.contentView addSubview:_p3];
    
    _p4=[[UIImageView alloc]init];
    [self.contentView addSubview:_p4];
    


    
}
-(void)setStatus:(FiveStatus *)status{
    //设置头像大小和位置
    
    CGRect leftRect=CGRectMake(10, 10, 20, 20);
    _left.image=[UIImage imageNamed:status.left];
    _left.frame=leftRect;
    
    
    
    
    CGSize titleSize=[status.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTitleFontSize]}];
    CGFloat titleX=CGRectGetMaxX(_left.frame)+kStatusTableViewCellControlSpacing;
    CGFloat titleY=10;
    CGRect titleRect=CGRectMake(titleX, titleY, titleSize.width,titleSize.height);
    _title.text=status.title;
    _title.frame=titleRect;
    
    CGSize rightSize=[status.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTitleFontSize]}];
    CGFloat rightX=CGRectGetMaxX(_title.frame)+140;
    CGFloat rightY=10;
    CGRect rightRect=CGRectMake(rightX, rightY, rightSize.width+30, rightSize.height);
    _right.text=status.right;
    _right.frame=rightRect;
    
    CGRect line0Rect=CGRectMake(0, 32, 400, 1);
    _line0.image=[UIImage imageNamed:status.line0];
    _line0.frame=line0Rect;
    
    
    CGRect p1Rect=CGRectMake(50, 40, 30, 26);
    _p1.image=[UIImage imageNamed:status.p1];
    _p1.frame=p1Rect;
    
    CGRect p2Rect=CGRectMake(260, 40, 30, 25);
    _p2.image=[UIImage imageNamed:status.p2];
    _p2.frame=p2Rect;
    
    CGRect p3Rect=CGRectMake(50,100, 30, 25);
    _p3.image=[UIImage imageNamed:status.p3];
    _p3.frame=p3Rect;
    
    CGRect p4Rect=CGRectMake(260, 100, 30, 25);
    _p4.image=[UIImage imageNamed:status.p4];
    _p4.frame=p4Rect;
    
    CGRect w1Rect=CGRectMake(50, 50 , 40 , 60);
    _w1.text=status.w1;
    _w1.frame=w1Rect;
    
    CGRect w2Rect=CGRectMake(260, 50, 40, 60);
    _w2.text=status.w2;
    _w2.frame=w2Rect;
    
    CGRect  w3Rect=CGRectMake(50,105, 40, 60);
    _w3.text=status.w3;
    _w3.frame=w3Rect;
    
    CGRect  w4Rect=CGRectMake(250, 105, 60, 60);
    _w4.text=status.w4;
    _w4.frame=w4Rect;
    
    CGRect line1Rect=CGRectMake(180,40 , 1, 40 );
    _line1.image=[UIImage imageNamed:status.line1];
    _line1.frame=line1Rect;
    
    CGRect line2Rect=CGRectMake(180, 100, 1, 40);
    _line2.image=[UIImage imageNamed:status.line1];
    _line2.frame=line2Rect;
    
    CGRect line3Rect=CGRectMake(10, 90, 160, 1);
    _line3.image=[UIImage imageNamed:status.line2];
    _line3.frame=line3Rect;
    
    CGRect line4Rect=CGRectMake(190, 90, 160, 1);
    _line4.image=[UIImage imageNamed:status.line2];
    _line4.frame=line4Rect;
    
    
    _height=150;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

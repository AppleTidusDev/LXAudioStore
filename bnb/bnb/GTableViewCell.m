//
//  GTableViewCell.m
//  bnb
//
//  Created by 谭 卓勋 on 16/11/1.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "GTableViewCell.h"
#import "G.h"
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
#define kStatusTableViewCellTextFontSize 14
#define kStatusTableViewCellSmallFontSize 10
@interface GTableViewCell(){
    UILabel *_text0;
    UILabel *_text1;
    UILabel *_text2;
    UILabel *_text3;
    UILabel *_text4;
    UILabel *_text5;
    UILabel *_text6;
    UILabel *_text7;
    UILabel *_text8;
    UILabel *_time0;
    UILabel *_time1;
    UILabel *_time2;
    UILabel *_time3;
    UILabel *_time4;
    UILabel *_time5;
    UILabel *_time6;
    UILabel *_time7;
    UILabel *_time8;
    UIImageView *_sl0;
    UIImageView *_sl1;
    UIImageView *_sl2;
    UIImageView *_sl3;
    UIImageView *_sl4;
    UIImageView *_sl5;
    UIImageView *_sl6;
    UIImageView *_sl7;
    UIImageView *_ssl;
    UIImageView *_hotpoint;
    UIImageView *_point1;
    UIImageView *_point0;
    UIImageView *_point2;
    UIImageView *_point3;
    UIImageView *_point4;
    UIImageView *_point5;
    UIImageView *_point6;
    UIImageView *_point7;

}
@end
@implementation GTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
#pragma mark 初始化视图
-(void)initSubView{
    _sl0=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl0];
    _sl1=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl1];
    _sl2=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl2];
    _sl3=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl3];
    _sl4=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl4];
    _sl5=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl5];
    _sl6=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl6];
    _sl7=[[UIImageView alloc]init];
    [self.contentView addSubview:_sl7];
    
    _ssl=[[UIImageView alloc]init];
    [self.contentView addSubview:_ssl];
    
    _point0=[[UIImageView alloc]init];
    [self.contentView addSubview:_point0];
    _point1=[[UIImageView alloc]init];
    [self.contentView addSubview:_point1];
    _point2=[[UIImageView alloc]init];
    [self.contentView addSubview:_point2];
    _point3=[[UIImageView alloc]init];
    [self.contentView addSubview:_point3];
    _point4=[[UIImageView alloc]init];
    [self.contentView addSubview:_point4];
    _point5=[[UIImageView alloc]init];
    [self.contentView addSubview:_point5];
    _point6=[[UIImageView alloc]init];
    [self.contentView addSubview:_point6];
    _point7=[[UIImageView alloc]init];
    [self.contentView addSubview:_point7];
    
    _hotpoint=[[UIImageView alloc]init];
    [self.contentView addSubview:_hotpoint];
    
    _text0=[[UILabel alloc]init];
    _text0.textColor=kStatusGrayColor;
    _text0.font=[UIFont systemFontOfSize:10];
    _text0.numberOfLines=0;
    _text0.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text0];
    
    _text1=[[UILabel alloc]init];
    _text1.textColor=kStatusGrayColor;
    _text1.font=[UIFont systemFontOfSize:10];
    _text1.numberOfLines=0;
    _text1.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text1];

    _text2=[[UILabel alloc]init];
    _text2.textColor=kStatusGrayColor;
    _text2.font=[UIFont systemFontOfSize:10];
    _text2.numberOfLines=0;
    _text2.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text2];
    
    _text3=[[UILabel alloc]init];
    _text3.textColor=kStatusGrayColor;
    _text3.font=[UIFont systemFontOfSize:10];
    _text3.numberOfLines=0;
    _text3.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text3];

    _text4=[[UILabel alloc]init];
    _text4.textColor=kStatusGrayColor;
    _text4.font=[UIFont systemFontOfSize:10];
    _text4.numberOfLines=0;
    _text4.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text4];
    
    _text5=[[UILabel alloc]init];
    _text5.textColor=kStatusGrayColor;
    _text5.font=[UIFont systemFontOfSize:10];
    _text5.numberOfLines=0;
    _text5.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text5];

    _text6=[[UILabel alloc]init];
    _text6.textColor=kStatusGrayColor;
    _text6.font=[UIFont systemFontOfSize:10];
    _text6.numberOfLines=0;
    _text6.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text6];
    
    _text7=[[UILabel alloc]init];
    _text7.textColor=kStatusGrayColor;
    _text7.font=[UIFont systemFontOfSize:10];
    _text7.numberOfLines=0;
    _text7.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_text7];

    _time0=[[UILabel alloc]init];
    _time0.textColor=kStatusGrayColor;
    _time0.font=[UIFont systemFontOfSize:10];
    _time0.numberOfLines=0;
    _time0.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time0];
    
    _time1=[[UILabel alloc]init];
    _time1.textColor=kStatusGrayColor;
    _time1.font=[UIFont systemFontOfSize:10];
    _time1.numberOfLines=0;
    _time1.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time1];

    _time2=[[UILabel alloc]init];
    _time2.textColor=kStatusGrayColor;
    _time2.font=[UIFont systemFontOfSize:10];
    _time2.numberOfLines=0;
    _time2.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time2];
    
    _time3=[[UILabel alloc]init];
    _time3.textColor=kStatusGrayColor;
    _time3.font=[UIFont systemFontOfSize:10];
    _time3.numberOfLines=0;
    _time3.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time3];
    
    _time4=[[UILabel alloc]init];
    _time4.textColor=kStatusGrayColor;
    _time4.font=[UIFont systemFontOfSize:10];
    _time4.numberOfLines=0;
    _time4.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time4];
    
    _time5=[[UILabel alloc]init];
    _time5.textColor=kStatusGrayColor;
    _time5.font=[UIFont systemFontOfSize:10];
    _time5.numberOfLines=0;
    _time5.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time5];
    
    _time6=[[UILabel alloc]init];
    _time6.textColor=kStatusGrayColor;
    _time6.font=[UIFont systemFontOfSize:10];
    _time6.numberOfLines=0;
    _time6.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time6];
    
    _time7=[[UILabel alloc]init];
    _time7.textColor=kStatusGrayColor;
    _time7.font=[UIFont systemFontOfSize:10];
    _time7.numberOfLines=0;
    _time7.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_time7];
    



}


#pragma mark 设置微博
-(void)setStatus:(G *)status{
    //设置头像大小和位置
    CGFloat avatarX=10,avatarY=5;
    CGRect hotPointRect=CGRectMake(avatarX, avatarY, 10, 12);
    _hotpoint.image=[UIImage imageNamed:status.hotpoint];
    _hotpoint.frame=hotPointRect;
    
    
    //设置微博内容大小和位置
    CGFloat textX=avatarX+30;
    CGFloat textY=5;
    CGRect text0Rect=CGRectMake(textX, textY,200 ,10 );
    _text0.text=status.text0;
    _text0.frame=text0Rect;
    
    CGFloat time0X=40;
    CGFloat time0Y=17;
    //根据文本内容取得文本占用空间大小
    CGSize time0Size=[status.time0 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time0Rect=CGRectMake(time0X, time0Y, time0Size.width,time0Size.height);
    _time0.text=status.time0;
    _time0.frame=time0Rect;
    
    CGFloat point0X=10,point0Y=35;
    CGRect point0Rect=CGRectMake(point0X, point0Y, 10, 12);
    _point0.image=[UIImage imageNamed:status.point0];
    _point0.frame=point0Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text1X=point0X+30;
    CGFloat text1Y=35;
    CGRect text1Rect=CGRectMake(text1X, text1Y,200 ,10 );
    _text1.text=status.text1;
    _text1.frame=text1Rect;
    
    CGFloat time1X=text1X;
    CGFloat time1Y=46;
    //根据文本内容取得文本占用空间大小
    CGSize time1Size=[status.time1 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time1Rect=CGRectMake(time1X, time1Y, time1Size.width,time1Size.height);
    _time1.text=status.time1;
    _time1.frame=time1Rect;
    
    CGFloat point1X=10,point1Y=65;
    CGRect point1Rect=CGRectMake(point1X, point1Y, 10, 12);
    _point1.image=[UIImage imageNamed:status.point1];
    _point1.frame=point1Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text2X=point1X+30;
    CGFloat text2Y=65;
    CGRect text2Rect=CGRectMake(text2X, text2Y,200 ,10 );
    _text2.text=status.text2;
    _text2.frame=text2Rect;
    
    CGFloat time2X=text2X;
    CGFloat time2Y=66;
    //根据文本内容取得文本占用空间大小
    CGSize time2Size=[status.time2 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time2Rect=CGRectMake(time2X, time2Y, time2Size.width,time2Size.height);
    _time2.text=status.time2;
    _time2.frame=time2Rect;
    
    CGFloat point2X=10,point2Y=95;
    CGRect point2Rect=CGRectMake(point2X, point2Y, 10, 12);
    _point2.image=[UIImage imageNamed:status.point2];
    _point2.frame=point2Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text3X=point2X+30;
    CGFloat text3Y=95;
    CGRect text3Rect=CGRectMake(text3X, text3Y,200 ,10 );
    _text3.text=status.text3;
    _text3.frame=text3Rect;
    
    CGFloat time3X=text3X;
    CGFloat time3Y=77;
    //根据文本内容取得文本占用空间大小
    CGSize time3Size=[status.time3 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time3Rect=CGRectMake(time3X, time3Y, time3Size.width,time3Size.height);
    _time3.text=status.time3;
    _time3.frame=time3Rect;
    
    CGFloat point3X=10,point3Y=125;
    CGRect point3Rect=CGRectMake(point3X, point3Y, 10, 12);
    _point3.image=[UIImage imageNamed:status.point3];
    _point3.frame=point3Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text4X=point3X+30;
    CGFloat text4Y=125;
    CGRect text4Rect=CGRectMake(text4X, text4Y,200 ,10 );
    _text4.text=status.text4;
    _text4.frame=text4Rect;
    
    CGFloat time4X=text4X;
    CGFloat time4Y=88;
    //根据文本内容取得文本占用空间大小
    CGSize time4Size=[status.time4 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time4Rect=CGRectMake(time4X, time4Y, time4Size.width,time4Size.height);
    _time4.text=status.time4;
    _time4.frame=time4Rect;
    
    CGFloat point4X=10,point4Y=155;
    CGRect point4Rect=CGRectMake(point4X, point4Y, 10, 12);
    _point4.image=[UIImage imageNamed:status.point4];
    _point4.frame=point4Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text5X=point4X+30;
    CGFloat text5Y=155;
    CGRect text5Rect=CGRectMake(text5X, text5Y,200 ,10 );
    _text5.text=status.text5;
    _text5.frame=text5Rect;
    
    CGFloat time5X=text5X;
    CGFloat time5Y=99;
    //根据文本内容取得文本占用空间大小
    CGSize time5Size=[status.time5 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time5Rect=CGRectMake(time5X, time5Y, time5Size.width,time5Size.height);
    _time5.text=status.time5;
    _time5.frame=time5Rect;
    
    CGFloat point5X=10,point5Y=185;
    CGRect point5Rect=CGRectMake(point5X, point5Y, 10, 12);
    _point5.image=[UIImage imageNamed:status.point5];
    _point5.frame=point5Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text6X=point5X+30;
    CGFloat text6Y=185;
    CGRect text6Rect=CGRectMake(text6X, text6Y,200 ,10 );
    _text6.text=status.text6;
    _text6.frame=text6Rect;
    
    CGFloat time6X=text6X;
    CGFloat time6Y=110;
    //根据文本内容取得文本占用空间大小
    CGSize time6Size=[status.time6 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time6Rect=CGRectMake(time6X, time6Y, time6Size.width,time6Size.height);
    _time6.text=status.time6;
    _time6.frame=time6Rect;
    
    CGFloat point6X=10,point6Y=215;
    CGRect point6Rect=CGRectMake(point6X, point6Y, 10, 12);
    _point6.image=[UIImage imageNamed:status.point6];
    _point6.frame=point6Rect;
    
    
    //设置微博内容大小和位置
    CGFloat text7X=point6X+30;
    CGFloat text7Y=215;
    CGRect text7Rect=CGRectMake(text7X, text7Y,200 ,10 );
    _text7.text=status.text7;
    _text7.frame=text7Rect;
    
    CGFloat time7X=text7X;
    CGFloat time7Y=121;
    //根据文本内容取得文本占用空间大小
    CGSize time7Size=[status.time7 sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect time7Rect=CGRectMake(time7X, time7Y, time7Size.width,time7Size.height);
    _time7.text=status.time7;
    _time7.frame=time7Rect;
    

    CGFloat sslX=10,sslY=5;
    CGRect sslRect=CGRectMake(sslX, sslY, 1, 380);
    _ssl.image=[UIImage imageNamed:status.ssl];
    _ssl.frame=sslRect;
    
    CGFloat sl0X=40,sl0Y=31;
    CGRect sl0Rect=CGRectMake(sl0X, sl0Y, 300, 1);
    _sl0.image=[UIImage imageNamed:status.sl0];
    _sl0.frame=sl0Rect;
    
    CGFloat sl1X=40,sl1Y=61;
    CGRect sl1Rect=CGRectMake(sl1X, sl1Y, 300, 1);
    _sl1.image=[UIImage imageNamed:status.sl1];
    _sl1.frame=sl1Rect;
    
    CGFloat sl2X=40,sl2Y=91;
    CGRect sl2Rect=CGRectMake(sl2X, sl2Y, 300, 1);
    _sl2.image=[UIImage imageNamed:status.sl2];
    _sl2.frame=sl0Rect;
    
    CGFloat sl3X=40,sl3Y=121;
    CGRect sl3Rect=CGRectMake(sl0X, sl0Y, 300, 1);
    _sl3.image=[UIImage imageNamed:status.sl3];
    _sl3.frame=sl3Rect;
    
    CGFloat sl4X=40,sl4Y=151;
    CGRect sl4Rect=CGRectMake(sl4X, sl4Y, 300, 1);
    _sl4.image=[UIImage imageNamed:status.sl4];
    _sl4.frame=sl4Rect;
    
    CGFloat sl5X=40,sl5Y=181;
    CGRect sl5Rect=CGRectMake(sl5X, sl5Y, 300, 1);
    _sl5.image=[UIImage imageNamed:status.sl5];
    _sl5.frame=sl5Rect;
    
    CGFloat sl6X=40,sl6Y=211;
    CGRect sl6Rect=CGRectMake(sl6X, sl6Y, 300, 1);
    _sl6.image=[UIImage imageNamed:status.sl6];
    _sl6.frame=sl6Rect;
    
    CGFloat sl7X=40,sl7Y=241;
    CGRect sl7Rect=CGRectMake(sl7X, sl7Y, 300, 1);
    _sl7.image=[UIImage imageNamed:status.sl7];
    _sl7.frame=sl7Rect;
    

    

    
    
    _height=CGRectGetMaxY(_ssl.frame)+kStatusTableViewCellControlSpacing;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

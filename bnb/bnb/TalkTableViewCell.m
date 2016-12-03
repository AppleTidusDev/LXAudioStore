//
//  TalkTableViewCell.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/27.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "TalkTableViewCell.h"
#import "TalkStatus.h"
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

@interface  TalkTableViewCell(){
    UILabel *_title;
    UILabel *_name;
    UILabel *_level;
    UILabel *_day;
    UILabel *_time;
    UILabel *_number;
    UIImageView *_label;
}
@end

@implementation TalkTableViewCell

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
    _label=[[UIImageView alloc]init];
    [self.contentView addSubview:_label];
    //日期
    _title=[[UILabel alloc]init];
    _title.textColor=kStatusLightGrayColor;
    _title.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_title];
    //设备
    _name=[[UILabel alloc]init];
    _name.textColor=[UIColor blackColor];
    _name.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_name];
    //内容
    _level=[[UILabel alloc]init];
    _level.textColor=[UIColor blackColor];
    _level.font=[UIFont systemFontOfSize:11];
    //    _text.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_level];
    
    _title=[[UILabel alloc]init];
    _title.textColor=[UIColor blackColor];
    _title.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:_title];
    
    _number=[[UILabel alloc]init];
    _number.textColor=kStatusGrayColor;
    _number.font=[UIFont systemFontOfSize:11];
    
    _day=[[UILabel alloc]init];
    _day.textColor=kStatusGrayColor;
    _day.font=[UIFont systemFontOfSize:8];
    [self.contentView addSubview:_day];
    
    _time=[[UILabel alloc]init];
    _time.textColor=kStatusGrayColor;
    _time.font=[UIFont systemFontOfSize:8];
    [self.contentView addSubview:_time];
    
}


#pragma mark 设置微博
-(void)setStatus:(TalkStatus *)status{
    //设置头像大小和位置
    CGFloat avatarX=10,avatarY=10;
    CGRect labelRect=CGRectMake(avatarX, avatarY, 30, 30);
    _label.image=[UIImage imageNamed:status.label];
    _label.frame=labelRect;
    
    
    //设置微博内容大小和位置
    
    CGRect textRect=CGRectMake(50, 10,60 ,14 );
    _name.text=status.name;
    _name.frame=textRect;
    
    _height=CGRectGetMaxY(_title.frame)+40;
    
    //根据文本内容取得文本占用空间大小
    CGSize levelSize=[status.level sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11]}];
    CGRect levelRect=CGRectMake(120, 13, levelSize.width,levelSize.height);
    _level.text=status.level;
    _level.frame=levelRect;
    
    
    CGFloat numberPX=330;
    CGFloat numberPY=10;
    CGRect numberRect=CGRectMake(numberPX, numberPY, 20, 11);
    _number.text=status.number;
    _number.frame=numberRect;
    
    
    CGSize daySize=[status.day sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]}];
    CGFloat dayX=50;
    CGFloat dayY=35;
    CGRect dayRect=CGRectMake(dayX, dayY, daySize.width, daySize.height);
    _day.text=status.day;
    _day.frame=dayRect;
    
    CGSize timeSize=[status.time sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]}];
    CGFloat timePX=80;
    CGFloat timePY=35;
    CGRect timePRect=CGRectMake(timePX, timePY, timeSize.width,timeSize.height);
    _time.text=status.time;
    _time.frame=timePRect;
    
    
    //设置设备信息大小和位置
    CGSize titleSize=[status.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    CGFloat titleX=10;
    CGFloat titleY=70;
    CGRect titleRect=CGRectMake(titleX, titleY, titleSize.width,titleSize.height);
    _title.text=status.title;
    _title.frame=titleRect;
    
    
    _height=CGRectGetMaxY(_title.frame)+kStatusTableViewCellControlSpacing;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

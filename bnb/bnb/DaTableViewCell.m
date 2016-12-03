//
//  DaTableViewCell.m
//  bnb
//
//  Created by 谭 卓勋 on 16/10/29.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "DaTableViewCell.h"
#import "DaStatus.h"
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
@interface  DaTableViewCell(){
    UILabel *_statu;
    UILabel *_name;
    UILabel *_add;
    UILabel *_day;
    UILabel *_time;
    UILabel *_detail;
    UIImageView *_pro;
    UILabel *_money;
    UILabel *_pay;
    UIImageView *_sa;
}
@end

@implementation DaTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

-(void)initSubView{
    //头像控件
    _pro=[[UIImageView alloc]init];
    [self.contentView addSubview:_pro];
    
    _sa=[[UIImageView alloc]init];
    [self.contentView addSubview:_sa];
    //日期
    
    _statu=[[UILabel alloc]init];
    _statu.textColor=[UIColor redColor];
    _statu.font=[UIFont systemFontOfSize:18];
    _statu.numberOfLines=0;
    _statu.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_statu];

    //设备
    _name=[[UILabel alloc]init];
    _name.textColor=[UIColor blackColor];
    _name.font=[UIFont systemFontOfSize:18];
    _name.numberOfLines=0;
    _name.lineBreakMode=NSLineBreakByTruncatingTail;

    [self.contentView addSubview:_name];
    //内容
    
    _detail=[[UILabel alloc]init];
    _detail.textColor=kStatusGrayColor;
    _detail.font=[UIFont systemFontOfSize:16];
    _detail.numberOfLines=0;
    _detail.lineBreakMode=NSLineBreakByWordWrapping;

    [self.contentView addSubview:_detail];
    
    _add=[[UILabel alloc]init];
    _add.textColor=[UIColor grayColor];
    _add.font=[UIFont systemFontOfSize:16];
    _add.numberOfLines=0;
    _add.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_add];
    
    _day=[[UILabel alloc]init];
    _day.textColor=kStatusGrayColor;
    _day.font=[UIFont systemFontOfSize:14];
    _day.numberOfLines=0;
    _day.lineBreakMode=NSLineBreakByTruncatingTail;

    [self.contentView addSubview:_day];
    
    _time=[[UILabel alloc]init];
    _time.textColor=kStatusGrayColor;
    _time.font=[UIFont systemFontOfSize:14];
    _time.numberOfLines=0;
    _time.lineBreakMode=NSLineBreakByTruncatingTail;

    [self.contentView addSubview:_time];
    
    _money=[[UILabel alloc]init];
    _money.textColor=kStatusGrayColor;
    _money.font=[UIFont systemFontOfSize:16];
    _money.numberOfLines=0;
    _money.lineBreakMode=NSLineBreakByWordWrapping;

    [self.contentView addSubview:_money];
    
    _pay=[[UILabel alloc]init];
    _pay.textColor=[UIColor blackColor];
    _pay.font=[UIFont systemFontOfSize:16];
    _pay.numberOfLines=0;
    _pay.lineBreakMode=NSLineBreakByTruncatingTail;

    [self.contentView addSubview:_pay];
}
-(void)setStatus:(DaStatus *)status{
    CGSize nameSize=[status.name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    CGRect  nameRect=CGRectMake(5, 5, nameSize.width, nameSize.height) ;
    _name.text=status.name;
    _name.frame=nameRect;
    
    CGSize statuSize=[status.statu sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    CGRect statuRect=CGRectMake(290, 5, statuSize.width, statuSize.height);
    _statu.text=status.statu;
    _statu.frame=statuRect;
    
    
    CGRect addRect=CGRectMake(5, 40, 300, 40);
    _add.text=status.add;
    _add.textAlignment=NSTextAlignmentLeft;
    _add.frame=addRect;
    [_add sizeToFit];
    
    CGRect detailRect=CGRectMake(100, 160, 230, 60);
    _detail.text=status.detail;
    _detail.textAlignment=NSTextAlignmentLeft;
    _detail.frame=detailRect;
    [_detail sizeToFit];
    
    CGSize daySize=[status.day sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGRect dayRect=CGRectMake(10 , 120, daySize.width, daySize.height);
    _day.text=status.day;
    _day.frame=dayRect;
    
    CGSize timeSize=[status.time sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGRect timePRect=CGRectMake(90  , 120, timeSize.width,timeSize.height);
    _time.text=status.time;
    _time.frame=timePRect;
    
    
    CGRect proRect=CGRectMake(10, 150, 80, 80);
    _pro.image=[UIImage imageNamed:status.pro];
    _pro.frame=proRect;
    
    CGRect saRect=CGRectMake(330, 90, 10, 20) ;
    _sa.image=[UIImage imageNamed:status.sa];
    _sa.frame=saRect;
    
    CGSize moneySize=[status.money sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    CGRect moneyRect=CGRectMake(10, 250, moneySize.width, moneySize.height);
    _money.text=status.money;
    _money.frame=moneyRect;
    
    CGSize paySize=[status.pay sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    CGRect payRect=CGRectMake(65, 250, paySize.width, paySize.height);
    _pay.text=status.pay;
    _pay.frame=payRect;
    
    _height=CGRectGetMaxY(_pay.frame)+kStatusTableViewCellControlSpacing;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

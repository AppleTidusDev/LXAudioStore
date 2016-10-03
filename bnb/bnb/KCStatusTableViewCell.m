//
//  KCStatusTableViewCell.m
//  bnb
//
//  Created by 谭 卓勋 on 16/9/25.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//

#import "KCStatusTableViewCell.h"
#import "KCStatus.h"
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
@interface KCStatusTableViewCell(){
    UILabel*_text;
    UILabel *_title;
    UILabel *_words;
    UILabel *_reading;
    UIImageView *_wordsP;
    UIImageView *_readingP;
    UIImageView *_product;
    
}
@end
@implementation KCStatusTableViewCell

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
    _wordsP=[[UIImageView alloc]init];
    [self.contentView addSubview:_wordsP];
    //用户名
    _text=[[UILabel alloc]init];
    _text.textColor=kStatusGrayColor;
    _text.font=[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    _text.numberOfLines=0;
    _text.lineBreakMode = NSLineBreakByTruncatingTail;

    [self.contentView addSubview:_text];
    //会员类型
    _readingP=[[UIImageView alloc]init];
    [self.contentView addSubview:_readingP];
    //日期
    _title=[[UILabel alloc]init];
    _title.textColor=kStatusLightGrayColor;
    _title.font=[UIFont systemFontOfSize:kStatusTableViewCellTitleFontSize];
    [self.contentView addSubview:_title];
    //设备
    _words=[[UILabel alloc]init];
    _words.textColor=kStatusLightGrayColor;
    _words.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
    [self.contentView addSubview:_words];
    //内容
    _reading=[[UILabel alloc]init];
    _reading.textColor=kStatusGrayColor;
    _reading.font=[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize];
        //    _text.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_reading];
    _product=[[UIImageView alloc]init];
    [self.contentView addSubview:_product];
}


#pragma mark 设置微博
-(void)setStatus:(KCStatus *)status{
    //设置头像大小和位置
    CGFloat avatarX=10,avatarY=10;
    CGRect productRect=CGRectMake(avatarX, avatarY, kStatusTableViewCellAvatarWidth, kStatusTableViewCellAvatarHeight);
    _product.image=[UIImage imageNamed:status.product];
    _product.frame=productRect;
    
    
    //设置微博内容大小和位置
    CGFloat textX=avatarX+130;
    CGFloat textY=40;
    CGRect textRect=CGRectMake(textX, textY,200 ,60 );
    _text.text=status.text;
    _text.frame=textRect;
    _height=CGRectGetMaxY(_text.frame)+40;
    
    CGFloat wordsX=250;
    CGFloat wordsY=95;
    //根据文本内容取得文本占用空间大小
    CGSize wordsSize=[status.words sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGRect wordsRect=CGRectMake(wordsX, wordsY, wordsSize.width,wordsSize.height);
    _words.text=status.words;
    _words.frame=wordsRect;
    
    
    CGFloat wordsPX=220;
    CGFloat wordsPY=95;
    CGRect wordsPRect=CGRectMake(wordsPX, wordsPY, kStatusTableViewCellMbTypeWidth, kStatusTableViewCellMbTypeHeight);
    _wordsP.image=[UIImage imageNamed:status.wordsP];
    _wordsP.frame=wordsPRect;
    
    
    CGSize readingSize=[status.reading sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellSmallFontSize]}];
    CGFloat readingX=300;
    CGFloat readingY=95;
    CGRect readingRect=CGRectMake(readingX, readingY, readingSize.width, readingSize.height);
    _reading.text=status.reading;
    _reading.frame=readingRect;
    
    CGFloat readingPX=270;
    CGFloat readingPY=95;
    CGRect readingPRect=CGRectMake(readingPX, readingPY, kStatusTableViewCellMbTypeWidth, kStatusTableViewCellMbTypeHeight);
    _readingP.image=[UIImage imageNamed:status.readingP];
    _readingP.frame=readingPRect;
    
    
    //设置设备信息大小和位置
    CGSize titleSize=[status.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTitleFontSize]}];
    CGFloat titleX=CGRectGetMaxX(_product.frame)+kStatusTableViewCellControlSpacing;
    CGFloat titleY=20;
    CGRect titleRect=CGRectMake(titleX, titleY, titleSize.width,titleSize.height);
    _title.text=status.title;
    _title.frame=titleRect;
    
    
    _height=CGRectGetMaxY(_text.frame)+kStatusTableViewCellControlSpacing;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

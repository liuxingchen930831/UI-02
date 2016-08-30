//
//  ViewController.m
//  UI-02
//
//  Created by liuxingchen on 16/8/30.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopView;
@end

@implementation ViewController

//一进来就会调用viewDidLoad方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self frame:CGRectMake(50, 50, 70, 70) normalImage:@"add" highlightedImage:@"add_highlighted" disabledImage:@"add_disabled" tag:10 action:@selector(add:)];
    
    [self frame:CGRectMake(250, 50, 70, 70) normalImage:@"remove" highlightedImage:@"remove_highlighted" disabledImage:@"remove_disabled" tag:20 action:@selector(remove:)];
    
}
#pragma mark 思考:如果两段差不多的代码，只是参数不同，是否有办法写一段代码完成这件事？ 结果:把二者相同的公共属性抽取出来
-(void)lowMethods
{
    UIButton *addbtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    //设置按钮点击的图片
    [addbtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addbtn setImage:[UIImage imageNamed:@"add_highlighted"] forState:UIControlStateHighlighted];
    [addbtn setImage:[UIImage imageNamed:@"add_disabled"] forState:UIControlStateDisabled];
    addbtn.tag = 10;
    //添加按钮的点击事件add:代表把当前的button传递出去然后在方法中接受一下
    [addbtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addbtn];
    
    UIButton *removeBtn = [[UIButton alloc]initWithFrame:CGRectMake(270, 50, 50, 50)];
    [removeBtn setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [removeBtn setImage:[UIImage imageNamed:@"remove_highlighted"] forState:UIControlStateHighlighted];
    [removeBtn setImage:[UIImage imageNamed:@"remove_disabled"] forState:UIControlStateDisabled];
    removeBtn.tag = 10;
    [removeBtn addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
}

-(void)frame:(CGRect) frame
 normalImage:(NSString *) normalImage
highlightedImage:(NSString *) highlightedImage
disabledImage:(NSString *) disabledImage
          tag:(NSInteger) tag
       action:(SEL) action
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    btn.tag = tag;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)add:(UIButton *)btn;
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image = [UIImage imageNamed:@"danjianbao"];
    [self.shopView addSubview:imageView];
    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 50, 20)];
    label.text = @"单肩包";
    
    //设置字体大小
    label.font = [UIFont systemFontOfSize:13];
    //设置字体居中
    label.textAlignment = NSTextAlignmentCenter;
    NSLog(@"%@",btn);
    [self.shopView addSubview:label];
}
-(void)remove:(UIButton *)btn;
{
    NSLog(@"%@",btn);
}

@end

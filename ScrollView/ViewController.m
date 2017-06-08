//
//  ViewController.m
//  ScrollView
//
//  Created by yanliu on 2017/3/10.
//  Copyright © 2017年 huawei. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)  UIView *contentView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *contentView = [[UIView alloc] init];
    
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    contentView.backgroundColor = [UIColor lightGrayColor];
    
    _contentView = contentView;
    
    UILabel *dataLabel = [[UILabel alloc] init];
    [contentView addSubview:dataLabel];
    [dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(16);
        make.left.equalTo(contentView).offset(16);
        make.right.lessThanOrEqualTo(contentView).offset(-16);
        make.bottom.equalTo(contentView.mas_bottom).offset(-16);
    }];
    dataLabel.numberOfLines = 0;
    dataLabel.text = @"This may not seem very useful at first. In fact, why not just increase the content size? Well, you should avoid changing the content size of a scroll view unless you have to. To understand why, consider a table view (UITableView is a subclass of UIScrollView, so it has all of the same properties). The table view’s scrollable area has been carefully calculated to fit each one of its cells snugly. When you scroll past the boundaries of the table view’s first or last cells, the table view snaps the content offset back into place, so that the cells once again fit snugly in the scroll view’s bounds. Now, what happens when you want to implement pull to refresh using a UIRefreshControl? You can’t put the UIRefreshControl within the scrollable area of the table view, otherwise, the table view would allow the user to stop scrolling halfway through the refresh control, and the top would snap to the top of the refresh control. Thus, you must put refresh control just above the scrollable area. This allows the content offset to snap back to the first row, not the refresh control. But wait, if you initiate the pull-to-refresh mechanism by scrolling far enough, the table view does allow the content offset to snap refresh control into the scrollable area, and this is because of the table view’s content inset. When the refresh action is initiated, the content inset is adjusted so that the minimum content offset includes the entirety of the refresh control. When the refresh completes, the content inset is returned to normalcy, the content offset follows suit, and none of the math required for determining the content size needs to be re-computed.How can you use the content inset in your own code? Well, there is one great use for the it: when the keyboard is on the screen. Typically, you try to design a user interface that fits the screen snugly. When the keyboard appears on the screen, you lose a few hundred pixels of that space. All of the stuff underneath the keyboard is obscured.Now, the scroll view’s bounds haven’t changed, and neither has its content size (nor should it). But the user can’t scroll the scroll view. Think about the equation from earlier: the maximum content offset is the difference between the content size and the bounds’ size. If they are equal, which they are in your snug interface that now has a keyboard messing up your day, the maximum content offset is {x:0, y:0}.croll view’s bounds. When the keyboard appears on the screen, you set the bottom of the content inset equal to the height of the keyboard.";
    
    dataLabel.text = @"This may not seem very useful at first. In fact, why not just increase the content size? Well, you should avoid changing the content size of a scroll view unless you have to. To understand why, consider a table view (UITableView is a subclas";

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"content offset :%@",NSStringFromCGPoint(scrollView.contentOffset));
    
    NSLog(@"scroll view bound : %@",NSStringFromCGRect(scrollView.bounds));
    
    NSLog(@"scroll view frame : %@", NSStringFromCGRect(scrollView.frame));
    
    NSLog(@"content view bound : %@",NSStringFromCGRect(_contentView.bounds));
    
    NSLog(@"content view frame : %@", NSStringFromCGRect(_contentView.frame));
}

@end

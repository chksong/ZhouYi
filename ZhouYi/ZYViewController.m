//
//  ZYViewController.m
//  ZhouYi
//
//  Created by chksong on 15/8/14.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "ZYViewController.h"

@interface ZYViewController ()<UITableViewDataSource, UITableViewDelegate>  {
    NSArray *arrayItem  ;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end




@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayItem = @[@"乾" ,@"坤"] ;
    
    
    self.tableView.dataSource = self ;
    self.tableView.delegate = self ;
    
    //调整tableview的位置。 向下移动
    [self.tableView setContentInset:UIEdgeInsetsMake(16, 0 , 16, 0)];
    
    //去掉多余的 横线
    [self.tableView setTableFooterView:[[UIView alloc] init] ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// 在窗口显示的时候，navigationController 隐藏
-(void) viewDidAppear:(BOOL)animated  {
  //  NSLog(@"%s", __func__) ;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

// 在窗口退出的时候，还原导航栏显示
-(void) viewDidDisappear:(BOOL)animated  {
  //  NSLog(@"%s", __func__) ;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

//去掉分割线的 偏移
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

//去掉分割线的 偏移
-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [arrayItem count]  ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // ZYTableViewCellIdentifier
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYTableViewCellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = arrayItem[indexPath.row] ;
    
    return  cell ;
}

@end

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

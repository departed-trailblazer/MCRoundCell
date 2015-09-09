//
//  ViewController.m
//  MC_RoundCellDemo
//
//  Created by xulu on 15/9/9.
//  Copyright (c) 2015年 _MC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    tableView.backgroundColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 50;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 5;
            break;
        default:
            return 1;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSInteger count;
    switch (indexPath.section) {
        case 0:
            count = 3;
            break;
        case 1:
            count = 5;
            break;
        default:
            count = 1;
            break;
    }
    
    [self cellSetRoundBackgroundView:cell atIndex:indexPath.row count:count];
    
    UILabel *label = [self cellSetTextLabel:cell];
    
    label.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    return cell;
}


- (void)cellSetRoundBackgroundView:(UITableViewCell *)cell atIndex:(NSInteger)index count:(NSInteger)count {
    
    RoundCellBackGroundView * bgView = [[RoundCellBackGroundView alloc]initWithFrame:cell.bounds];
    
    if (count == 1) {
        bgView.style = CellStyleSingle;
    } else if  (index == 0){
        bgView.style = CellStyleTop;
    }else if (index == count - 1) {
        bgView.style = CellStyleBottom;
    } else {
        bgView.style = CellStyleMiddle;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundView = bgView;
}

- (UILabel *)cellSetTextLabel:(UITableViewCell *)cell {
    UILabel * label = (UILabel *)[cell viewWithTag:101];
    if (![cell viewWithTag:101]) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, cell.frame.size.width - 30, cell.frame.size.height)];
        label.tag = 101;
        label.font = [UIFont boldSystemFontOfSize:17];
        [cell addSubview:label];
    }
    return label;
}

@end

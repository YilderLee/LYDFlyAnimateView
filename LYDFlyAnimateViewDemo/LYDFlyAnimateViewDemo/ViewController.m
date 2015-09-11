//
//  ViewController.m
//
//
//  Created by yons on 15-9-8.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import "ViewController.h"
#import "LYDShopTableViewCell.h"
#import "LYDButton.h"
#import "LYDFlyAnimateView.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,LYDShopTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@property (weak, nonatomic) IBOutlet UITableView *subTable;

@property (nonatomic, strong) LYDButton *shoppingBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
    _subTable.dataSource = self;
    _subTable.delegate = self;
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blackColor];
    bottomView.frame = CGRectMake(0, self.view.frame.size.height - 64, self.view.frame.size.width, 64);
    [self.view addSubview:bottomView];
    
    _shoppingBtn = [[LYDButton alloc] init];
    _shoppingBtn.backgroundColor = [UIColor yellowColor];
    _shoppingBtn.frame = CGRectMake(10, 10, 40, 40);
    [_shoppingBtn addTarget:self action:@selector(shoppingBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_shoppingBtn];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _mainTable) {
        return 5;
    }
    else if (tableView == _subTable) {
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _mainTable) {
        static NSString *ID = @"mainTable";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] init];
        }
        cell.textLabel.text = @"哈哈";
        return cell;
    }
    else if (tableView == _subTable)
    {
        static NSString *ID = @"subTable";
        LYDShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"LYDShopTableViewCell" owner:nil options:nil].lastObject;
        }
        cell.textLabel.text = @"哈哈";
        cell.delegate = self;
        return cell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (void)LYDShopTableViewCellAddBtnDidClick:(UIButton *)btn
{
    CGRect fromRect = [btn.superview convertRect:btn.frame toView:self.view];
    CGRect toRect = [_shoppingBtn.superview convertRect:_shoppingBtn.frame toView:self.view];
    LYDFlyAnimateView *animate = [LYDFlyAnimateView flyAnimateFromRect:fromRect toRect:toRect withImage:[UIImage imageNamed:@"gift"]];
    animate.duration = 0.5;
    [animate show];
    _shoppingBtn.badgeValue += 1;
}

- (void)LYDShopTableViewCellReduceBtnDidClick:(UIButton *)btn
{
    _shoppingBtn.badgeValue -= 1;
}

- (void)shoppingBtnDidClick
{
    NSLog(@"dddd");
}

@end

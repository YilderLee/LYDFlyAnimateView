//
//  LYDShopTableViewCell.h
//
//
//  Created by yons on 15-9-8.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYDShopTableViewCell;

@protocol LYDShopTableViewCellDelegate <NSObject>

- (void)LYDShopTableViewCellAddBtnDidClick:(UIButton *)btn;

- (void)LYDShopTableViewCellReduceBtnDidClick:(UIButton *)btn;

@end

@interface LYDShopTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) id<LYDShopTableViewCellDelegate> delegate;

@end

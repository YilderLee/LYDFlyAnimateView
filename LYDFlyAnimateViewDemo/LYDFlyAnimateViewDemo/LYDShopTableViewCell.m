//
//  LYDShopTableViewCell.m
//  
//
//  Created by yons on 15-9-8.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import "LYDShopTableViewCell.h"

@interface LYDShopTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;


@end

@implementation LYDShopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (IBAction)reduceBtnDidClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(LYDShopTableViewCellReduceBtnDidClick:)]) {
        [self.delegate LYDShopTableViewCellReduceBtnDidClick:sender];
    }
}

- (IBAction)addBtnDidClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(LYDShopTableViewCellAddBtnDidClick:)]) {
        [self.delegate LYDShopTableViewCellAddBtnDidClick:sender];
    }
}



@end

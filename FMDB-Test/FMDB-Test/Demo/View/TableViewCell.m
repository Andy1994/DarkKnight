//
//  TableViewCell.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}

- (void)setMessage:(Message *)message {
    _message = message;
    self.nameLabel.text = message.otherUser.name;
    self.messageLabel.text = message.content;
    self.timeLabel.text = [NSString stringWithFormat:@"%@",message.time];
    
    if (message.userId != 1) {
        self.nameLabel.textAlignment = NSTextAlignmentRight;
        self.messageLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
    }
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(10, 0, ScreenWith - 20, 25);
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _nameLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.frame = CGRectMake(10, 25, ScreenWith - 20, 25);
        _messageLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        _messageLabel.font = [UIFont systemFontOfSize:13];
    }
    return _messageLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.adjustsFontSizeToFitWidth = YES;
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.frame = CGRectMake(0, 0, ScreenWith - 20, 25);
        _timeLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        _timeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _timeLabel;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.messageLabel.textAlignment = NSTextAlignmentLeft;
    self.timeLabel.textAlignment = NSTextAlignmentRight;
}

@end

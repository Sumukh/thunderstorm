//
//  WriterTableViewCell.m
//  Thunderstorm
//
//  Created by Darshan Shankar on 6/22/14.
//  Copyright (c) 2014 Darshan Shankar. All rights reserved.
//

#import "WriterTableViewCell.h"
#import "SyntaxHighlightTextStorage.h"
#import "UIColor+ThunderColors.h"

@implementation WriterTableViewCell
{
    SyntaxHighlightTextStorage* _textStorage;
}

@synthesize textView;
@synthesize tweetId;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createTextView];
                
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        tweetId = [[UILabel alloc] initWithFrame:CGRectMake(4,4,18,18)];
        [tweetId setFont:[UIFont fontWithName:@"CrimsonText-Roman" size:19.0f]];
        [tweetId setTextColor:[UIColor mutedGray]];
        [self.textView addSubview:tweetId];
        [self.textView setKeyboardType:UIKeyboardTypeTwitter];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) createTextView
{
    NSDictionary *attrs = @{NSFontAttributeName: [UIFont fontWithName:@"CrimsonText-Roman" size:19.0f]};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"1/What's on your mind?" attributes:attrs];
    _textStorage = [SyntaxHighlightTextStorage new];
    [_textStorage appendAttributedString:attrString];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    CGSize containerSize = CGSizeMake(300, 300);
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:containerSize];
    container.widthTracksTextView = YES;
    [layoutManager addTextContainer:container];
    [_textStorage addLayoutManager:layoutManager];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10,10,300,30) textContainer:container];
    [textView setTextContainerInset:UIEdgeInsetsZero];
    [textView setContentInset:UIEdgeInsetsZero];
    
    [self.contentView addSubview:textView];
}

@end

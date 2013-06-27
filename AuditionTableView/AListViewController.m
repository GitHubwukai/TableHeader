//
//  AListViewController.m
//  AuditionTableView
//
//  Created by 贾玉辉 on 13-5-16.
//  Copyright (c) 2013年 Audition. All rights reserved.
//

#import "AListViewController.h"

///-------------------
/// 测试数据
///-------------------
#if 0
static NSString * const kHeaderModelTitleContent = @"手机 QQ 2013（4.0 版）的联系人头像全点亮，QQ 产品团队做这个决定是出于什么考虑？";
static NSString * const kHeaderModelDesContent = @"腾讯最新发布的手机 QQ，不管是联系人，还是「动态」里面的「在线好友」，头像全都是亮着的。由于导致不好区分好友在线还是离线，许多用户吐槽新版。然而，任何一个产品功能的调整，都应该有背后的产品理念做为支持。那么，新版手机 QQ 产品经理是怎么考虑的？非手机 QQ 产品相关的朋友，如果想发表观点，可以在下面这些相关问题发表观点:反驳已有答案的不同观点也应该作为答案的评论提交，避免出现答非所问的情况。谢谢！";
static NSString * const titleOne = @"   接受哪些消息通知";
static NSString * const titleTwo = @"   更快获知新回答";
static NSString * const footerString = @"开启后会接收到已关注的问题的全部新回答通知，即便这些答案与问题的相关度可能不够高";
#else 
static NSString * const kHeaderModelTitleContent = @"哪类应用的用户日活跃度最高？";
static NSString * const kHeaderModelDesContent = @"活跃度高到什么程度？有什么可借鉴的经验？";
static NSString * const titleOne = @"   接受哪些消息通知";
static NSString * const titleTwo = @"   更快获知新回答";
static NSString * const footerString = @"开启后会接收到已关注的问题的全部新回答通知，即便这些答案与问题的相关度可能不够高";
#endif

@interface AListViewController ()

@end

@implementation AListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	if (self = [super initWithStyle:style]) {
		
	}
	return self;
}


- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.tableView setBackgroundColor:[UIColor colorWithWhite:0.890 alpha:1.000]];
	
	
	//设置tableView的headView
	UIView *view = [[UIView alloc] init];
	
	//第一个label
	UILabel *labelOne = [self costumLabel:kHeaderModelTitleContent
								  andFont:@"Helvetica-Bold"andSizeL:15];
	float labelOneHight = labelOne.frame.size.height;
	
	//第二个label
	UILabel *labelTwo = [self costumLabel:kHeaderModelDesContent
								  andFont:@"Arial" andSizeL:12];
	//labelTwo的CGRect
	CGRect labelTwoRect = CGRectMake(10,
									 labelOneHight,
									 labelTwo.frame.size.width,
									 labelTwo.frame.size.height);
	labelTwo.frame = labelTwoRect;
	CGRect viewRect = CGRectMake(0,
								 0,
								 320.0f,
								 labelOne.frame.size.height+labelTwo.frame.size.height+10);
	
	view.frame = viewRect;
	[view setBackgroundColor:[UIColor colorWithWhite:1.000 alpha:1.000]];
	[view addSubview:labelOne];
	[view addSubview:labelTwo];
	
	self.tableView.tableHeaderView = view;
	self.tableView.tableHeaderView.hidden = NO;
	//设置footerview
	UIView *footView = [[UIView alloc] init];
	UILabel *footerLabel = [self costumLabel:footerString
									 andFont:@"Arial"
									andSizeL:12];
//	CGSize footViewSize = CGSizeMake(footerLabel.frame.size.width, footerLabel.frame.size.height);
	CGRect footViewRect = CGRectMake(0, 0, footerLabel.frame.size.width, footerLabel.frame.size.height+20);
	footView.frame = footViewRect;
	[footView addSubview:footerLabel];
	self.tableView.tableFooterView = footView;
	self.tableView.tableFooterView.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if(cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
  
  return cell;
}



#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UILabel *label = [[UILabel alloc] init];
	label = [self costumLabel:titleOne andFont:@"Arial" andSizeL:12];
	CGRect rect = label.frame;
	label.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
	return label;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}

#pragma mark - 定制headerView
- (UILabel *)costumLabel:(NSString *)labelText
				 andFont:(NSString *)textFont andSizeL:(CGFloat)textSize
{
	UILabel *label = [[UILabel alloc] init];
	UIFont *font = [UIFont fontWithName:textFont size:textSize];
	label.numberOfLines = 0;
	label.lineBreakMode = NSLineBreakByWordWrapping;
	label.text = labelText;
	label.backgroundColor = [UIColor clearColor];
	label.font = font;
	
	CGSize minisize = CGSizeMake(300.0f, 80.0f);
	//返回字体区域大小
	CGSize labelTextSize = [kHeaderModelDesContent sizeWithFont:font
											  constrainedToSize:minisize
												  lineBreakMode:label.lineBreakMode];
	
	//CGSize labelTextSize = [kHeaderModelDesContent sizeWithFont:font forWidth:300.0f lineBreakMode:NSLineBreakByWordWrapping];
	
	CGRect labelRect = CGRectMake(10, 0, labelTextSize.width, labelTextSize.height);
	label.frame = labelRect;
	return label;
	
}
@end

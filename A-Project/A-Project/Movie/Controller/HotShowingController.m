//
//  HotShowingController.m
//  A-Project
//
//  Created by lanou3g on 15/6/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//
#define kURL @"http://mobileif.maizuo.com/version3.1.1/city/12/film?index=0&count=100&type=1&clientID=31"
#import "HotShowingController.h"
#import "HotShoingMovie.h"
#import "HotShowingCell.h"
#import "MJRefresh.h"
@interface HotShowingController ()
{
    CGRect _rect;//保存当前物理屏幕大小
}
@property(nonatomic,retain)NSMutableArray *HotArr;

@property (nonatomic,retain)UITableView *tableView;//当前的tableview
@property (nonatomic,retain)NSMutableArray *tableViewData;//tableview中数组数组
@end

@implementation HotShowingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:@"HotShowingCell" bundle:nil] forCellReuseIdentifier:@"hot"];
    
  
    [self requestData];
    
    

    //开启刷新状态
    [self setupRefresh];
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",path);
}
//
//开始刷新自定义方法
- (void)setupRefresh
{
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    [self.tableView footerBeginRefreshing];
    //一些设置
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.tableView.headerPullToRefreshText = @"下拉刷新数据";
    self.tableView.headerReleaseToRefreshText = @"松开马上刷新数据";
    self.tableView.headerRefreshingText = @"刷新中...";
    
    self.tableView.footerPullToRefreshText = @"上拉加载更多数据";
    self.tableView.footerReleaseToRefreshText = @"松开加载更多数据";
    self.tableView.footerRefreshingText = @"加载中...";
}
//下拉刷新
- (void)headerRereshing
{
    //一般这些个里边是网络请求，然后会有延迟，不会像现在刷新这么快
    // 1.添加假数据
    [self.tableViewData insertObject:@"这是刷新的数据" atIndex:0];
    [self.tableView reloadData];
    //2.结束刷新
    [self.tableView headerEndRefreshing];
}
//上拉加载
- (void)footerRereshing
{
    //这个一般是提取缓存的数据
    // 1.添加假数据
    [self.tableViewData insertObject:@"这是加载以前的数据" atIndex:[_tableViewData count]];
    [self.tableView reloadData];
    //2,结束刷新
    [self.tableView footerEndRefreshing];
}
-(void)requestData
{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:kURL]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:([NSOperationQueue mainQueue]) completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        NSArray *arr=[dic valueForKey:@"filmList"];
        
        self.HotArr=[NSMutableArray array];
        
        for (NSDictionary *movieDic in arr) {
           
            HotShoingMovie *hotMovie=[[HotShoingMovie alloc]init];
            
            [hotMovie setValuesForKeysWithDictionary:movieDic];
            
            [self.HotArr addObject:hotMovie];
            
            
            [hotMovie release];
        }
        [self.tableView reloadData];
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _HotArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotShowingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hot" forIndexPath:indexPath];
    
    cell.hotMovie=self.HotArr[indexPath.row];
   
    return cell;
}

#define
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

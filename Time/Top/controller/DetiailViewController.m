//
//  DetiailViewController.m
//  Time
//
//  Created by imac on 15/8/8.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "DetiailViewController.h"
#import "DetailHeadView.h"
#import "CommenCell.h"
#import "Comment.h"
@interface DetiailViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *_detailTableView;
    NSMutableDictionary *_detailData;
    DetailHeadView *_headView;
    NSMutableArray *_imageData;
    NSIndexPath *_indexPath;        // 当前选中的单元格的索引
}
@end

@implementation DetiailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // _headView.detail = _detailData;

    [self _loadData];
    [self _createViews];
    self.title=nil;
    
        self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
}
- (void)viewWillAppear:(BOOL)animated
{

    
    // 加载头视图的数据
    _headView.detail = _detailData;
    
}

//// 显示时隐藏标签栏
//- (void)viewWillDisappear:(BOOL)animated
//{
//    MainTabBarController *main = (MainTabBarController *)self.tabBarController;
//    [main setTabBarHidden:NO animation:YES];
//}



//- (void)viewWillAppear:(BOOL)animated
//{
//    MainTabBarController *main = (MainTabBarController *)self.tabBarController;
//    [main setTabBarHidden:YES animation:YES];
//    
//    // 加载头视图的数据
//    
//}

#pragma mark - 读取数据
- (void)_loadData
{
    // 1. 获取文件路径
    NSString *filePath =[[NSBundle mainBundle]pathForResource:@"movie_detail" ofType:@"json"];
    
    // 2. 读取文件到NSData
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    // 3. 解析文件
    _detailData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    
    NSString *filePath2=[[NSBundle mainBundle]pathForResource:@"movie_comment" ofType:@"json"];
    NSData *da =[NSData dataWithContentsOfFile:filePath2];
    NSError *error=[[NSError alloc]init];
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:da options:NSJSONReadingMutableLeaves error:&error];
    
    _imageData=[[NSMutableArray alloc]init];
    
    for(NSDictionary *d in dic[@"list"]){
        Comment *com=[[Comment alloc]initContentWithDic:d];
        [_imageData addObject:com];
    }
    
    
}

#pragma mark - 创建视图
- (void)_createViews
{
    // 创建表视图
    _detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    [self.view addSubview:_detailTableView];
    
    _detailTableView.dataSource = self;
    _detailTableView.delegate = self;
    
    // 创建表视图的头视图
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DetailHeadView" owner:nil options:nil];
    _headView = [array lastObject];
    _detailTableView.tableHeaderView = _headView;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imageData.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    CommenCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CommenCell" ];
    if(cell==nil){
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"CommenCell" owner:nil options:nil];
        
        cell=[array lastObject];
        
        cell.headImage.layer.cornerRadius = 5;
        cell.headImage.layer.borderColor = [[UIColor yellowColor] CGColor];
        cell.headImage.layer.borderWidth = 2;
        cell.headImage.layer.masksToBounds = YES;
    }
    
    cell.com=_imageData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _indexPath.row)
    {
        // 当前单元格就是被选中的单元格
        // 拿到评论的字符串
        Comment *comment = _imageData[indexPath.row];
        NSString *content = comment.content;
        
        // 设置计算的选项
        CGSize maxSize = CGSizeMake(200, NSIntegerMax);
        NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        // 计算label的大小
        CGRect frame = [content boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attributes
                                             context:nil];
        
        NSLog(@"%f", frame.size.height);
        
        CGFloat cellHeight = frame.size.height;
        cellHeight = cellHeight * 1.2;
        cellHeight += 60;
        if (cellHeight < 100)
        {
            cellHeight = 100;
        }
        return cellHeight;
    }
    
    return 100;
}

#pragma mark - 单元格的选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 刷新表视图
    [_detailTableView reloadRowsAtIndexPaths:@[_indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

@end

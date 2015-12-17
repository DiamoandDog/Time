//
//  NewsViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"
#import "ImageViewController.h"
#import "NewsDetailViewController.h"
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   // UITableView *_listView;
    NSMutableArray *_newData;
    UIImageView *_topImageView;

    //UIImageView *_newsImageView;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"新闻";
    
    [self _loadData];
    
    
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
   // [self _creatView];
}
//
-(void)_loadData{
    //1.获取文件路劲
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"news_list" ofType:@"json"];
    
    
    //2.读取文件
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    
    //3.解析文件
    NSError *error=[[NSError alloc]init];
    NSArray *array= [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingMutableLeaves
                                                         error:&error];

    //数组初始化
    _newData=[[NSMutableArray alloc]init];
    for(NSDictionary *dic in array){
        News *new=[[News alloc]initContentWithDic:dic];
        [_newData addObject:new];
    }
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _newData.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 判断是否是第一个单元格
    if (indexPath.row == 0)
    {
        // 使用dequeueReusableCellWithIdentifier:方法来获取单元格，如果表视图是在故事版中创建的，那么系统就会自动懂查找故事版中的单元格
        // 注意！ 一定要给故事版中的单元格设定正确的id
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Topcell"];
        
        _topImageView = (UIImageView *)[cell.contentView viewWithTag:100];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
        News *news = _newData[0];
        [_topImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        label.text = news.title;
        
        return cell;
    }
    else
    {
        NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
        cell.news = _newData[indexPath.row];
        return cell;
    }
}
//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
    {
        return 150;
    }
        return 100;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取滑动视图y方向的偏移量
    CGFloat yOffSet=scrollView.contentOffset.y;
   // NSLog(@"y offSet = %f",scrollView.contentOffset.y);

    //只有在y方向偏移量小于0时，才需要放大图片
    if(yOffSet < 0)
    {
        //计算放大倍数scr
        //scale= 拉动后图片的高度 / 原本的图片高度
        CGFloat scale = (150 - yOffSet) / 150;
        //设置图片大小变换的transform
        CGAffineTransform transform=CGAffineTransformMakeScale(scale, scale);
        //对图片视图进行缩放变换
        _topImageView.transform = transform;
        //缩放完毕之后，对图片位置进行调整
        //调整图片的水平位置
        _topImageView.center=CGPointMake(kScreenWidth / 2, 0);
        //调整视图的竖直位置
        _topImageView.top=yOffSet;
    }
    else{
        //为了保险，对试图进行还原
        _topImageView.transform=CGAffineTransformIdentity;
    }
}

//表示图单元格选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取相对应的news 对象
    News *news= _newData[indexPath.row];
    NSInteger type = [news.type integerValue];
    if(type == 1){
        //push
        //1.获取故事版
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //2.从故事版中读取ViewController
        //-(id)instantiateINitialViewController;
       // -[(id)instantiateViewControllerWithIdentifier:(NSString *)identifier;
        //方法1：获取故事版的第一个视图控制器
        //方法2：根据一个 stotyBoard ID 来获取相应的ViewController
        ImageViewController *imageVC=[main instantiateViewControllerWithIdentifier:@"ImageViewController"];
        imageVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:imageVC animated:YES];
    }else{
        //普通新闻
        NewsDetailViewController *detail=[[NewsDetailViewController alloc]init];
        detail.hidesBottomBarWhenPushed=YES ;
        [self.navigationController pushViewController:detail animated:YES];
    }
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

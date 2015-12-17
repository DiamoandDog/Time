//
//  CinemaViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CinemaViewController.h"
#import "Cinema.h"
#import "CinemaTableViewCell.h"
@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_cinemaData;
    UITableView *_tableView;
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"影院";
    
    [self loadData];
    [self _createView];
    
}

-(void)loadData{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"cinema_list" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:filePath ];
    
    NSError *error=[[NSError alloc]init];
    NSDictionary *d=[NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableLeaves
                                                     error:&error];
    _cinemaData=[[NSMutableArray alloc]init];
    
    for(NSDictionary *dic in d[@"cinemaList"]){
    
        Cinema *cin=[[Cinema alloc]initContentWithDic:dic];
        
        [_cinemaData addObject:cin];
       // NSLog(@"%@",_cinemaData);
    }

}

-(void)_createView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource=self;
    _tableView.delegate=self;
 }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _cinemaData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ll"];
    
    if(cell==nil){
    
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"CinemaTableViewCell" owner:nil options:nil];
        cell=[array lastObject];
    
    }
    cell.cinema=_cinemaData[indexPath.row];
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];

    return cell;
}

//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
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

//
//  BaseTableViewController.m
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "BaseTableViewController.h"
#import "UITableView+JHNoData.h"
#import "YHToolsHeader.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _resourceArr = [NSMutableArray array];
    _pageIndex = 1;
    _cellHeight = 44;
    [self.view addSubview:self.tableView];
}

-(void)loadNetData{
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCR_W, KSCR_H-KNAV_H) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc]init];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.jh_showNoDataEmptyView = YES;
        //配置状态栏
        if(@available(iOS 11.0, *)){
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resourceArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    id model = _resourceArr[indexPath.row];
    if (_cellModelBlock) {
        _cellModelBlock(cell,model);
    }
    return cell;
}

#pragma mark -注册单元格
-(void)setCellIdentifier:(NSString *)cellIdentifier{
    _cellIdentifier = cellIdentifier;
    [self.tableView registerClass:NSClassFromString(_cellIdentifier) forCellReuseIdentifier:_cellIdentifier];
}

#pragma mark -添加上拉刷新下拉加载
-(void)setAddTabRefresh:(BOOL)addTabRefresh{
    _addTabRefresh = addTabRefresh;
    if (_addTabRefresh) {
        __weak typeof(self) weakSelf = self;
        [self.tableView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.pageIndex = 1;
            [weakSelf loadNetData];
        }]];
    }
}

#pragma mark -无数据样式
- (UIImageView *)imageViewForTableViewWhenDataSourceIsEmpty{
    UIImageView *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KX(217), KX(123))];
    imgv.image = KIMAGE(@"com_3");
    return imgv;
}
- (UILabel *)labelForTableViewWhenDataSourceIsEmpty{
    UILabel *lab = [YHTool creatLableWithFrame:CGRectMake(0, 0, KSCR_W, KSPA_50) font:KFONT_14 color:KCOLOR_6 txt:@"页面没有数据,去看看别的" alignment:NSTextAlignmentCenter];
    return lab;
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

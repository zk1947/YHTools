//
//  BaseTableViewController.h
//  YHTools
//
//  Created by 赵凯 on 2021/1/31.
//

#import "BaseViewController.h"
#import "MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN

/** 单元格回调 */
typedef void(^CellModelBlock)(UITableViewCell *cell, id model);

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

/** 列表 */
@property (nonatomic, strong) UITableView *tableView;

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *resourceArr;

/** 单元格高度 默认高度44 */
@property (nonatomic, assign) CGFloat cellHeight;

/** 单元格标识 */
@property (nonatomic, copy) NSString *cellIdentifier;

/** 单元格回调 */
@property (nonatomic, strong) CellModelBlock cellModelBlock;

/** 分页索引 默认分页1 */
@property (nonatomic, assign) int pageIndex;

/** 是否添加下拉刷新 */
@property (nonatomic, assign) BOOL addTabRefresh;

/** 数据加载 */
-(void)loadNetData;

@end

NS_ASSUME_NONNULL_END

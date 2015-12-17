//
//  Cinema.h
//  Time
//
//  Created by imac on 15/8/13.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "BaseModel.h"

@interface Cinema : BaseModel
@property(nonatomic,strong)NSNumber *isSeatSupport;
@property(nonatomic,strong)NSNumber *isCouponSupport;
@property(nonatomic,strong)NSNumber *isImaxSupport;
@property(nonatomic,strong)NSNumber *isGroupBuySupport;
@property(nonatomic,copy)NSString *grade;
@property(nonatomic,copy)NSString *lowPrice;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *distance;
//@property(nonatomic,copy)NSString *

@end

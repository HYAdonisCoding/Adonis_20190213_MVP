//
//  HYBlockHeadder.h
//  Adonis_20190213_MVP
//
//  Created by Adonis_HongYang on 2019/2/14.
//  Copyright © 2019年 Nikoyo (China）Electronics Systems Co., Ltd. All rights reserved.
//

#ifndef HYBlockHeadder_h
#define HYBlockHeadder_h

typedef void(^Success)(id data);
typedef void(^Failed)(id data);

typedef void(^TableViewDataSourceBlock)(id cell, id model, NSIndexPath *indexPath);

#endif /* HYBlockHeadder_h */

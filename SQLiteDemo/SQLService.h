//
//  SQLService.h
//  SQLiteDemo
//
//  Created by Lynch on 7/3/14.
//  Copyright (c) 2014 Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class Entity;
#define kDatabaseName @"TestDatabase"

@interface SQLService : NSObject

@property (nonatomic) sqlite3 *database;

- (BOOL)createDataTable:(sqlite3 *)db;//创建数据表

- (BOOL)insertData:(Entity *)entity;//插入数据

- (BOOL)updateData:(Entity *)entity;//更新数据

- (NSMutableArray *)getAllData;//获取全部数据

- (BOOL)deleteData:(Entity *)entity;//删除数据

- (NSMutableArray *)searchData:(NSString *)stringKey;//查询数据

@end



@interface Entity : NSObject

@property (nonatomic) int sqlId;
@property (nonatomic, strong) NSString *sqlText;
@property (nonatomic, strong) NSString *sqlName;

@end

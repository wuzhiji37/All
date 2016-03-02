//
//  SVDataBase.h
//  all
//
//  Created by 吴智极 on 16/3/1.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  @author 吴智极, 16-03-01 16:03:58
 *
 *  @brief 封装FMDB
 */
@interface SVDataBase : NSObject
/**
 *  @author 吴智极, 16-03-01 16:03:50
 *
 *  @brief 创建单例
 *
 *  @return 单例对象
 */
+ (SVDataBase *)manager;
/**
 *  @author 吴智极, 16-03-01 16:03:30
 *
 *  @brief 创建数据库
 *
 *  @param name 数据库名称
 *
 *  @return 数据库对象
 */
- (FMDatabase *)getDataBaseWithName:(NSString *)name;
/**
 *  @author 吴智极, 16-03-01 17:03:12
 *
 *  @brief 在指定数据库删除某表
 *
 *  @param db   指定数据库对象
 *  @param name 表名
 */
- (void)dataBase:(FMDatabase *)db deleteTable:(NSString *)name;
/**
 *  @author 吴智极, 16-03-02 15:03:20
 *
 *  @brief 在指定数据库创建表
 *
 *  @param db          指定数据库对象
 *  @param name        表名
 *  @param dic         字段及字段类型
 *  @param primaryKeys 主键
 */
- (void)dataBase:(FMDatabase *)db createTable:(NSString *)name keysAndTypes:(NSDictionary *)dic primaryKeys:(NSArray *)primaryKeys;
/**
 *  @author 吴智极, 16-03-01 16:03:57
 *
 *  @brief 在指定数据库的某个表添加条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param values 字段及对应的值
 */
- (void)dataBase:(FMDatabase *)db insertTable:(NSString *)name keysAndValues:(NSDictionary *)dic;
/**
 *  @author 吴智极, 16-03-01 16:03:06
 *
 *  @brief 在指定数据库的某个表更新条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param dic    字段及对应的值
 */
- (void)dataBase:(FMDatabase *)db updateTable:(NSString *)name keysAndValues:(NSDictionary *)dic;
/**
 *  @author 吴智极, 16-03-01 16:03:52
 *
 *  @brief 在指定数据库的某个表按条件更新条目
 *
 *  @param db        指定数据库对象
 *  @param name      表名
 *  @param dic       字段及对应的值
 *  @param condition 条件
 */
- (void)dataBase:(FMDatabase *)db updateTable:(NSString *)name keysAndValues:(NSDictionary *)dic whereCondition:(NSString *)condition;
/**
 *  @author 吴智极, 16-03-02 17:03:42
 *
 *  @brief 在指定数据库的某个表插入或更新条目
 *
 *  @param db   指定数据库对象
 *  @param name 表名
 *  @param dic  字段及对应的值
 */
- (void)dataBase:(FMDatabase *)db replaceTable:(NSString *)name keysAndValues:(NSDictionary *)dic;
/**
 *  @author 吴智极, 16-03-01 16:03:26
 *
 *  @brief 查询指定数据库某个表的所有条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param dic    字段及对应类型
 *
 *  @return 查询结果数组
 */
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic ;
/**
 *  @author 吴智极, 16-03-01 16:03:28
 *
 *  @brief 查询指定数据库的某个表，符合条件的所有条目
 *
 *  @param db        指定数据库对象
 *  @param name      表名
 *  @param dic       字段及对应类型
 *  @param condition 条件
 *
 *  @return 查询结果数组
 */
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereCondition:(NSString *)condition;
/**
 *  @author 吴智极, 16-03-01 16:03:19
 *
 *  @brief 查询指定数据库的某个表，某字段以某字符串开始的所有条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param dic    字段及对应类型
 *  @param key    查询字段
 *  @param string 字段开始的字符串
 *
 *  @return 查询结果数组
 */
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key beginWithString:(NSString *)string;
/**
 *  @author 吴智极, 16-03-01 17:03:09
 *
 *  @brief 查询指定数据库的某个表，某字段包含某字符串的所有条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param dic    字段及对应类型
 *  @param key    查询字段
 *  @param string 字段包含的字符串
 *
 *  @return 查询结果数组
 */
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key containString:(NSString *)string;
/**
 *  @author 吴智极, 16-03-01 17:03:04
 *
 *  @brief 查询指定数据库的某个表，某字段以某字符串结尾的所有条目
 *
 *  @param db     指定数据库对象
 *  @param name   表名
 *  @param dic    字段及对应类型
 *  @param key    查询字段
 *  @param string 字段结尾的字符串
 *
 *  @return 查询结果数组
 */
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key endWithString:(NSString *)string;
/**
 *  @author 吴智极, 16-03-01 17:03:43
 *
 *  @brief 清空指定数据库的某个表
 *
 *  @param db   指定数据库对象
 *  @param name 表名
 */
- (void)database:(FMDatabase *)db clearTable:(NSString *)name;
@end

//
//  SVDataBase.m
//  all
//
//  Created by 吴智极 on 16/3/1.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import "SVDataBase.h"

@implementation SVDataBase
+ (SVDataBase *)manager {
    static SVDataBase *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (FMDatabase *)getDataBaseWithName:(NSString *)name {
    NSString *dbName = [NSString stringWithFormat:@"%@.sqlite",name];
    NSString *dbPath = [DOCUMENT_PATH stringByAppendingPathComponent:dbName];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"无法获取数据库");
        return nil;
    }
    return db;
}
- (void)dataBase:(FMDatabase *)db deleteTable:(NSString *)name {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSString *sql = [NSString stringWithFormat:@"DROP TABLE %@", name];
    SVLog(sql);
    [db executeUpdate:sql];
}
- (void)dataBase:(FMDatabase *)db createTable:(NSString *)name keysAndTypes:(NSDictionary *)dic primaryKeys:(nonnull NSArray *)primaryKeys {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSMutableString *sql = [NSMutableString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ ()",name];
    for (NSString *key in dic) {
        [sql insertString:[NSString stringWithFormat:@"%@ %@,",key,[dic valueForKey:key]] atIndex:sql.length-1];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-2, 1)];
     
    NSMutableString *primaryKeysString = [NSMutableString string];
    if (primaryKeys.count>0) {
        for (NSString *key in primaryKeys) {
            [primaryKeysString appendFormat:@",%@",key];
        }
        [primaryKeysString deleteCharactersInRange:NSMakeRange(0, 1)];
        [sql insertString:[NSString stringWithFormat:@",PRIMARY KEY(%@)",primaryKeysString] atIndex:sql.length-1];
    }
    SVLog(sql);
    [db executeUpdate:sql];
}
- (void)dataBase:(FMDatabase *)db insertTable:(NSString *)name keysAndValues:(NSDictionary *)dic {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSArray *keys = [dic allKeys];
    NSMutableString *sql = [NSMutableString stringWithFormat:@"INSERT INTO %@ () VALUES ()", name];
    for (NSString *key in keys) {
        [sql insertString:[NSString stringWithFormat:@"%@,",key] atIndex:sql.length-11];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-12, 1)];
    for (int i=0; i<keys.count;i++) {
        [sql insertString:@"?," atIndex:sql.length-1];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-2, 1)];
    SVLog(sql);
    [db executeUpdate:sql withArgumentsInArray:[dic allValues]];
}
- (void)dataBase:(FMDatabase *)db updateTable:(NSString *)name keysAndValues:(NSDictionary *)dic {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSArray *keys = [dic allKeys];
    NSMutableString *sql = [NSMutableString stringWithFormat:@"UPDATE %@ SET ()", name];
    for (NSString *key in keys) {
        [sql insertString:[NSString stringWithFormat:@"%@=%@,", key, [dic valueForKey:key]] atIndex:sql.length-1];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-2, 1)];
    SVLog(sql);
    [db executeUpdate:sql];
}
- (void)dataBase:(FMDatabase *)db updateTable:(NSString *)name keysAndValues:(NSDictionary *)dic whereCondition:(NSString *)condition {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSArray *keys = [dic allKeys];
    NSMutableString *sql = [NSMutableString stringWithFormat:@"UPDATE %@ SET ()", name];
    for (NSString *key in keys) {
        [sql insertString:[NSString stringWithFormat:@"%@=%@,", key, [dic valueForKey:key]] atIndex:sql.length-1];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-2, 1)];
    [db executeUpdate:sql];
    SVLog(sql);
    [sql appendFormat:@" WHERE %@",condition];
}
- (void)dataBase:(FMDatabase *)db replaceTable:(NSString *)name keysAndValues:(NSDictionary *)dic {
    if (![self successOpenDatabase:db]) {
        NSLog(@"无法获取数据库");
        return;
    }
    NSArray *keys = [dic allKeys];
    NSMutableString *sql = [NSMutableString stringWithFormat:@"REPLACE INTO %@ () VALUES ()", name];
    for (NSString *key in keys) {
        [sql insertString:[NSString stringWithFormat:@"%@,",key] atIndex:sql.length-11];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-12, 1)];
    for (int i=0; i<keys.count;i++) {
        [sql insertString:@"?," atIndex:sql.length-1];
    }
    [sql deleteCharactersInRange:NSMakeRange(sql.length-2, 1)];
    SVLog(sql);
    [db executeUpdate:sql withArgumentsInArray:[dic allValues]];
}
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic {
    FMResultSet *res = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@",name]];
    SVLog([res columnNameToIndexMap]);
    NSArray *keys = [[res columnNameToIndexMap] allKeys];
    for (NSString *key in keys) {
        SVLog(key);
        SVLog([res objectForColumnName:key]);
    }
    return [self getArrayWithRes:res keysAndTypes:dic];
}
- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereCondition:(NSString *)condition {
    FMResultSet *res = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@",name, condition]];
    return [self getArrayWithRes:res keysAndTypes:dic];
}
//- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key beginWithString:(NSString *)string {
//    
//}
//- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key containString:(NSString *)string {
//    
//}
//- (NSArray *)dataBase:(FMDatabase *)db selectTable:(NSString *)name keysAndTypes:(NSDictionary *)dic whereKey:(NSString *)key endWithString:(NSString *)string {
//    
//}
- (void)database:(FMDatabase *)db clearTable:(NSString *)name {
    
}
#pragma mark - private methods
- (NSArray *)getArrayWithRes:(FMResultSet *)res keysAndTypes:(NSDictionary *)dic {
    NSMutableArray *tempArr = [NSMutableArray array];
    if (!dic) {
        while ([res next]) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
            dic = [res columnNameToIndexMap];
            for (int i = 0; i < dic.count; i++) {
                NSString *key = [dic allKeys][i];
                [tempDic setValue:[res objectForColumnName:key] forKey:key];
            }
            [tempArr addObject:tempDic];
        }
    } else {
        while ([res next]) {
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
            for (int i = 0; i < dic.count; i++) {
                NSString *key = [dic allKeys][i];
                NSString *value = [dic valueForKey:key];
                SVLog(key);
                SVLog(value);
                if ([[value lowercaseString] isEqualToString:@"text"]) {
                    //  字符串
                    [tempDic setValue:[res stringForColumn:key] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"blob"]) {
                    //  二进制对象
                    [tempDic setValue:[res dataForColumn:key] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"integer"]) {
                    //  带符号整数类型
                    [tempDic setValue:[NSNumber numberWithInt:[res intForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"long"]) {
                    //  带符号长整数类型
                    [tempDic setValue:[NSNumber numberWithLong:[res longForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"longlong"]) {
                    //  带符号长长整数类型
                    [tempDic setValue:[NSNumber numberWithLongLong:[res longLongIntForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"unsignedlonglong"]) {
                    //  无符号长长整数类型
                    [tempDic setValue:[NSNumber numberWithUnsignedLongLong:[res unsignedLongLongIntForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"double"]) {
                    //  双精度浮点数类型
                    [tempDic setValue:[NSNumber numberWithDouble:[res doubleForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"boolean"]) {
                    //  布尔型
                    [tempDic setValue:[NSNumber numberWithBool:[res boolForColumn:key]] forKey:key];
                } else if ([[value lowercaseString] isEqualToString:@"date"]) {
                    //  Date型
                    [tempDic setValue:[res dateForColumn:key] forKey:key];
                }
            }
            [tempArr addObject:tempDic];
        }
    }
    SVLog(tempArr);
    return tempArr;
}
- (BOOL)successOpenDatabase:(FMDatabase *)db{
    return [db open];
}
@end

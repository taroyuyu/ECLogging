//
//  ECTestComparisons.h
//  ECLogging
//
//  Created by Sam Deane on 21/11/2013.
//  Copyright (c) 2014 Sam Deane, Elegant Chaos. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, ECTestComparisonMode)
{
	ECTestComparisonShowChars,
	ECTestComparisonShowLines,
	ECTestComparisonShowLinesIgnoreWhitespace,
	ECTestComparisonDiff,
	ECTestComparisonDiffNoJSON,
	ECTestComparisonDefault
};

typedef void (^ECTestComparisonBlock)(NSString* context, NSUInteger level, id item1, id item2);

@interface NSObject(ECTestComparisons)
- (BOOL)matches:(id)item2 block:(ECTestComparisonBlock)block;
- (BOOL)matches:(id)item2 context:(NSString*)context level:(NSUInteger)level block:(ECTestComparisonBlock)block;
- (NSString*)nameForMatching;
@end

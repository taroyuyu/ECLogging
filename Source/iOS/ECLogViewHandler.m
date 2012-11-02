//
//  ECLogViewHandler.m
//  ECLoggingSample
//
//  Created by Sam Deane on 02/08/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ECLogViewHandler.h"
#import "ECLogViewController.h"
#import "ECLogViewHandlerItem.h"
#import "ECLogManager.h"
#import "ECLogChannel.h"

@implementation ECLogViewHandler

@synthesize items;
@synthesize view;

static ECLogViewHandler* gInstance = nil;

// --------------------------------------------------------------------------
//! Singleton instance.
// --------------------------------------------------------------------------

+ (ECLogViewHandler*)sharedInstance
{
    return gInstance;
}

- (id)init 
{
    if ((self = [super init]) != nil) 
    {
        self.name = @"View";
		if (gInstance)
		{
			NSLog(@"creating more than one ECLogViewHandler is an error");
		}
		else
		{
			gInstance = self;
		}
    }
    
    return self;
}

- (void)dealloc 
{
    [items release];
    [view release];
    
    [super dealloc];
}

// --------------------------------------------------------------------------
//! Log.
// --------------------------------------------------------------------------


- (void) logFromChannel: (ECLogChannel*) channel withFormat: (NSString*) format arguments: (va_list) arguments context:(ECLogContext *)context
{
    NSMutableArray* itemList = self.items;
    if (!itemList)
    {
        itemList = [NSMutableArray array];
        self.items = itemList;
    }
    
    ECLogViewHandlerItem* item = [[ECLogViewHandlerItem alloc] init];
    item.message = [[[NSString alloc] initWithFormat:format arguments:arguments] autorelease];
    
    item.context = [channel stringFromContext:context];
    
    [itemList addObject:item];
    [item release];
    
    if (self.view)
    {
        [self.view.tableView reloadData];
    }
}

@end

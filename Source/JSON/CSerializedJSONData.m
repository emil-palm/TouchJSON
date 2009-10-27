//
//  CSerializedJSONData.m
//  Uploadr
//
//  Created by Jonathan Wight on 10/23/09.
//  Copyright 2009 toxicsoftware.com. All rights reserved.
//

#import "CSerializedJSONData.h"

@implementation CSerializedJSONData

@synthesize data;

- (id)initWithData:(NSData *)inData;
{
if ((self = [self init]) != NULL)
	{
	data = inData;
	}
return(self);
}

- (void)dealloc
{
[data release];
data = NULL;
//
[super dealloc];
}


@end

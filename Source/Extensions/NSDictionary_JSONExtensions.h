//
//  NSDictionary_JSONExtensions.h
//  TouchJSON
//
//  Created by Jonathan Wight on 04/17/08.
//  Copyright 2008 toxicsoftware.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSDictionary (NSDictionary_JSONExtensions)

+ (id)dictionaryWithJSONData:(NSData *)inData error:(NSError **)outError;

@end

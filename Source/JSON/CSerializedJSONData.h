//
//  CSerializedJSONData.h
//  Uploadr
//
//  Created by Jonathan Wight on 10/23/09.
//  Copyright 2009 toxicsoftware.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSerializedJSONData : NSObject {
	NSData *data;
}

@property (readonly, nonatomic, retain) NSData *data;

- (id)initWithData:(NSData *)inData;

@end

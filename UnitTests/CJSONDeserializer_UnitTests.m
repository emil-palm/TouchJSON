//
//  CJSONDeserializer_UnitTests.m
//  TouchJSON
//
//  Created by Luis de la Rosa on 8/6/08.
//  Copyright 2008 TouchCode. All rights reserved.
//

#import "CJSONDeserializer_UnitTests.h"
#import "CJSONDeserializer.h"


@implementation CJSONDeserializer_UnitTests

-(void)testEmptyDictionary {
	NSString *theSource = @"{}";
	NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *theObject = [[CJSONDeserializer deserializer] deserializeAsDictionary:theData error:nil];
	NSDictionary *dictionary = [NSDictionary dictionary];
	STAssertEqualObjects(dictionary, theObject, nil);
}

-(void)testSingleKeyValuePair {
	NSString *theSource = @"{\"a\":\"b\"}";
	NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *theObject = [[CJSONDeserializer deserializer] deserializeAsDictionary:theData error:nil];
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@"b" forKey:@"a"];
	STAssertEqualObjects(dictionary, theObject, nil);
}

-(void)testDeserializeDictionaryWithNonDictionary {
	NSString *emptyArrayInJSON = @"[]";
	NSData *emptyArrayInJSONAsData = [emptyArrayInJSON dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *deserializedDictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:emptyArrayInJSONAsData error:nil];
	STAssertNil(deserializedDictionary, nil);
}

-(void)testDeserializeDictionaryWithAnEmbeddedArray {
	NSString *theSource = @"{\"version\":\"1.0\", \"method\":\"a_method\", \"params\":[ \"a_param\" ]}";
	NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *theObject = [[CJSONDeserializer deserializer] deserializeAsDictionary:theData error:nil];
	NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
								@"1.0", @"version",
								@"a_method", @"method",
								[NSArray arrayWithObject:@"a_param"], @"params",
								nil];
	STAssertEqualObjects(dictionary, theObject, nil);	
}
@end

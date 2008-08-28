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

-(void)testCheckForError {
	NSString *jsonString = @"!";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithEmptyJSON {
	NSString *jsonString = @"";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithEmptyJSONAndIgnoringError {
	NSString *jsonString = @"";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:nil];
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithNilJSON {
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:nil error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithNilJSONAndIgnoringError {
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:nil error:nil];
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testNoError {
	NSString *jsonString = @"{}";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	STAssertNil(error, @"No error should be reported when deserializing an empty dictionary", nil);
	STAssertNotNil(dictionary, @"Dictionary will be nil when there is not an error deserializing", nil);
}

#pragma mark DeprecatedTests
-(void)testCheckForError_Deprecated {
	NSString *jsonString = @"{!";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:jsonData error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithEmptyJSON_Deprecated {
	NSString *jsonString = @"";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:jsonData error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithEmptyJSONAndIgnoringError_Deprecated {
	NSString *jsonString = @"";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:jsonData error:nil];
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithNilJSON_Deprecated {
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:nil error:&error];
	STAssertNotNil(error, @"An error should be reported when deserializing a badly formed JSON string", nil);
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

-(void)testCheckForErrorWithNilJSONAndIgnoringError_Deprecated {
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserialize:nil error:nil];
	STAssertNil(dictionary, @"Dictionary will be nil when there is an error deserializing", nil);
}

@end


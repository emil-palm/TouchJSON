//
//  CJSONSerializer_UnitTests.m
//  TouchCode
//
//  Created by Jonathan Wight on 12/12/2005.
//  Copyright 2005 toxicsoftware.com. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CJSONSerializer_UnitTests.h"

#import "CJSONSerializer.h"

@implementation CJSONSerializer_UnitTests
-(void)testEmptyDictionary {
	NSString *jsonEquivalent = @"{}";
	NSDictionary *emptyDictionary = [NSDictionary dictionary];
	id theObject = [[CJSONSerializer serializer] serializeObject:emptyDictionary];
	STAssertEqualObjects(jsonEquivalent, theObject, nil);
}

-(void)testSingleKeyValuePair {
	NSString *jsonEquivalent = @"{\"a\":\"b\"}";
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@"b" forKey:@"a"];
	id theObject = [[CJSONSerializer serializer] serializeObject:dictionary];
	STAssertEqualObjects(jsonEquivalent, theObject, nil);
}

/* http://code.google.com/p/touchcode/issues/detail?id=52 */
-(void)test_SerializeArrayWithDuplicatedInstances {
    NSString *a = @"a";
    NSArray  *input = [NSArray arrayWithObjects:a, @"b", a, nil];
    NSString *expected = @"[\"a\",\"b\",\"a\"]";
    id output = [[CJSONSerializer serializer] serializeObject:input];
    STAssertEqualObjects(expected, output, nil);
}

- (void)testFalse {
	NSString *jsonEquivalent = @"{\"a\":false}";
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@"a"];
	id theObject = [[CJSONSerializer serializer] serializeObject:dictionary];
	STAssertEqualObjects(jsonEquivalent, theObject, nil);
}

- (void)testDoubleAccuracy {
	NSString *jsonEquivalent = @"{\"a\":1.23456789}";
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithDouble:1.23456789] forKey:@"a"];
	id theObject = [[CJSONSerializer serializer] serializeObject:dictionary];
	STAssertEqualObjects(jsonEquivalent, theObject, nil);
}

@end

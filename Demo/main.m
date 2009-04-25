#import <Foundation/Foundation.h>

#import "CJSONDeserializer.h"

void test(void);

int main(int argc, char **argv)
{
#pragma unused(argc, argv)

NSAutoreleasePool *theAutoreleasePool = [[NSAutoreleasePool alloc] init];

test();

[theAutoreleasePool release];
//
return(0);
}

void test(void)
{
NSString *theSource = NULL;
//
theSource = @"{\"a\": [ { ] }";

NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];

NSError *theError = NULL;
id theObject = [[CJSONDeserializer deserializer] deserialize:theData error:&theError];

NSLog(@"Error: %@", theError);
NSLog(@"Result: %@", theObject);
}

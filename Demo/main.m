#import <Foundation/Foundation.h>

#import "CJSONScanner.h"

int main(int argc, char **argv)
{
NSAutoreleasePool *theAutoreleasePool = [[NSAutoreleasePool alloc] init];
//

NSString *theSource = NULL;
//theSource = @"[{\"a\":\"b\"}]";
//theSource = @"{\"r\":[{\"name\":\"KEXP\",\"desc\":\"90.3 - Where The Music Matters\",\"icon\":\"\\/img\\/channels\\/radio_stream.png\",\"audiostream\":\"http:\\/\\/kexp-mp3-1.cac.washington.edu:8000\\/\",\"type\":\"radio\",\"stream\":\"fb8155000526e0abb5f8d1e02c54cb83094cffae\",\"relay\":\"r2b\"}]}";

//theSource = @"{\"status\": \"ok\", \"operation\": \"new_task\", \"task\": {\"status\": 0, \"updated_at\": {}, \"project_id\": 7179, \"dueDate\": null, \"creator_id\": 1, \"type_id\": 0, \"priority\": 1, \"id\": 37087, \"summary\": \"iPhone test\", \"description\": null, \"creationDate\": {}, \"owner_id\": 1, \"noteCount\": 0, \"commentCount\": 0}}";
//theSource = @"{\"status\": \"ok\", \"operation\": \"new_task\", \"task\": {\"status\": 0, \"project_id\": 7179, \"dueDate\": null, \"creator_id\": 1, \"type_id\": 0, \"priority\": 1, \"id\": 37087, \"summary\": \"iPhone test\", \"description\": null, \"owner_id\": 1, \"noteCount\": 0, \"commentCount\": 0}}";

theSource = @"{ }";

NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];
//NSData *theData = [NSData dataWithContentsOfFile:@"/Users/schwa/Desktop/d.json"];

CJSONScanner *theScanner = [CJSONScanner scannerWithData:theData];

id theObject = NULL;
NSError *theError = NULL;
BOOL theResult = [theScanner scanJSONObject:&theObject error:&theError];

NSLog(@"Result: %d, %@, %@", [theObject count], theError, theObject);


//
[theAutoreleasePool release];
//
return(0);
}
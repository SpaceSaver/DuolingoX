#import <Foundation/Foundation.h>


void changeUserAgent(NSMutableURLRequest *request) {
	[request setValue:@"DuolingoMobile/6.157.0 (iPad; iOS 12.5.7; Scale/2.00)" forHTTPHeaderField:@"User-Agent"];
}

%hook NSMutableURLRequest

+ (instancetype)requestWithURL:(NSURL *)URL {
	// NSLog(@"DuolingoX: Inside requestWithURL");
    NSMutableURLRequest *request = %orig(URL);
    changeUserAgent(request);
    return request;
}

+ (instancetype)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval {
	// NSLog(@"DuolingoX: Inside requestWithURL with the additional args");
    NSMutableURLRequest *request = %orig(URL, cachePolicy, timeoutInterval);
    changeUserAgent(request);
    return request;
}

- (instancetype)initWithURL:(NSURL *)URL {
	// NSLog(@"DuolingoX: Inside initWithURL");
	NSMutableURLRequest *request = %orig(URL);
    changeUserAgent(request);
    return request;
}

- (instancetype)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval {
	// NSLog(@"DuolingoX: Inside initWithURL with the additional args");
	NSMutableURLRequest *request = %orig(URL, cachePolicy, timeoutInterval);
    changeUserAgent(request);
    return request;
}

- (void)addValue:(NSString *)value forHTTPHeaderField:(NSString *)field{
	if ([[field lowercaseString] isEqualToString:@"user-agent"]) {
		// NSLog(@"DuolingoX: We got 'em boys!");
	} else {
		%orig(value, field);
	}
}

%end
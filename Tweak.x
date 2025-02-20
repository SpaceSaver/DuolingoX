#import <Foundation/Foundation.h>


void addCustomHeaderToRequest(NSMutableURLRequest *request) {
	[request setValue:@"DuolingoMobile/6.157.0 (iPad; iOS 12.5.7; Scale/2.00)" forHTTPHeaderField:@"User-Agent"];
}

%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString {
	NSLog(@"DuolingoX: %@", URLString);
	return %orig(URLString);
}

%end

%hook NSMutableURLRequest

+ (instancetype)requestWithURL:(NSURL *)URL {
    NSMutableURLRequest *request = %orig(URL);
    addCustomHeaderToRequest(request);
    return request;
}

+ (instancetype)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval {
    NSMutableURLRequest *request = %orig(URL, cachePolicy, timeoutInterval);
    addCustomHeaderToRequest(request);
    return request;
}

%end
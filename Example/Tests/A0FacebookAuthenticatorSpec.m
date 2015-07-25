// A0FacebookAuthenticatorSpec.m
//
// Copyright (c) 2015 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "Specta.h"
#import "A0FacebookAuthenticator.h"

@interface A0FacebookAuthenticator (Testing)
@property (readonly, nonatomic) NSArray *permissions;
@end

SpecBegin(A0FacebookAuthenticator)

describe(@"A0FacebookAuthenticator", ^{

    describe(@"initialization", ^{

        sharedExamples(@"has permissions", ^(NSDictionary *data) {
            A0FacebookAuthenticator *authenticator = data[@"facebook"];

            it(@"should have a default permission with default initializer", ^{
                expect(authenticator.permissions).to.beSupersetOf(data[@"permissions"]);
            });
        });

        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [[A0FacebookAuthenticator alloc] init],
                                                 @"permissions": @[@"public_profile"],
                                                 });
        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [A0FacebookAuthenticator newAuthenticatorWithDefaultPermissions],
                                                 @"permissions": @[@"public_profile"],
                                                 });

        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [A0FacebookAuthenticator newAuthenticatorWithPermissions:@[@"public_profile", @"email"]],
                                                 @"permissions": @[@"public_profile", @"email"],
                                                 });
        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [A0FacebookAuthenticator newAuthenticatorWithPermissions:@[@"email"]],
                                                 @"permissions": @[@"public_profile", @"email"],
                                                 });

        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [A0FacebookAuthenticator newAuthenticatorWithPermissions:nil],
                                                 @"permissions": @[@"public_profile"],
                                                 });

        itShouldBehaveLike(@"has permissions", @{
                                                 @"facebook": [A0FacebookAuthenticator newAuthenticatorWithPermissions:@[]],
                                                 @"permissions": @[@"public_profile"],
                                                 });
    });
});

SpecEnd

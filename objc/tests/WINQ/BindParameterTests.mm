/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WINQTestCase.h"
#import <WCDB/WCDB.h>

@interface BindParameterTests : WINQTestCase

@end

@implementation BindParameterTests {
    NSString* name;
}

- (void)setUp
{
    [super setUp];
    name = @"testName";
}

- (void)test_default_constructible
{
    WCDB::BindParameter constructible;
}

- (void)test_number
{
    auto testingSQL = WCDB::BindParameter(1);
    auto testingTypes = { WCDB::SQL::Type::BindParameter };
    IterateAssertEqual(testingSQL, testingTypes);
    WINQAssertEqual(testingSQL, @"?1");
}

- (void)test_name
{
    auto testingSQL = WCDB::BindParameter(name);
    auto testingTypes = { WCDB::SQL::Type::BindParameter };
    IterateAssertEqual(testingSQL, testingTypes);
    WINQAssertEqual(testingSQL, @"?testName");
}

- (void)test_colon
{
    auto testingSQL = WCDB::BindParameter::colon(name);
    auto testingTypes = { WCDB::SQL::Type::BindParameter };
    IterateAssertEqual(testingSQL, testingTypes);
    WINQAssertEqual(testingSQL, @":testName");
}

- (void)test_at
{
    auto testingSQL = WCDB::BindParameter::at(name);
    auto testingTypes = { WCDB::SQL::Type::BindParameter };
    IterateAssertEqual(testingSQL, testingTypes);
    WINQAssertEqual(testingSQL, @"@testName");
}

- (void)test_dollar
{
    auto testingSQL = WCDB::BindParameter::dollar(name);
    auto testingTypes = { WCDB::SQL::Type::BindParameter };
    IterateAssertEqual(testingSQL, testingTypes);
    WINQAssertEqual(testingSQL, @"$testName");
}

- (void)test_numbers
{
    auto bindParameters = WCDB::BindParameter::bindParameters(2);
    XCTAssertEqual(bindParameters.size(), 2);
    WINQAssertEqual(bindParameters[0], @"?1");
    WINQAssertEqual(bindParameters[1], @"?2");
}

@end

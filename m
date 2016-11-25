Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/5] tests: Test suspend/resume on idle pipelines
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org>
 <1480082356-23380-5-git-send-email-kbingham@kernel.org>
 <3575572.HLfbuMh0c7@avalon>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1eb1ab09-0844-e261-bc4a-a2bfa020f9aa@ideasonboard.com>
Date: Fri, 25 Nov 2016 18:14:53 +0000
MIME-Version: 1.0
In-Reply-To: <3575572.HLfbuMh0c7@avalon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>



On 25/11/16 17:13, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Friday 25 Nov 2016 13:59:15 Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Provide a test to verify the hardware is functional both before and
>> after entering a suspend / resume cycle. Make use of the
>> /sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
>> the testing
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  tests/vsp-unit-test-0019.sh | 77 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100755 tests/vsp-unit-test-0019.sh
>>
>> diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
>> new file mode 100755
>> index 000000000000..e7b94996c1aa
>> --- /dev/null
>> +++ b/tests/vsp-unit-test-0019.sh
>> @@ -0,0 +1,77 @@
>> +#!/bin/sh
>> +
>> +#
>> +# Test power-management suspend/resume whilst pipelines are idle
>> +#
>> +# Utilise the basic RPF->WPF packing test case as a measure that the
>> hardware
>> +# is operable while we perform test suspend and resume, and verify that it
>> is
>> +# still operable after resume.
>> +#
>> +# Format iteration loops are maintained, even with only one format so that
>> this
>> +# test can be easily extended to try further formats if needed in the
>> future.
>> +#
> 
> I don't think testing multiple formats is needed, but I would like the 
> test_wpf_packing() function to be called twice, to verify that stop -> start 
> works fine after resume. You could specify two formats to achieve that (with a 
> comment explaining why at least two formats should be specified).
> 

That sounds like a good plan.

>> +source vsp-lib.sh
>> +
>> +features="rpf.0 wpf.0"
>> +formats="RGB24"
>> +
>> +# These can be extracted from /sys/power/pm_test
>> +suspend_modes="freezer devices platform processors core"
>> +
>> +test_wpf_packing() {
>> +	test_start "Verify WPF packing in $format before/after suspend:$mode"
>> +
>> +	pipe_configure rpf-wpf 0 0
>> +	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
>> +
>> +	vsp_runner rpf.0 &
>> +	vsp_runner wpf.0
>> +
>> +	local result=$(compare_frames)
>> +
>> +	test_complete $result
>> +}
>> +
>> +test_hw_pipe() {
>> +	local format
>> +
>> +	for format in $formats ; do
>> +		test_wpf_packing $format
>> +	done
>> +}
>> +
>> +test_suspend_resume() {
>> +	local test_results=0
> 
> This variable is unused.

Bah, I missed some. I thought I'd cleaned these out before posting. :D

>> +
>> +	# Test the hardware each side of suspend resume
>> +	test_hw_pipe
>> +
>> +	# Set the test mode
>> +	echo $mode > /sys/power/pm_test
>> +
>> +	# Comence suspend
>> +	# The pm_test framework will automatically resume after 5 seconds
>> +	echo mem > /sys/power/state
>> +
>> +	# Verify the hardware is still operational
>> +	test_hw_pipe
> 
> Given that the goal is to test proper operation after resume, it would be 
> better to call test_start and test_complete in this function, based on whether 
> all the tests passed or not.

Yes, I did go down this route - but stalled. Mainly in getting sensible
return values from the $(compare_frames) which can be tracked through
the functions.

I think it looked like I'd have to string match against, pass, skip,
fail etc ... without a nice easy return value I can add to an integer.

This can be re-examined.

>> +}
>> +
>> +test_main() {
>> +	local mode;
> 
> No need for the trailing ;.

I think my hands are preprogrammed in 'c' coding style. Tough to get out
of sometimes :D

>> +
>> +	# Check for pm-suspend test option
>> +	if [ ! -e /sys/power/pm_test ] ; then
>> +		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
>> +		test_complete skip
>> +		return
>> +	fi;
> 
> Ditto.

Ack.

> 
>> +
>> +	for mode in $suspend_modes ; do
>> +		test_suspend_resume $mode
>> +	done;
> 
> Ditto.
> 

Ack.


>> +}
>> +
>> +test_init $0 "$features"
>> +test_run
> 

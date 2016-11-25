Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kbingham@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] tests: Test suspend/resume on active pipelines
Date: Fri, 25 Nov 2016 21:03:25 +0200
Message-ID: <12888094.h3XCYo3gSp@avalon>
In-Reply-To: <e1fd04aa-c5bf-a263-a230-07b9dba5209c@ideasonboard.com>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org> <35257982.kzliQtJx6v@avalon> <e1fd04aa-c5bf-a263-a230-07b9dba5209c@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Friday 25 Nov 2016 18:40:34 Kieran Bingham wrote:
> On 25/11/16 17:10, Laurent Pinchart wrote:
> > On Friday 25 Nov 2016 13:59:16 Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> 
> >> Provide a test to verify the hardware completes a functional test whilst
> >> performing a suspend resume cycle in parallel. Make use of the
> >> /sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
> >> the testing
> >> 
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> ---
> >> 
> >>  tests/vsp-unit-test-0020.sh | 86 +++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 86 insertions(+)
> >>  create mode 100755 tests/vsp-unit-test-0020.sh
> >> 
> >> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> >> new file mode 100755
> >> index 000000000000..5838295139b2
> >> --- /dev/null
> >> +++ b/tests/vsp-unit-test-0020.sh
> >> @@ -0,0 +1,86 @@
> >> +#!/bin/sh
> >> +
> >> +#
> >> +# Test power-management suspend/resume whilst pipelines are active
> >> +#
> >> +# Utilise the basic RPF->WPF packing test case as a measure that the
> >> hardware
> >> +# is operable while we perform test suspend and resume, and verify that
> >> it is
> >> +# still successful even with a suspend resume cycle in the middle of the
> >> test.
> >> +#
> >> +# Format iteration loops are maintained, even with only one format so
> >> that this
> >> +# test can be easily extended to try further formats if needed in the
> >> future.
> >> +#
> > 
> > Given that this test will suspend during the first iteration only I don't
> > think it's very useful to keep the loop.
> 
> Agreed. Can you tell this test started it's life as
> vsp-unit-test-0019.sh ? :D
> 
> >> +
> >> +source vsp-lib.sh
> >> +
> >> +features="rpf.0 wpf.0"
> >> +formats="RGB24"
> >> +
> >> +# These can be extracted from /sys/power/pm_test
> >> +suspend_modes="freezer devices platform processors core"
> > 
> > How about extracting them from that file then ? :-) Or maybe just
> > verifying they are available before trying to use them ?
> 
> I thought about that - and looked at it.
> 
> Annoyingly - /sys/power/pm_test contains none which would need to be
> filtered out, and also the active mode is surrounded by square brackets,
> which would also need filtering.
> 
> # cat /sys/power/pm_test
> none core processors platform [devices] freezer
> 
> They are also in the reverse order of that which I wanted the tests to run.
> 
> All solvable, but I hadn't bothered as I thought it was possibly
> overkill. Of course extracting automatically does future proof us
> against different modes and changing mode-names - so it does sound like
> a valuable thing to do.

You're right that it might be overkill, it's up to you. If you want to keep 
the list of modes here to select the order, you could do a 

grep -q $mode /sys/power/pm_test || continue

(or something similar possibly with a message being printed to inform that the 
test is skipped)

Even that might be overkill though.

> >> +# This extended function performs the same
> >> +# as it's non-extended name-sake - but runs the pipeline
> >> +# for 300 frames. The suspend action occurs between frame #150~#200
> >> +test_extended_wpf_packing() {
> >> +	test_start "Verify WPF packing in $format during suspend:$mode"
> >> +
> >> +	pipe_configure rpf-wpf 0 0
> >> +	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> >> +
> >> +	vsp_runner rpf.0 --count=300 &
> >> +	vsp_runner wpf.0 --count=300 --skip=297
> >> +
> >> +	local result=$(compare_frames)
> >> +
> >> +	test_complete $result
> >> +}
> >> +
> >> +test_hw_pipe() {
> >> +	local format
> >> +
> >> +	for format in $formats ; do
> >> +		test_extended_wpf_packing $format
> >> +	done
> >> +}
> >> +
> >> +test_suspend_resume() {
> >> +	local test_results=0
> > 
> > This variable doesn't seem to be used.
> 
> Another left over from when I was experimenting to get the return values
> before I was blocked by $(compare_frames) returning a string.
> 
> >> +	local test_pid
> >> +
> >> +	# Test the hardware each side of suspend resume
> >> +	test_hw_pipe &
> >> +	test_pid=$!
> >> +
> >> +	# Make sure the pipeline has time to start
> >> +	sleep 1
> >> +
> >> +	# Set the test mode
> >> +	echo $mode > /sys/power/pm_test
> >> +
> >> +	# Comence suspend
> > 
> > Commence ?
> 
> Yes
> Where can I get a terminal emulator with spell-check highlighting :D
> 
> >> +	# The pm_test framework will automatically resume after 5 seconds
> >> +	echo mem > /sys/power/state
> >> +
> >> +	# Wait for the pipeline to complete
> >> +	wait $test_pid
> > 
> > It would be nice to add a timeout here. Maybe something like the following
> > (untested) ?
> > 
> > 	(sleep 30 ; kill $test_pid) &
> > 	kill_pid=$!
> > 	wait $test_pid
> > 	kill $kill_pid
> > 
> > test_complete should be called here based on both whether the frames
> > compared successfully and whether the test timed out.
> 
> I agree that the test should have a timeout, and result determined, but
> scripting this in shell ... feels ugh :S
> 
> Its a shame we don't have gnu-timeout
>  - http://man7.org/linux/man-pages/man1/timeout.1.html(man 1 timeout)

Would the busybox version of timeout work ? If so we could make that a 
requirement.

> >> +}
> >> +
> >> +test_main() {
> >> +	local mode;
> > 
> > No need for the trailing ;.
> 
> Ack.
> 
> >> +	local suspend_test_failures
> > 
> > This variable doesn't seem to be used.
> 
> Hrm .. maybe I forgot to do a fresh git-format-patch after I fixed these
> up :D
> 
> >> +
> >> +	# Check for pm-suspend test option
> >> +	if [ ! -e /sys/power/pm_test ] ; then
> >> +		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
> >> +		test_complete skip
> >> +		return
> >> +	fi;
> >> +
> >> +	for mode in $suspend_modes ; do
> >> +		test_suspend_resume $mode
> >> +	done;
> >> +}
> >> +
> >> +test_init $0 "$features"
> >> +test_run

-- 
Regards,

Laurent Pinchart

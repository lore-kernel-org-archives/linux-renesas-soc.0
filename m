Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCHv2 5/5] tests: Test suspend/resume on active pipelines
Date: Mon, 13 Feb 2017 16:38:03 +0200
Message-ID: <1527749.7T5MCaUHYd@avalon>
In-Reply-To: <1480627909-19207-6-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <1480627909-19207-6-git-send-email-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday 01 Dec 2016 21:31:49 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Provide a test to verify the hardware completes a functional test whilst
> performing a suspend resume cycle in parallel. Make use of the
> /sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
> the testing
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> ---
> v2:
> 
> - removed format iteration loop
> - modified test reporting to be once per 'suspend mode'
> - verify the pm_test mode is available, or skip
> 
>  tests/vsp-unit-test-0020.sh | 97 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0020.sh
> 
> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> new file mode 100755
> index 000000000000..c9e6b79e5d06
> --- /dev/null
> +++ b/tests/vsp-unit-test-0020.sh
> @@ -0,0 +1,97 @@
> +#!/bin/sh
> +
> +#
> +# Test power-management suspend/resume whilst pipelines are active
> +#
> +# Utilise the basic RPF->WPF packing test case as a measure that the
> hardware +# is operable while we perform test suspend and resume, and
> verify that it is +# still successful even with a suspend resume cycle in
> the middle of the test. +#
> +
> +source vsp-lib.sh
> +
> +features="rpf.0 wpf.0"
> +
> +# These can be extracted from /sys/power/pm_test
> +suspend_modes="freezer devices platform processors core"
> +
> +# This extended function performs the same
> +# as it's non-extended name-sake - but runs the pipeline
> +# for 300 frames. The suspend action occurs between frame #150~#200
> +
> +test_extended_wpf_packing() {
> +	pipe_configure rpf-wpf 0 0
> +	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> +
> +	vsp_runner rpf.0 --count=300 &
> +	vsp_runner wpf.0 --count=300 --skip=297
> +
> +	local result=$(compare_frames)
> +
> +	test_complete $result

This will result in test_complete being called twice. You probably want

        [ x$result == xpass ] && return 0 || return 1

as in patch 4/5.

> +}
> +
> +test_hw_pipe() {
> +	local format
> +
> +	for format in $formats ; do

The formats variable isn't defined, I think you can just get rid of the loop 
and call test_extended_wpf_packing just once.

> +		test_extended_wpf_packing RGB24
> +	done
> +}
> +
> +test_suspend_resume() {
> +	local result
> +	local test_pid
> +
> +	test_start "Testing active pipeline suspend/resume in suspend:$mode"
> +
> +	# Verify the test is available
> +	grep -q $mode /sys/power/pm_test
> +	if [ $? != 0 ]; then
> +		test_complete skip
> +		return
> +	fi
> +
> +	# Set the hardware running in parallel while we suspend
> +	test_hw_pipe &
> +	test_pid=$!
> +
> +	# Make sure the pipeline has time to start
> +	sleep 1
> +
> +	# Set the test mode
> +	echo $mode > /sys/power/pm_test
> +
> +	# Comence suspend

s/Comence/Commence/

> +	# The pm_test framework will automatically resume after 5 seconds
> +	echo mem > /sys/power/state
> +
> +	# Wait for the pipeline to complete
> +	wait $test_pid
> +	result=$?
> +
> +	if [ $result == 0 ]; then
> +		test_complete pass
> +	else
> +		test_complete fail
> +	fi
> +}
> +
> +test_main() {
> +	local mode;

No need for the trailing ;

> +	local suspend_test_failures

This variablee is unused.

> +
> +	# Check for pm-suspend test option
> +	if [ ! -e /sys/power/pm_test ] ; then
> +		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
> +		test_complete skip

You haven't called test_start so you shouldn't call test_complete.

Some of those comments apply to patch 4/5 too.

There's no need to resubmit, I'll fix this while applying.

> +		return
> +	fi;
> +
> +	for mode in $suspend_modes ; do
> +		test_suspend_resume $mode
> +	done;
> +}
> +
> +test_init $0 "$features"
> +test_run

-- 
Regards,

Laurent Pinchart

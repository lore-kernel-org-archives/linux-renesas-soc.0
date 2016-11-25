Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/5] tests: Test suspend/resume on idle pipelines
Date: Fri, 25 Nov 2016 19:13:17 +0200
Message-ID: <3575572.HLfbuMh0c7@avalon>
In-Reply-To: <1480082356-23380-5-git-send-email-kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org> <1480082356-23380-5-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Friday 25 Nov 2016 13:59:15 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Provide a test to verify the hardware is functional both before and
> after entering a suspend / resume cycle. Make use of the
> /sys/power/pm_test functionality provided by CONFIG_PM_DEBUG to perform
> the testing
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0019.sh | 77 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0019.sh
> 
> diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
> new file mode 100755
> index 000000000000..e7b94996c1aa
> --- /dev/null
> +++ b/tests/vsp-unit-test-0019.sh
> @@ -0,0 +1,77 @@
> +#!/bin/sh
> +
> +#
> +# Test power-management suspend/resume whilst pipelines are idle
> +#
> +# Utilise the basic RPF->WPF packing test case as a measure that the
> hardware
> +# is operable while we perform test suspend and resume, and verify that it
> is
> +# still operable after resume.
> +#
> +# Format iteration loops are maintained, even with only one format so that
> this
> +# test can be easily extended to try further formats if needed in the
> future.
> +#

I don't think testing multiple formats is needed, but I would like the 
test_wpf_packing() function to be called twice, to verify that stop -> start 
works fine after resume. You could specify two formats to achieve that (with a 
comment explaining why at least two formats should be specified).

> +source vsp-lib.sh
> +
> +features="rpf.0 wpf.0"
> +formats="RGB24"
> +
> +# These can be extracted from /sys/power/pm_test
> +suspend_modes="freezer devices platform processors core"
> +
> +test_wpf_packing() {
> +	test_start "Verify WPF packing in $format before/after suspend:$mode"
> +
> +	pipe_configure rpf-wpf 0 0
> +	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> +
> +	vsp_runner rpf.0 &
> +	vsp_runner wpf.0
> +
> +	local result=$(compare_frames)
> +
> +	test_complete $result
> +}
> +
> +test_hw_pipe() {
> +	local format
> +
> +	for format in $formats ; do
> +		test_wpf_packing $format
> +	done
> +}
> +
> +test_suspend_resume() {
> +	local test_results=0

This variable is unused.

> +
> +	# Test the hardware each side of suspend resume
> +	test_hw_pipe
> +
> +	# Set the test mode
> +	echo $mode > /sys/power/pm_test
> +
> +	# Comence suspend
> +	# The pm_test framework will automatically resume after 5 seconds
> +	echo mem > /sys/power/state
> +
> +	# Verify the hardware is still operational
> +	test_hw_pipe

Given that the goal is to test proper operation after resume, it would be 
better to call test_start and test_complete in this function, based on whether 
all the tests passed or not.

> +}
> +
> +test_main() {
> +	local mode;

No need for the trailing ;.

> +
> +	# Check for pm-suspend test option
> +	if [ ! -e /sys/power/pm_test ] ; then
> +		echo "$0: Suspend Resume testing requires CONFIG_PM_DEBUG"
> +		test_complete skip
> +		return
> +	fi;

Ditto.

> +
> +	for mode in $suspend_modes ; do
> +		test_suspend_resume $mode
> +	done;

Ditto.

> +}
> +
> +test_init $0 "$features"
> +test_run

-- 
Regards,

Laurent Pinchart

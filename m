Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] tests: Add basic stress testing
Date: Mon, 13 Feb 2017 01:40:18 +0200
Message-ID: <1849734.xSDTJQtRYk@avalon>
In-Reply-To: <82610485.A1jWxPdiEH@avalon>
References: <1486824186-26450-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <1486824186-26450-2-git-send-email-kieran.bingham+renesas@ideasonboard.com> <82610485.A1jWxPdiEH@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

On Monday 13 Feb 2017 01:25:29 Laurent Pinchart wrote:
> On Saturday 11 Feb 2017 14:43:05 Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > Duplicate the functionality of vsp-unit-test-0001, to provide a set of
> > work for the hardware to run, whilst we load the system using the
> > 'stress' utility.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> > 
> >  tests/vsp-unit-test-0022.sh | 55 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100755 tests/vsp-unit-test-0022.sh
> > 
> > diff --git a/tests/vsp-unit-test-0022.sh b/tests/vsp-unit-test-0022.sh
> > new file mode 100755
> > index 000000000000..10230dffcc42
> > --- /dev/null
> > +++ b/tests/vsp-unit-test-0022.sh
> > @@ -0,0 +1,55 @@
> > +#!/bin/sh
> > +
> > +#
> > +# Test active pipeline, with high load on CPU/Memory/IO using 'stress'
> > +#
> > +# Test WPF packing in RGB mode. Use a RPF -> WPF pipeline with a fixed
> > ARGB32
> > +# format on the input and capture output frames in all RGB formats
> > supported
> > +# by the WPF.
> > +#
> > +
> > +source vsp-lib.sh
> > +
> > +features="rpf.0 wpf.0"
> > +formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32
> > XRGB32"
> > +
> > +test_wpf_packing() {
> > +	test_start "WPF packing in $format during stress testing"
> > +
> > +	pipe_configure rpf-wpf 0 0
> > +	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> > +
> > +	vsp_runner rpf.0 &
> > +	vsp_runner wpf.0
> > +
> > +	local result=$(compare_frames)
> > +
> > +	test_complete $result
> > +}
> > +
> > +exists() { type -t "$1" > /dev/null 2>&1; }
> 
> Let's keep formatting consistent and not inline functions on a single line.
> Same comment for patch 2/2.
> 
> > +test_main() {
> > +	local format
> > +
> > +	if exists stress ; then
> > +		STRESS=`which stress`
> 
> I don't think this is needed, you can just execute stress below, it will be
> found from the $PATH. Same comment for patch 2/2.
> 
> No need to resend, I'll fix this while applying.
> 
> > +	else
> > +		echo "$0: Stress test requires utility 'stress'"
> > +		test_complete skip

Additionally, as you haven't called test_start() yet, you shouldn't called 
test_complete().

> > +		return
> > +	fi
> > +
> > +	# Start stressing the system, as a background task
> > +	$STRESS --cpu 8 --io 4 --vm 2 --vm-bytes 128M &
> > +
> > +	for format in $formats ; do
> > +		test_wpf_packing $format
> > +	done
> > +
> > +	# Recover the system. Stress launches multiple PIDs, so it's best to:
> > +	killall -9 stress
> > +}
> > +
> > +test_init $0 "$features"
> > +test_run

-- 
Regards,

Laurent Pinchart

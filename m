Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbeEUIvC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:51:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed frames
Date: Mon, 21 May 2018 11:51:26 +0300
Message-ID: <8256862.BA8i1yAIzy@avalon>
In-Reply-To: <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com> <20180519203426.25711-3-laurent.pinchart@ideasonboard.com> <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Monday, 21 May 2018 11:16:05 EEST Kieran Bingham wrote:
> Hi Laurent,
> 
> Thank you for the patch,
> 
> On 19/05/18 21:34, Laurent Pinchart wrote:
> > The suspend/resume test starts a run of 300 frames and suspends the
> > system one second later. On some SoCs (namely H3 ES2.0) the VSP
> > bandwidth is high enough to complete processing of 300 frames in less
> > than a second. The test thus suspends and resumes the system with the
> > VSP idle instead of running, defeating the purpose of the test.
> > 
> > Fix this by increasing the number of frames to process to 1000. The
> > frame count is now passed as an argument to the
> > test_extended_wpf_packing function to ease future changes.
> 
> Great idea, to make it easy to update and re-use.
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> > 
> >  tests/vsp-unit-test-0020.sh | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> > index 91f6b167f22e..950c1bebbf2f 100755
> > --- a/tests/vsp-unit-test-0020.sh
> > +++ b/tests/vsp-unit-test-0020.sh
> > @@ -15,25 +15,26 @@ features="rpf.0 wpf.0"
> > 
> >  # These can be extracted from /sys/power/pm_test
> >  suspend_modes="freezer devices platform processors core"
> > 
> > -# This extended function performs the same
> > -# as it's non-extended name-sake - but runs the pipeline
> > -# for 300 frames. The suspend action occurs between frame #150~#200
> > -
> > +# This extended function performs the same as it's non-extended
> > name-sake, but
> > +# runs the pipeline for a configurable number of frames.
> > 
> >  test_extended_wpf_packing() {
> >  	local format=$1
> > +	local num_frames=$2
> > 
> >  	pipe_configure rpf-wpf 0 0
> >  	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> > 
> > -	vsp_runner rpf.0 --count=300 &
> > -	vsp_runner wpf.0 --count=300 --skip=297
> > +	vsp_runner rpf.0 --count=$num_frames &
> > +	vsp_runner wpf.0 --count=$num_frames --skip=$((num_frames-1))
> 
> The original test compared up to 3 frames... But I guess as long as one
> frame matches we're good on this test. We just need to know the pipeline
> was still running... and 3 frames doesn't provide much more information
> than one.

That's an oversight. num_frames-3 is what I meant. 

> >  	local result=$(compare_frames)
> >  	[ x$result == xpass ] && return 0 || return 1
> >  
> >  }
> >  
> >  test_hw_pipe() {
> > 
> > -	test_extended_wpf_packing RGB24
> > +	# Run the pipeline for 1000 frames. The suspend action occurs between
> > +	# frame #500~#600
> 
> I'm not sure it's worth stating when the suspend action occurs, as it's
> variable depending upon the performance of the SoC ... but I'll not object
> to this.

I agree with you, I'll remove that.

I think it would make sense to run the pipeline without a limit in the frame 
count, and stop streaming after resume. Feel free to give it a try if you want 
:-)

> > +	test_extended_wpf_packing RGB24 1000
> >  }
> >  
> >  test_suspend_resume() {

-- 
Regards,

Laurent Pinchart

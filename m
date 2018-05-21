Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46094 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752713AbeEUJIj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 05:08:39 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed frames
Date: Mon, 21 May 2018 12:09:02 +0300
Message-ID: <4976984.1bKa5JtaEO@avalon>
In-Reply-To: <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com> <8256862.BA8i1yAIzy@avalon> <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Monday, 21 May 2018 11:58:44 EEST Kieran Bingham wrote:
> On 21/05/18 09:51, Laurent Pinchart wrote:
> > On Monday, 21 May 2018 11:16:05 EEST Kieran Bingham wrote:
> >> On 19/05/18 21:34, Laurent Pinchart wrote:
> >>> The suspend/resume test starts a run of 300 frames and suspends the
> >>> system one second later. On some SoCs (namely H3 ES2.0) the VSP
> >>> bandwidth is high enough to complete processing of 300 frames in less
> >>> than a second. The test thus suspends and resumes the system with the
> >>> VSP idle instead of running, defeating the purpose of the test.
> >>> 
> >>> Fix this by increasing the number of frames to process to 1000. The
> >>> frame count is now passed as an argument to the
> >>> test_extended_wpf_packing function to ease future changes.
> >> 
> >> Great idea, to make it easy to update and re-use.
> >> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> 
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> 
> >>> ---
> >>> 
> >>>  tests/vsp-unit-test-0020.sh | 15 ++++++++-------
> >>>  1 file changed, 8 insertions(+), 7 deletions(-)
> >>> 
> >>> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> >>> index 91f6b167f22e..950c1bebbf2f 100755
> >>> --- a/tests/vsp-unit-test-0020.sh
> >>> +++ b/tests/vsp-unit-test-0020.sh

[snip]

> >>>  test_hw_pipe() {
> >>> -	test_extended_wpf_packing RGB24
> >>> +	# Run the pipeline for 1000 frames. The suspend action occurs
> >>> between
> >>> +	# frame #500~#600
> >> 
> >> I'm not sure it's worth stating when the suspend action occurs, as it's
> >> variable depending upon the performance of the SoC ... but I'll not
> >> object to this.
> > 
> > I agree with you, I'll remove that.
> > 
> > I think it would make sense to run the pipeline without a limit in the
> > frame count, and stop streaming after resume. Feel free to give it a try
> > if you want :-)
> 
> The question here will be how to we get the frame verification to occur on
> the 'last N frames'
> 
> For this, wouldn't we need to extend yavta to support some kind of signal to
> perform a stream validation at an earlier point and shutdown the stream
> (probably leaving the count/skip, as maximum durations to run...) And then
> making sure we knew which frames were actually written out ...
> 
> I'll leave this ticking in the back of my mind for now :D

Maybe it will be easier to address when we'll rewrite the tests in Python ? 
:-)

> >>> +	test_extended_wpf_packing RGB24 1000
> >>>  }

-- 
Regards,

Laurent Pinchart

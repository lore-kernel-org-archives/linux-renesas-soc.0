Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37986 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbeCUIvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 04:51:13 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH igt 2/8] tests/kms_panel_fitting: check for i915 before checking version
Date: Wed, 21 Mar 2018 10:52:19 +0200
Message-ID: <5833508.5Jkp4rVBdS@avalon>
In-Reply-To: <20180321083433.GB14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <4326028.gVfV6JXNhJ@avalon> <20180321083433.GB14155@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Wednesday, 21 March 2018 10:34:33 EET Daniel Vetter wrote:
> On Tue, Mar 20, 2018 at 01:24:09PM +0200, Laurent Pinchart wrote:
> > Hi Ulrich,
> > 
> > Thank you for the patch.
> > 
> > On Thursday, 15 March 2018 16:45:38 EET Ulrich Hecht wrote:
> > > Fixes false negatives on non-i915 platforms.
> > > 
> > > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > > ---
> > > 
> > >  tests/kms_panel_fitting.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> > > index b3cee22..6d0be50 100644
> > > --- a/tests/kms_panel_fitting.c
> > > +++ b/tests/kms_panel_fitting.c
> > > @@ -243,6 +243,7 @@ static void test_atomic_fastset(igt_display_t
> > > *display)
> > > 
> > >  		igt_set_module_param_int("fastboot", 1);
> > >  	
> > >  	igt_require(display->is_atomic);
> > > 
> > > +	igt_require(is_i915_device(display->drm_fd));
> > > 
> > >  	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
> > 
> > I'm fine with this patch as a quick fix, but what in this test is Intel-
> > specific ? Can't we replace the Intel generation check with a different
> > feature check ?
> 
> There's some checks in there that we can do certain panel fitter mode
> changes without a modeset (throught ALLOW_MODESET for atomic commits).
> That's 100% encoding intel hw constraints: Our hw can disable the panel
> fitter without a modest (so going from upscaled -> native resolution), but
> not any of the other changes (native -> upscaled or 2 different upscaled
> versions).

OK, thank you for the information.

Would it make sense to rename the Intel-specific test files to start with i915 
(or any other Intel prefix) to make this clear ?

> > >  	for_each_pipe_with_valid_output(display, pipe, output) {

-- 
Regards,

Laurent Pinchart

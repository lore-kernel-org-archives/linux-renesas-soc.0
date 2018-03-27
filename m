Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52235 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbeC0Glq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 02:41:46 -0400
Received: by mail-wm0-f66.google.com with SMTP id l9so19528321wmh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Mar 2018 23:41:46 -0700 (PDT)
Date: Tue, 27 Mar 2018 08:41:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH igt 2/8] tests/kms_panel_fitting: check for
 i915 before checking version
Message-ID: <20180327064142.GG14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <4326028.gVfV6JXNhJ@avalon>
 <20180321083433.GB14155@phenom.ffwll.local>
 <5833508.5Jkp4rVBdS@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5833508.5Jkp4rVBdS@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 21, 2018 at 10:52:19AM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wednesday, 21 March 2018 10:34:33 EET Daniel Vetter wrote:
> > On Tue, Mar 20, 2018 at 01:24:09PM +0200, Laurent Pinchart wrote:
> > > Hi Ulrich,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Thursday, 15 March 2018 16:45:38 EET Ulrich Hecht wrote:
> > > > Fixes false negatives on non-i915 platforms.
> > > > 
> > > > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > > > ---
> > > > 
> > > >  tests/kms_panel_fitting.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> > > > index b3cee22..6d0be50 100644
> > > > --- a/tests/kms_panel_fitting.c
> > > > +++ b/tests/kms_panel_fitting.c
> > > > @@ -243,6 +243,7 @@ static void test_atomic_fastset(igt_display_t
> > > > *display)
> > > > 
> > > >  		igt_set_module_param_int("fastboot", 1);
> > > >  	
> > > >  	igt_require(display->is_atomic);
> > > > 
> > > > +	igt_require(is_i915_device(display->drm_fd));
> > > > 
> > > >  	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
> > > 
> > > I'm fine with this patch as a quick fix, but what in this test is Intel-
> > > specific ? Can't we replace the Intel generation check with a different
> > > feature check ?
> > 
> > There's some checks in there that we can do certain panel fitter mode
> > changes without a modeset (throught ALLOW_MODESET for atomic commits).
> > That's 100% encoding intel hw constraints: Our hw can disable the panel
> > fitter without a modest (so going from upscaled -> native resolution), but
> > not any of the other changes (native -> upscaled or 2 different upscaled
> > versions).
> 
> OK, thank you for the information.
> 
> Would it make sense to rename the Intel-specific test files to start with i915 
> (or any other Intel prefix) to make this clear ?

We prefer to not rename test names too much, fairly disruptive to our CI.
We're working on some new infrastructure which should make this easier at
least.

But yeah if you bring a qualition, then we can make this happen. Need to
coordinate with igt maintainers on #intel-gfx (since we also need to pull
in CI folks, which hang out there too).
-Daniel

> 
> > > >  	for_each_pipe_with_valid_output(display, pipe, output) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

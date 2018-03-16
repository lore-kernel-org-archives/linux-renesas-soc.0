Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34967 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbeCPIq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:46:26 -0400
Received: by mail-wm0-f67.google.com with SMTP id 5so1567939wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:46:26 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:46:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 3/8] lib/igt_gt: has_gpu_reset(): fix
 failed assertion on non-i915 platforms
Message-ID: <20180316084622.GB14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-4-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180315172853.GW5453@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180315172853.GW5453@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 07:28:53PM +0200, Ville Syrj�l� wrote:
> On Thu, Mar 15, 2018 at 03:45:39PM +0100, Ulrich Hecht wrote:
> > Checks if we have an i915 device before using intel_get_drm_devid().
> > 
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > ---
> >  lib/igt_gt.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > index e630550..9cb07c2 100644
> > --- a/lib/igt_gt.c
> > +++ b/lib/igt_gt.c
> 
> I would think igt_gt as a whole is pretty much i915 specific.
> So feels to me like we should not have gotten this deep when
> using another driver.

Yeah all the gt stuff should be protected with igt_require(i915).
-Daniel

> 
> > @@ -59,14 +59,17 @@ static bool has_gpu_reset(int fd)
> >  		struct drm_i915_getparam gp;
> >  		int val = 0;
> >  
> > -		memset(&gp, 0, sizeof(gp));
> > -		gp.param = 35; /* HAS_GPU_RESET */
> > -		gp.value = &val;
> > -
> > -		if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
> > -			once = intel_gen(intel_get_drm_devid(fd)) >= 5;
> > -		else
> > -			once = val > 0;
> > +		if (is_i915_device(fd)) {
> > +			memset(&gp, 0, sizeof(gp));
> > +			gp.param = 35; /* HAS_GPU_RESET */
> > +			gp.value = &val;
> > +
> > +			if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
> > +				once = intel_gen(intel_get_drm_devid(fd)) >= 5;
> > +			else
> > +				once = val > 0;
> > +		} else
> > +			once = 0;
> >  	}
> >  	return once;
> >  }
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Ville Syrj�l�
> Intel OTC
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

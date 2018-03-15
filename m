Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:44363 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752020AbeCORsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 13:48:21 -0400
Date: Thu, 15 Mar 2018 19:28:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 3/8] lib/igt_gt: has_gpu_reset(): fix
 failed assertion on non-i915 platforms
Message-ID: <20180315172853.GW5453@intel.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-4-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1521125144-28614-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:39PM +0100, Ulrich Hecht wrote:
> Checks if we have an i915 device before using intel_get_drm_devid().
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  lib/igt_gt.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index e630550..9cb07c2 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c

I would think igt_gt as a whole is pretty much i915 specific.
So feels to me like we should not have gotten this deep when
using another driver.

> @@ -59,14 +59,17 @@ static bool has_gpu_reset(int fd)
>  		struct drm_i915_getparam gp;
>  		int val = 0;
>  
> -		memset(&gp, 0, sizeof(gp));
> -		gp.param = 35; /* HAS_GPU_RESET */
> -		gp.value = &val;
> -
> -		if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
> -			once = intel_gen(intel_get_drm_devid(fd)) >= 5;
> -		else
> -			once = val > 0;
> +		if (is_i915_device(fd)) {
> +			memset(&gp, 0, sizeof(gp));
> +			gp.param = 35; /* HAS_GPU_RESET */
> +			gp.value = &val;
> +
> +			if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp))
> +				once = intel_gen(intel_get_drm_devid(fd)) >= 5;
> +			else
> +				once = val > 0;
> +		} else
> +			once = 0;
>  	}
>  	return once;
>  }
> -- 
> 2.7.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Ville Syrj�l�
Intel OTC

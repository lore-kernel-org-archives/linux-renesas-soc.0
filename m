Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32930 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753132AbeCPIyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:54:03 -0400
Received: by mail-wm0-f65.google.com with SMTP id s206so1772747wme.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:54:03 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:53:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 7/8] tests/kms_addfb_basic: size_tests():
 reduce test buffer size
Message-ID: <20180316085357.GF14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-8-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521125144-28614-8-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:43PM +0100, Ulrich Hecht wrote:
> Fixes fails on low-memory devices.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

That's really low memory ... how low are we talking about here? Even 15
year old intel integrated gpus can do 4M buffers (just barely).

Just want to make sure we're not missing anything here, patch itself looks
ok.
-Daniel

> ---
>  tests/kms_addfb_basic.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index cf9ba37..d1da718 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -238,26 +238,26 @@ static void size_tests(int fd)
>  	struct drm_mode_fb_cmd2 f_16 = {};
>  	struct drm_mode_fb_cmd2 f_8 = {};
>  
> -	f.width = 1024;
> -	f.height = 1024;
> +	f.width = 512;
> +	f.height = 512;
>  	f.pixel_format = DRM_FORMAT_XRGB8888;
> -	f.pitches[0] = 1024*4;
> +	f.pitches[0] = 512*4;
>  
> -	f_16.width = 1024;
> -	f_16.height = 1024*2;
> +	f_16.width = 512;
> +	f_16.height = 512*2;
>  	f_16.pixel_format = DRM_FORMAT_RGB565;
> -	f_16.pitches[0] = 1024*2;
> +	f_16.pitches[0] = 512*2;
>  
> -	f_8.width = 1024*2;
> -	f_8.height = 1024*2;
> +	f_8.width = 512*2;
> +	f_8.height = 512*2;
>  	f_8.pixel_format = DRM_FORMAT_C8;
> -	f_8.pitches[0] = 1024*2;
> +	f_8.pitches[0] = 512*2;
>  
>  	igt_fixture {
> -		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> +		gem_bo = igt_create_bo_with_dimensions(fd, 512, 512,
>  			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
>  		igt_assert(gem_bo);
> -		gem_bo_small = igt_create_bo_with_dimensions(fd, 1024, 1023,
> +		gem_bo_small = igt_create_bo_with_dimensions(fd, 512, 511,
>  			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
>  		igt_assert(gem_bo_small);
>  	}
> @@ -311,7 +311,7 @@ static void size_tests(int fd)
>  	}
>  
>  	/* Just to check that the parameters would work. */
> -	f.height = 1020;
> +	f.height = 510;
>  	igt_subtest("small-bo") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> @@ -320,7 +320,7 @@ static void size_tests(int fd)
>  
>  	igt_subtest("bo-too-small-due-to-tiling") {
>  		igt_require(is_i915_device(fd));
> -		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
> +		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 512*4);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
>  			   errno == EINVAL);
>  	}
> -- 
> 2.7.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

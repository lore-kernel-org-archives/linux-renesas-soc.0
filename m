Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51651 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbeCPIvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:51:08 -0400
Received: by mail-wm0-f65.google.com with SMTP id h21so1567905wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:51:08 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:51:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 1/8] tests/kms_addfb_basic: skip
 i915-specific tests on other platforms
Message-ID: <20180316085105.GD14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521125144-28614-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:37PM +0100, Ulrich Hecht wrote:
> Add is_i915_device() requirement to tests using Intel-specific APIs.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/kms_addfb_basic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 7d8852f..cf9ba37 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -104,6 +104,7 @@ static void invalid_tests(int fd)
>  	}
>  
>  	igt_subtest("clobberred-modifier") {
> +		igt_require(is_i915_device(fd));
>  		f.flags = 0;
>  		f.modifier[0] = 0;
>  		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
> @@ -318,6 +319,7 @@ static void size_tests(int fd)
>  	}
>  
>  	igt_subtest("bo-too-small-due-to-tiling") {
> +		igt_require(is_i915_device(fd));
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
>  			   errno == EINVAL);
> @@ -369,6 +371,7 @@ static void addfb25_tests(int fd)
>  
>  	igt_subtest_group {
>  		igt_fixture {
> +			igt_require(is_i915_device(fd));
>  			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
>  			igt_require_fb_modifiers(fd);
>  		}
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

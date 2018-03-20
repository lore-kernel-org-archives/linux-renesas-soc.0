Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33400 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752512AbeCTLXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 07:23:21 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH igt 1/8] tests/kms_addfb_basic: skip i915-specific tests on other platforms
Date: Tue, 20 Mar 2018 13:24:26 +0200
Message-ID: <1570444.QHh5qsClPT@avalon>
In-Reply-To: <1521125144-28614-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1521125144-28614-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Thursday, 15 March 2018 16:45:37 EET Ulrich Hecht wrote:
> Add is_i915_device() requirement to tests using Intel-specific APIs.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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


-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35966 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbeCPIv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:51:57 -0400
Received: by mail-wm0-f65.google.com with SMTP id n3so1588332wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:51:57 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:51:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 2/8] tests/kms_panel_fitting: check for
 i915 before checking version
Message-ID: <20180316085152.GE14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-3-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521125144-28614-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:38PM +0100, Ulrich Hecht wrote:
> Fixes false negatives on non-i915 platforms.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/kms_panel_fitting.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index b3cee22..6d0be50 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -243,6 +243,7 @@ static void test_atomic_fastset(igt_display_t *display)
>  		igt_set_module_param_int("fastboot", 1);
>  
>  	igt_require(display->is_atomic);
> +	igt_require(is_i915_device(display->drm_fd));
>  	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
>  
>  	for_each_pipe_with_valid_output(display, pipe, output) {
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

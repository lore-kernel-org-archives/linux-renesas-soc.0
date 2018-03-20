Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33392 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752512AbeCTLXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 07:23:04 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH igt 2/8] tests/kms_panel_fitting: check for i915 before checking version
Date: Tue, 20 Mar 2018 13:24:09 +0200
Message-ID: <4326028.gVfV6JXNhJ@avalon>
In-Reply-To: <1521125144-28614-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1521125144-28614-3-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Thursday, 15 March 2018 16:45:38 EET Ulrich Hecht wrote:
> Fixes false negatives on non-i915 platforms.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
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

I'm fine with this patch as a quick fix, but what in this test is Intel-
specific ? Can't we replace the Intel generation check with a different 
feature check ?

>  	for_each_pipe_with_valid_output(display, pipe, output) {

-- 
Regards,

Laurent Pinchart

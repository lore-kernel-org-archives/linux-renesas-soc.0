Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:11704 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751372AbeCORn1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 13:43:27 -0400
Date: Thu, 15 Mar 2018 19:43:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 6/8] lib/igt_pm: turn absence of
 autosuspend_delay_ms from fail to skip
Message-ID: <20180315174323.GY5453@intel.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-7-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1521125144-28614-7-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:42PM +0100, Ulrich Hecht wrote:
> Fixes false negatives on everything that doesn't happen to be at a
> specific hard-coded sysfs path...
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  lib/igt_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 5bf5b2e..641157b 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -262,7 +262,7 @@ bool igt_setup_runtime_pm(void)
>  	 * suite goes faster and we have a higher probability of triggering race
>  	 * conditions. */
>  	fd = open(POWER_DIR "/autosuspend_delay_ms", O_WRONLY);

The hardocded path should probably go then.

igt_sysfs_path() + "/device/power" looks like it should dtrt.
Would need to plumb the fd down though. Hopefully every caller
has it handy.

> -	igt_assert_f(fd >= 0,
> +	igt_require_f(fd >= 0,
>  		     "Can't open " POWER_DIR "/autosuspend_delay_ms\n");
>  
>  	/* If we fail to write to the file, it means this system doesn't support
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

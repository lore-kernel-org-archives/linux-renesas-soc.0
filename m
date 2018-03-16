Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54699 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751424AbeCPItD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:49:03 -0400
Received: by mail-wm0-f68.google.com with SMTP id h76so1556537wme.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Mar 2018 01:49:03 -0700 (PDT)
Date: Fri, 16 Mar 2018 09:49:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 8/8] test/kms_addfb_basic: tolerate
 absence of 8-bit format
Message-ID: <20180316084900.GC14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-9-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521125144-28614-9-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:44PM +0100, Ulrich Hecht wrote:
> Ignores failure to add DRM_FORMAT_C8 frame buffer; some devices do not
> support any 8-bit format.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

I think the proper fix for this would be to split it out into a new
subtest, and then check that you have universal planes (all modern planes
have that) and skip the test if no plane advertises C8.
-Daniel

> ---
>  tests/kms_addfb_basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index d1da718..db79827 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -273,8 +273,8 @@ static void size_tests(int fd)
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == 0);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id) == 0);
>  		f.fb_id = 0;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
> +		if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0)
> +			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
>  		f.fb_id = 0;
>  	}
>  
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

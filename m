Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34931 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751333AbdHXJgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:36:03 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 2/2] README: Document need for killall command
Date: Thu, 24 Aug 2017 12:36:34 +0300
Message-ID: <1699997.AfhkDGHqSO@avalon>
In-Reply-To: <1503528064-10454-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <1503528064-10454-3-git-send-email-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday, 24 August 2017 01:41:04 EEST Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The killall command is provided by the psmisc package on debian based
> systems. On other systems it should be built or added to the filesystem as
> appropriate.
> 
> Also remove unnecessary blank line.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README b/README
> index e503a2c41aef..7efcef394ae9 100644
> --- a/README
> +++ b/README
> @@ -43,6 +43,7 @@ system in a directory included in $PATH.
>  * media-ctl (part of v4l-utils, available at
> git://linuxtv.org/v4l-utils.git) * raw2rgbpnm (available at
> git://git.retiisi.org.uk/~sailus/raw2rgbpnm.git) * yavta (available at
> git://git.ideasonboard.org/yavta.git)
> +* killall (available from the psmisc package)

I've moved this between compare and media-ctl to keep the dependencies 
alphabetically sorted.

> 
>  All but the HGO and CLU/LUT tests can be run with the latest version of
> these tools. To test the HGO, HGT and CLU/LUT, the 'vsp' branch of 'yavta'
> is currently @@ -53,7 +54,6 @@ tool is not available the corresponding
> tests will be skipped.
> 
>  * stress (available at http://people.seas.harvard.edu/~apw/stress/)
> 
> -

I like this blank line :-) There are two blank lines before each section title 
in the README file.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you're fine the comments I'll update the patch when applying and push it.

>  -----------------
>  Running the Tests
>  -----------------


-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38862 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbeLJUY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 15:24:27 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Fix trivial documentation
Date: Mon, 10 Dec 2018 22:25:06 +0200
Message-ID: <3645934.BnSJS6SbSo@avalon>
In-Reply-To: <20181207163134.14279-1-kieran.bingham+renesas@ideasonboard.com>
References: <20181207163134.14279-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Friday, 7 December 2018 18:31:34 EET Kieran Bingham wrote:
> In the partition sizing the term 'prevents' is inappropriately
> pluralized.  Simplify to 'prevent'.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/media/platform/vsp1/vsp1_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_video.c
> b/drivers/media/platform/vsp1/vsp1_video.c index 771dfe1f7c20..7ceaf3222145
> 100644
> --- a/drivers/media/platform/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/vsp1/vsp1_video.c
> @@ -223,7 +223,7 @@ static void vsp1_video_calculate_partition(struct
> vsp1_pipeline *pipe, * If the modulus is less than half of the partition
> size,
>  	 * the penultimate partition is reduced to half, which is added
>  	 * to the final partition: |1234|1234|1234|12|341|
> -	 * to prevents this:       |1234|1234|1234|1234|1|.
> +	 * to prevent this:        |1234|1234|1234|1234|1|.
>  	 */
>  	if (modulus) {
>  		/*


-- 
Regards,

Laurent Pinchart

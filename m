Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51780 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753663AbcIAW3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 18:29:46 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: add ADV7513 HDMI encoder
Date: Fri, 02 Sep 2016 01:30:10 +0300
Message-ID: <2848041.c5UNY2h6Av@avalon>
In-Reply-To: <1609156.suOBSqf0of@wasted.cogentembedded.com>
References: <1609156.suOBSqf0of@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Thursday 01 Sep 2016 22:04:59 Sergei Shtylyov wrote:
> The R-Car DU driver keeps a list of the external encoders which it uses
> to  get  the encoder type.  Renesas Wheat board uses Analog Devices ADV7513
> HDMI encoder, unlike the other Renesas boards which all use ADV7511W --
> add it to the encoder list.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And applied to my tree.

> ---
> This patch is against the 'drm/next/du' branch of Laurent Pinchart's
> 'media.git' repo...
> 
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: media/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> ===================================================================
> --- media.orig/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ media/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -362,6 +362,7 @@ static int rcar_du_encoders_init_one(str
>  	} encoders[] = {
>  		{ "adi,adv7123", RCAR_DU_ENCODER_VGA },
>  		{ "adi,adv7511w", RCAR_DU_ENCODER_HDMI },
> +		{ "adi,adv7513", RCAR_DU_ENCODER_HDMI },
>  		{ "thine,thc63lvdm83d", RCAR_DU_ENCODER_LVDS },
>  	};

-- 
Regards,

Laurent Pinchart

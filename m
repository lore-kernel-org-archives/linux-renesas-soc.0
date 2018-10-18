Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbeJRTOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 15:14:45 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] drm: rcar-du: lvds: Add R8A77965 support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181018004149.29448-3-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <c415efa2-f57c-b034-dd45-318c6d2f90b7@ideasonboard.com>
Date: Thu, 18 Oct 2018 12:14:09 +0100
MIME-Version: 1.0
In-Reply-To: <20181018004149.29448-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thank you for the patch,

On 18/10/18 01:41, Laurent Pinchart wrote:
> Add support for the R-Car M3-N (R8A77965) SoC to the LVDS encoder
> driver. The encoder appears identical to the M3-W version, we can thus
> simply point to the generic Gen3 data.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 173d7ad0b991..534a128a869d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -790,6 +790,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
> +	{ .compatible = "renesas,r8a77965-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
>  	{ .compatible = "renesas,r8a77980-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77990-lvds", .data = &rcar_lvds_r8a77990_info },
> 

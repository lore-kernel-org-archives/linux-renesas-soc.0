Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33084 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbeETIpB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 04:45:01 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
Date: Sun, 20 May 2018 11:45:24 +0300
Message-ID: <3888488.E5UaB3ZWWj@avalon>
In-Reply-To: <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

Thank you for the patch.

On Tuesday, 15 May 2018 15:20:37 EEST Ulrich Hecht wrote:
> Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> b/drivers/gpu/drm/rcar-du/rcar_lvds.c index 3d2d3bb..58fb9f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info
> rcar_lvds_r8a77970_info = { .quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR |
> RCAR_LVDS_QUIRK_GEN3_LVEN, };
> 
> +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
> +	.gen = 3,
> +	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,

I'm afraid this won't be enough. With this patch the driver will call 
rcar_lvds_lvdpllcr_gen3(), which writes values to the LVDPLLCR register that 
don't match the register layout for D3.

While I'm fine with an initial version that doesn't support fine-grained 
control of the LVDS PLL to achieve the HDMI clock accuracy requirements, we 
need the LVDS encoder to be at least functional for the patches to get merged.

There are also other registers not related to the PLL that need to be set 
(such as the LVDSTRIPE register), and other differences in register layouts 
(for instance the D3 doesn't have a PLLON bit in register LVDC0).

Even the LVEN bit seems to need special handling on D3. According to version 
1.00 of the datasheet it should be set to 1 at the same time as bit LVRES.

Could you please study the datasheet in details and update the code 
accordingly ?

> +};
> +
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
> @@ -519,6 +524,7 @@ static const struct of_device_id rcar_lvds_of_table[] =
> { { .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info }, {
> .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info }, {
> .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
> +	{ .compatible = "renesas,r8a77995-lvds", .data = &rcar_lvds_r8a77995_info
> }, { }
>  };

-- 
Regards,

Laurent Pinchart

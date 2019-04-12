Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C755C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 14:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AEA820850
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 14:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ouPvYMjR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfDLOuo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 10:50:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41638 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfDLOuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 10:50:44 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5398549;
        Fri, 12 Apr 2019 16:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555080642;
        bh=m3w4hNWl660T0k/BCw8GHeUDAiHGfnIQacgKSy7O3Nw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ouPvYMjRpchjCjuDYESelfx23zqhnnCah3AFRSUhp+zY+vVWUp1Nq9U/X2J70T77w
         i40/Euk200aA5gEGe1G2Mw5czCtodb3FsXgGFa4jMZqzU48x2ky2QvJrq+DV0ssMHV
         Oh0cS7/116AwPsfmH56Tt57tYc0wAwepYvT/DwLA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH V2 3/4] drm: rcar-du: Add R8A774A1 support
To:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
 <1555072685-59276-4-git-send-email-biju.das@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <240da5a1-fa9a-acc0-2650-23468cdd944c@ideasonboard.com>
Date:   Fri, 12 Apr 2019 15:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555072685-59276-4-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 12/04/2019 13:38, Biju Das wrote:
> Add support for the R8A774A1 DU (which is very similar to the R8A7796 DU
> except that it lacks TCON and CMM); it has one RGB output, one LVDS output
> and one HDMI output.
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thank you for the updated patch,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
> V1-->V2
>   * Incorporated Kieran's review comment
>     (https://patchwork.kernel.org/patch/10896165/)
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 75ab17a..6df37c2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -102,6 +102,35 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
>  	},
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_INTERLACED
> +		  | RCAR_DU_FEATURE_TVM_SYNC,
> +	.channels_mask = BIT(2) | BIT(1) | BIT(0),
> +	.routes = {
> +		/*
> +		 * R8A774A1 has one RGB output, one LVDS output and one HDMI
> +		 * output.
> +		 */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(2),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_HDMI0] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 2,
> +		},
> +	},
> +	.num_lvds = 1,
> +	.dpll_mask =  BIT(1),
> +};
> +
>  static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> @@ -386,6 +415,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
>  	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
> +	{ .compatible = "renesas,du-r8a774a1", .data = &rcar_du_r8a774a1_info },
>  	{ .compatible = "renesas,du-r8a774c0", .data = &rcar_du_r8a774c0_info },
>  	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
>  	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
> 


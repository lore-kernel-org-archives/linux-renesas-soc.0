Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA01C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6EC720844
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GCWHaARb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfAVPpJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 10:45:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbfAVPpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 10:45:09 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A182053E;
        Tue, 22 Jan 2019 16:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548171907;
        bh=5d4PwyyEgab5VLcWSoH6t4j5wyCsVqDLbiZ7QU/faRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCWHaARbwl+1aHSEWw9xuuKvrv/UhTznxqF3qCruGZ7Ye4o1JUk6FSWJ7VXZEbw1+
         ttfnzsDuaBr9JMg1eD/q/X9xX6NNglskRp9aucxQ10oX5ao/BnRrMVNF0cdhjjX6cA
         ynQ3XWOnqoUktCsNjj+TbLsMvXYzu9E0QDJfcP3o=
Date:   Tue, 22 Jan 2019 17:45:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Message-ID: <20190122154507.GF11461@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Jan 22, 2019 at 03:25:47PM +0000, Biju Das wrote:
> The LVDS encoders on RZ/G1N SoC is similar to RZ/G1M. Add support for
> RZ/G1N (R8A7744) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 96d749a..caea2c5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -785,6 +785,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>  
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
> +	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
>  	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart

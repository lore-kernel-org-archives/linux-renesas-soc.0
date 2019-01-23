Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8A9C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 08:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D50D21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 08:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="n1qtD3bF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfAWI7f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:59:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49741 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfAWI7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 03:59:35 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AD29625BDDE;
        Wed, 23 Jan 2019 19:59:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548233974; bh=7Nv3K37gPcWO4ZmSrqWwFFClsTm98g3+zLFMhf/9mmw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n1qtD3bFDvUA8EJ+osVlhFiloSA/T1bkZ4ZsDLLfECdv0e+8ni0o+GXuWMTTix5Gw
         E1HSXm9RddzW5qs7KIE3PnURMk1zpi1PNkXkg4IgQpUmIxSc4cbS/YL/tTXy69Sel1
         9+9NMXOj4Akmvivx0chSY6SDeo6gTLkU5kMKn2sk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CA182940471; Wed, 23 Jan 2019 09:59:31 +0100 (CET)
Date:   Wed, 23 Jan 2019 09:59:31 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Message-ID: <20190123085931.sn4yvolhit2gfcku@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 03:25:47PM +0000, Biju Das wrote:
> The LVDS encoders on RZ/G1N SoC is similar to RZ/G1M. Add support for
> RZ/G1N (R8A7744) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

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

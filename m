Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5499C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 821BF2082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UH0iRJr5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbfDLMGu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:06:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39938 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfDLMGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:06:49 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 421B3549;
        Fri, 12 Apr 2019 14:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555070807;
        bh=3kfEE8KTPkedgLACp9DKAceQXzxIxRmSOBOiIWsslSg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UH0iRJr5C2J6HBUCyu8wPJqP9oef86tG2HpsCcuHzjCgK8dQSMPrt1OtkUcil1tTR
         Xbqf7hkJdpWgpt/rbrMplkzekl2v1BSi8asuLQw4LBIiES9t+mB6GmsifvoDrs5QNX
         RPGYT0GofudDcL8AJ6ZUEvTF4HuL8JKe46523WI4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 4/4] drm: rcar-du: lvds: Add r8a774a1 support
To:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
 <1554993271-29523-5-git-send-email-biju.das@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <644bcaa0-6cc3-3e22-a728-79e5754d26e4@ideasonboard.com>
Date:   Fri, 12 Apr 2019 13:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554993271-29523-5-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 11/04/2019 15:34, Biju Das wrote:
> The LVDS encoders on RZ/G2M SoC is similar to R-Car M3-W. Add support for
> RZ/G2M (R8A774A1) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

This one seems to be ok using the gen3 as far as I can tell, the PLL
configuration and layout match.

We're lacking the TCON, but that's not supported currently anyway, and
shouldn't matter here.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 7ef97b2..819561e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -857,6 +857,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
> +	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
>  	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
> 


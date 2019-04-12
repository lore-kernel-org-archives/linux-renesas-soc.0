Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FF1C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 009492171F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NBmZ14Mz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfDLLr0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:47:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39734 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfDLLr0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:47:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 948D1549;
        Fri, 12 Apr 2019 13:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555069644;
        bh=HLy8xDtxcC2IY2D7MhaZlOhfFS0P1zFM/tCJliCqrfk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NBmZ14MzmgSr/Gwygc6qD2Mz1KqI4a9xkUs8tSjiN54R6IAyKwLE+Sg49wSCRBe+e
         iipcR5NmLj2EFxkiLNLE3uEnWxKTQPWD9myHCH4/AVzyQN9yBCd4ZURzgj403rV1Bi
         HJ4W72q8d8JkaS9lwanbGvZsJI2RgqoClmeG7XF4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 3/4] drm: rcar-du: Add R8A774A1 support
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
 <1554993271-29523-4-git-send-email-biju.das@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <9476e97f-380a-7285-b169-72085dfe0eca@ideasonboard.com>
Date:   Fri, 12 Apr 2019 12:47:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554993271-29523-4-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 11/04/2019 15:34, Biju Das wrote:
> Add support for the R8A774A1 DU (which is very similar to the R8A7796 DU);
> it has one RGB output, one LVDS output and one HDMI output.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

I see Figure 35.1b across the two datasheets does show some differences
between these two parts, but the layout defined by the
rcar_du_r8a7796_info structure is compatible based on the current state
of the driver...

However, if support for the TCON/CMM is added to the DU driver - then I
think this will need to be separated.

I have seen patches this month which are trying to upstream a CMM
implementation.

With that in mind - perhaps it would be worth creating a new structure
for this part?

Otherwise the CMM would end up being enabled when it doesn't exist and
could cause problems.

--
Regards

Kieran


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 75ab17a..f7a5314 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -386,6 +386,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
>  	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
> +	{ .compatible = "renesas,du-r8a774a1", .data = &rcar_du_r8a7796_info },
>  	{ .compatible = "renesas,du-r8a774c0", .data = &rcar_du_r8a774c0_info },
>  	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
>  	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
> 


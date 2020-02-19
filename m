Return-Path: <SRS0=cnDJ=4H=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610B8C34047
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Feb 2020 15:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 371362465D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Feb 2020 15:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Doi2YBQb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSPsc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Feb 2020 10:48:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37436 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgBSPsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:48:32 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E80C52B;
        Wed, 19 Feb 2020 16:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582127311;
        bh=3fQWnidBMqiUE6Xp3K8JaXKgf3VBv1th0Ho1uGp6XGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Doi2YBQbajCRu3ME11h2jTj+tvxlU7Fq4YxfPwIG6PE7AkdQ9RDpjFkuXMQDWeo3B
         2gJSdLVMuoyw1ZCgw4TZMGoeUnE/SdMlAWYyHKMTXiT6WzLc3TMGdOH01tXhBBFZgh
         ylHBDuHp0Nz5Znx0yPZWOAfyrT2d13jih9+JfzaQ=
Date:   Wed, 19 Feb 2020 17:48:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7745: Convert to new DU DT bindings
Message-ID: <20200219154812.GW5070@pendragon.ideasonboard.com>
References: <20200218132217.21454-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200218132217.21454-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Feb 18, 2020 at 02:22:17PM +0100, Geert Uytterhoeven wrote:
> The DU DT bindings have been updated to drop the reg-names property.
> Update the r8a7745 device tree accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 3f88a7e34af2c28b..3b413658eb8d8fac 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -1506,7 +1506,6 @@
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7745";
>  			reg = <0 0xfeb00000 0 0x40000>;
> -			reg-names = "du";
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;

-- 
Regards,

Laurent Pinchart

Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04DEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C104220874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VTdPnqFB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732977AbeLQNbI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:31:08 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40748 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732966AbeLQNbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:31:08 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7656C25B781;
        Tue, 18 Dec 2018 00:31:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545053466; bh=Go4lj5mQkZCxTl/j3EAFA0iHB8samhLQ7XSpfKsGKbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VTdPnqFBM53CttNMuRuZTlyiiJuMnOx8Oa99UBAmBx+8wuPX1A7eTuG5cUiuczZri
         ipQtYHC2aMn15j8VtsOUhEjvzAgbX8G7J+8ZtK6YfzETFg2t1HeDgDuwCdyFw6El6D
         IBeD7A9JwMThP5Nbdw1/mjzqF8CdV5CoDTIVJcLM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7020194048A; Mon, 17 Dec 2018 14:31:04 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:31:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add backlight
Message-ID: <20181217133103.v7346mq2f6nedabn@verge.net.au>
References: <20181216114744.15263-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181216114744.15263-1-laurent.pinchart+renesas@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 16, 2018 at 01:47:44PM +0200, Laurent Pinchart wrote:
> Add the backlight device for the LVDS1 output, in preparation for panel
> support.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I would value a review of this patch.

> ---
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 528e805a9d52..b8ba790907af 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -29,6 +29,16 @@
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm3 0 50000>;
> +
> +		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
> +		default-brightness-level = <10>;
> +
> +		power-supply = <&reg_12p0v>;
> +	};
> +
>  	cvbs-in {
>  		compatible = "composite-video-connector";
>  		label = "CVBS IN";
> @@ -128,6 +138,15 @@
>  		regulator-always-on;
>  	};
>  
> +	reg_12p0v: regulator1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "D12.0V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	x13_clk: x13 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> -- 
> Regards,
> 
> Laurent Pinchart
> 

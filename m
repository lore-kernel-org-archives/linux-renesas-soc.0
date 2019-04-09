Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68571C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37C4C20883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 11:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jIMgXqvB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfDILKV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 07:10:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41904 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfDILKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 07:10:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 64D1525BDAE;
        Tue,  9 Apr 2019 21:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554808217; bh=bRl+Qg6grz+qnhhaNCk9OX90AgTm8B9PVBSsCvyDhew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIMgXqvBF0is6o69O8acZaeAR7JLW1DI53PAI625UMAmvJu9p6RUk8wWa63QDi6gS
         cYxCqpLrae9vUf/+VwPFPPSIp+HhanPwywMtOyEfIxbAYXgQ9cRRXdiZc4uamoa8pr
         2obWyfHi7SwknX7ZnqpU1IHwdElGowO+GrPd/VzI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8E6379402E1; Tue,  9 Apr 2019 13:10:15 +0200 (CEST)
Date:   Tue, 9 Apr 2019 13:10:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH V3 08/13] ARM: dts: r8a77470: Add USB PHY DT support
Message-ID: <20190409111015.x6t5h3jeslovrrho@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-9-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-9-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 11:28:39AM +0100, Biju Das wrote:
> Define the r8a77470 generic part of the USB PHY device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2-->V3
>   * Added gen3 usb2 phy nodes
> V1-->V2
>  * New patch
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 493cf2b..dcd2975 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -325,6 +325,42 @@
>  			status = "disabled";
>  		};
>  
> +		usbphy0: usb-phy@e6590100 {
> +			compatible = "renesas,usb-phy-r8a77470",
> +				     "renesas,rcar-gen2-usb-phy";
> +			reg = <0 0xe6590100 0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&cpg CPG_MOD 704>;
> +			clock-names = "usbhs";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 704>;
> +			status = "disabled";
> +
> +			usb0: usb-channel@0 {
> +				reg = <0>;
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		usbphy1: usb-phy@e6598100 {
> +			compatible = "renesas,usb-phy-r8a77470",
> +				     "renesas,rcar-gen2-usb-phy";
> +			reg = <0 0xe6598100 0 0x100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&cpg CPG_MOD 706>;
> +			clock-names = "usbhs";
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 706>;
> +			status = "disabled";
> +
> +			usb1: usb-channel@0 {
> +				reg = <0>;
> +				#phy-cells = <1>;
> +			};
> +		};
> +
>  		usb_dmac00: dma-controller@e65a0000 {
>  			compatible = "renesas,r8a77470-usb-dmac",
>  				     "renesas,usb-dmac";
> @@ -588,6 +624,26 @@
>  			status = "disabled";
>  		};
>  
> +		usb2_phy0: usb-phy@ee080200 {
> +			compatible = "renesas,usb2-phy-r8a77470";
> +			reg = <0 0xee080200 0 0x700>;
> +			clocks = <&cpg CPG_MOD 703>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 703>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		usb2_phy1: usb-phy@ee0c0200 {
> +			compatible = "renesas,usb2-phy-r8a77470";
> +			reg = <0 0xee0c0200 0 0x700>;
> +			clocks = <&cpg CPG_MOD 705>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 705>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 

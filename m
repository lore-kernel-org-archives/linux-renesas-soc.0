Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14712C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:18:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D992A217FA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TpyyBSSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730907AbeLPUSF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:18:05 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:58986 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730828AbeLPUSF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:18:05 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7B0F125B764;
        Mon, 17 Dec 2018 07:18:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544991483; bh=yy9VTru/ghtJWvGJpq4XP6OvOzDV5wmKJwLaijyK2Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TpyyBSSkVHk8koEo2HIJkUqN4EsOeByb1cODKzYbx7+j39TXVE7Dmay0k9ggNNxNr
         WBMZKcEaIJB/4msSblqRxNVaHjwreHaX2zYs+QTVFTjZZuuBLRsbdGY/MQVZdM/83M
         CgueYCuS0qsQoO/CoeTYc9yXt9uYCunuWLkU9AHQ=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 7550AE211F6; Sun, 16 Dec 2018 12:18:01 -0800 (PST)
Date:   Sun, 16 Dec 2018 21:18:01 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 01/17] arm64: dts: renesas: r8a774c0: Add SDHI nodes
Message-ID: <20181216201801.g3ucm7sverkgtza5@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-2-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:24AM +0000, Fabrizio Castro wrote:
> Add SDHI nodes to the DT of the r8a774c0 SoC.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 83db7c7..96a71e3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -603,6 +603,42 @@
>  			status = "disabled";
>  		};
>  
> +		sdhi0: sd@ee100000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee100000 0 0x2000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 314>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 314>;
> +			status = "disabled";
> +		};
> +
> +		sdhi1: sd@ee120000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee120000 0 0x2000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 313>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 313>;
> +			status = "disabled";
> +		};
> +
> +		sdhi3: sd@ee160000 {
> +			compatible = "renesas,sdhi-r8a774c0",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee160000 0 0x2000>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 311>;
> +			max-frequency = <200000000>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 311>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1010000 {
>  			compatible = "arm,gic-400";
>  			#interrupt-cells = <3>;
> -- 
> 2.7.4
> 

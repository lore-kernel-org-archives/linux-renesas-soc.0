Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A960C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 045D12186A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfDLL05 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:26:57 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfDLL05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:26:57 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0C51425AD68;
        Fri, 12 Apr 2019 21:26:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0C38B9403FF; Fri, 12 Apr 2019 13:26:53 +0200 (CEST)
Date:   Fri, 12 Apr 2019 13:26:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 05/20] ARM: dts: r8a77470: Add VIN support
Message-ID: <20190412112652.aslmaludlrignetc@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-6-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-6-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 04:54:07PM +0900, Cao Van Dong wrote:
> Add vin{0|1} nodes to dtsi for VIN support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 97c51c5..7d47d04 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -23,6 +23,8 @@
>  		spi1 = &msiof0;
>  		spi2 = &msiof1;
>  		spi3 = &msiof2;
> +		vin0 = &vin0;
> +		vin1 = &vin1;
>  	};

Please do not add aliases like this.

I will go ahead and apply v1 of this patch which did not have the aliases.

>  
>  	cpus {
> @@ -783,6 +785,28 @@
>  			status = "disabled";
>  		};
>  
> +		vin0: video@e6ef0000 {
> +			compatible = "renesas,vin-r8a77470",
> +				     "renesas,rcar-gen2-vin";
> +			reg = <0 0xe6ef0000 0 0x1000>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 811>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 811>;
> +			status = "disabled";
> +		};
> +
> +		vin1: video@e6ef1000 {
> +			compatible = "renesas,vin-r8a77470",
> +				     "renesas,rcar-gen2-vin";
> +			reg = <0 0xe6ef1000 0 0x1000>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 810>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 810>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 

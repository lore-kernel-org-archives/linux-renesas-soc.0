Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71264C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46214206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfDLLlV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:41:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57762 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbfDLLlV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:41:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6F60625AD68;
        Fri, 12 Apr 2019 21:41:19 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 088D19403FF; Fri, 12 Apr 2019 13:41:16 +0200 (CEST)
Date:   Fri, 12 Apr 2019 13:41:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 09/20] ARM: dts: r8a77470: Add VSP support
Message-ID: <20190412114116.xmjmi53k5lsfu3vq@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-10-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-10-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 04:54:11PM +0900, Cao Van Dong wrote:
> Add vsp nodes to dtsi for VSP support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index ae1dba0..2540bca 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -1113,6 +1113,24 @@
>  			status = "disabled";
>  		};
>  
> +		vsp@fe928000 {
> +			compatible = "renesas,vsp1";
> +			reg = <0 0xfe928000 0 0x8000>;
> +			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 131>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 131>;
> +		};
> +
> +		vsp@fe930000 {
> +			compatible = "renesas,vsp1";
> +			reg = <0 0xfe930000 0 0x8000>;
> +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 128>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +			resets = <&cpg 128>;
> +		};
> +

Nodes should be sorted by
1. Bus address
2. IP block tupe

So the above vsp nodes should go after sd@ee100000.

Otherwise this patch looks good to me.

>  		sdhi0: sd@ee100000 {
>  			compatible = "renesas,sdhi-r8a77470",
>  				     "renesas,rcar-gen2-sdhi";
> -- 
> 2.7.4
> 

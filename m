Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69F8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC7C12087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qlXBgHvH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfCMKm4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:42:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34590 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfCMKm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:42:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4796B25B73F;
        Wed, 13 Mar 2019 21:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552473774; bh=SuBPx0PePguKW2cHxffB1lh5FilZoHS3ohGMaAuWCvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlXBgHvH3oxXtxil/v70IgAocoSnmqSIJmag1p8XR0japTO7mOwOenmS+Z6FwF1vK
         ddpBy1BAI47WlXv/xVBNtwcffxwdbNe14gZrTNNVB4Wx04RLzYQPADCa/GhDi25yf7
         jrlJPJCRhsTBr7gj/fxaDvPwKJCWsVc5dTslQCpM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 873E4940C8F; Wed, 13 Mar 2019 11:42:52 +0100 (CET)
Date:   Wed, 13 Mar 2019 11:42:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Remove invalid compatible
 value for CSI40
Message-ID: <20190313104252.hmm5g5jfdltsjag7@verge.net.au>
References: <20190310130611.11114-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190310130611.11114-1-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 10, 2019 at 02:06:11PM +0100, Niklas Söderlund wrote:
> The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> the R-Car CSI-2 driver but was removed before the driver was merged.
> 
> Fixes: e961ab42e034d469 ("arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> ---
> 
> Hi Simon,
> 
> The commit introducing the issue is not yet upstream and the patch is 
> based on your renesas/next branch.
> 
> Best Regards,
> Niklas

Thanks Niklas,

I've applied this for v5.2.

It looks like the commit it fixes will be included in v5.1.
But I don't think we need to fastrack fixing this problem in that release.

> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 1ea684af99c4a19b..8571cc7e64ef2a21 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1740,8 +1740,7 @@
>  		};
>  
>  		csi40: csi2@feaa0000 {
> -			compatible = "renesas,r8a774c0-csi2",
> -				     "renesas,rcar-gen3-csi2";
> +			compatible = "renesas,r8a774c0-csi2";
>  			reg = <0 0xfeaa0000 0 0x10000>;
>  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 716>;
> -- 
> 2.21.0
> 

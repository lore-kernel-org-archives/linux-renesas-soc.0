Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7800DC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2623620857
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PbSO9Use"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfDIMPT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 08:15:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42937 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbfDIMPT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 08:15:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 22AD725BDAE;
        Tue,  9 Apr 2019 22:15:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554812117; bh=mKz3JXQQKuCDpWqMhMP4/VZ32y07d6AxsPIaF6H9y6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbSO9Use8mA7uFzBLNcRQxY9jCn9Pw7TvAebF1ARpZkv36HjNcVdgPjMLSFcLttyY
         a0rC5HaK9LoNP4d6NAyaCJWAurCdKmGmO5lJbABAOTI6pzajfGMzkg/6n67rtIQ2mN
         v+8EYlWHnsW9gNiL9f8MNds/ba8LoAio6bh06Qo4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6248B9402E1; Tue,  9 Apr 2019 14:15:15 +0200 (CEST)
Date:   Tue, 9 Apr 2019 14:15:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 01/11] ARM: dts: r8a77470: Add HSCIF support
Message-ID: <20190409121515.kqsog247tpxkybmr@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-2-git-send-email-cv-dong@jinso.co.jp>
 <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 09, 2019 at 01:51:38PM +0200, Simon Horman wrote:
> On Tue, Apr 09, 2019 at 05:51:42PM +0900, Cao Van Dong wrote:
> > Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
> > 
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Sorry, I spoke a little too soon.

The following incremental change is required in order
for this patch to compile.

Please test that each patch in this series compiles and resubmit.


diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 85f7a6f68720..60bd79fc35f7 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -594,12 +594,12 @@
 			reg = <0 0xe62c0000 0 0x60>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 717>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
 			       <&dmac1 0x39>, <&dmac1 0x3a>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 717>;
 			status = "disabled";
 		};
@@ -610,12 +610,12 @@
 			reg = <0 0xe62c8000 0 0x60>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 716>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
 			       <&dmac1 0x4d>, <&dmac1 0x4e>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 716>;
 			status = "disabled";
 		};
@@ -626,12 +626,12 @@
 			reg = <0 0xe62d0000 0 0x60>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 713>,
-				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
+				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
 			       <&dmac1 0x3b>, <&dmac1 0x3c>;
 			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
 			resets = <&cpg 713>;
 			status = "disabled";
 		};

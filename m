Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4828C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A199820874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="DMXjtuPF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbeLQKym (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 05:54:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38509 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbeLQKym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 05:54:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 175C025B781;
        Mon, 17 Dec 2018 21:54:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545044079; bh=kHvrCH3cOKFhEHNn+ZMMxEEQ7g+iJH0rPneW2Lu3NFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DMXjtuPFdSFk1uEu7AH8DQRteXkSRn2ataUvfLBM4xHf5mnr1/I58ztG604zzG80p
         3M9f+lrtNeqEUEN+d9LCp+fBK/Bc2LblGzkHL15mZofBayBryMAgyo76nLpzKDdKeT
         vyrbS73jsw5bSkewGI+MZ6qIMz1n+T7rbwKKrei4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 68C5B94048A; Mon, 17 Dec 2018 11:54:37 +0100 (CET)
Date:   Mon, 17 Dec 2018 11:54:37 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 11/17] arm64: dts: renesas: r8a774c0: Add USB-DMAC and
 HSUSB device nodes
Message-ID: <20181217105437.u2lgri7iuomjn7wq@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-12-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:34AM +0000, Fabrizio Castro wrote:
> Add usb dmac and hsusb device nodes on RZ/G2E SoC dtsi.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 45 +++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 0ab3aa6..79cdaac 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -514,6 +514,51 @@
>  			status = "disabled";
>  		};
>  
> +		hsusb: usb@e6590000 {
> +			compatible = "renesas,usbhs-r8a774c0",
> +				     "renesas,rcar-gen3-usbhs";
> +			reg = <0 0xe6590000 0 0x200>;

The above looks good but while reviewing this patch I noticed
that the size of the hsusb register range on in the DT for r8a774a1
is 0x100, Is that correct?

As for this patch, it looks good to me but I will wait to see if there are
other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> +			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> +			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
> +			       <&usb_dmac1 0>, <&usb_dmac1 1>;
> +			dma-names = "ch0", "ch1", "ch2", "ch3";
> +			renesas,buswait = <11>;
> +			phys = <&usb2_phy0>;
> +			phy-names = "usb";
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 704>, <&cpg 703>;
> +			status = "disabled";
> +		};
> +
> +		usb_dmac0: dma-controller@e65a0000 {
> +			compatible = "renesas,r8a774c0-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65a0000 0 0x100>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 330>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 330>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
> +
> +		usb_dmac1: dma-controller@e65b0000 {
> +			compatible = "renesas,r8a774c0-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65b0000 0 0x100>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 331>;
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 331>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
> +
>  		dmac0: dma-controller@e6700000 {
>  			compatible = "renesas,dmac-r8a774c0",
>  				     "renesas,rcar-dmac";
> -- 
> 2.7.4
> 

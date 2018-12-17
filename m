Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B10C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1064206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="T409EsLu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbeLQLua (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:50:30 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39163 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbeLQLua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:50:30 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D30525B781;
        Mon, 17 Dec 2018 22:50:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545047426; bh=vliCpBCKM/2Vz2yT+IrtVl2HLT5lr0y7Gu1aQTVNCo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T409EsLuBvvGaN5Dk9jaUfQ6AGcYcF6fWxmxQTjg1BRCTrALPCLVI9KuIORaCiAUi
         VncMTThPfCcEAJLkFsxCfMWTzoaXu3pC6/n0KSelnOfyljblhAmVQ8AtKNI58KV6Mn
         hp7KJvoqVjKCSqByQ1sp6eeyI16IGMn3DjOayW9s=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8D21F94048A; Mon, 17 Dec 2018 12:50:24 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:50:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and
 IIC-DVFS support
Message-ID: <20181217115024.lhaeaw4b55dgpgx2@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181216201741.qqwmc44ogqifl52e@verge.net.au>
 <TY1PR01MB177034D6488A48CE08DF797FC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177034D6488A48CE08DF797FC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 11:24:39AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 16 December 2018 20:18
> > Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS support
> >
> > On Fri, Dec 14, 2018 at 09:37:25AM +0000, Fabrizio Castro wrote:
> > > Add the I2C[0-7] and IIC Bus Interface for DVFS (IIC for DVFS)
> > > devices nodes to the r8a774c0 device tree.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thanks Fabrizo for this patch, it looks good to me with the exception of
> > one minor question I have below.
> >
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 143 ++++++++++++++++++++++++++++++
> > >  1 file changed, 143 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > index 96a71e3..bf08aba 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -271,6 +271,149 @@
> > >  resets = <&cpg 407>;
> > >  };
> > >
> > > +i2c0: i2c@e6500000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe6500000 0 0x40>;
> > > +interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 931>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 931>;
> > > +dmas = <&dmac1 0x91>, <&dmac1 0x90>,
> > > +       <&dmac2 0x91>, <&dmac2 0x90>;
> > > +dma-names = "tx", "rx", "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <110>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c1: i2c@e6508000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe6508000 0 0x40>;
> > > +interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 930>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 930>;
> > > +dmas = <&dmac1 0x93>, <&dmac1 0x92>,
> > > +       <&dmac2 0x93>, <&dmac2 0x92>;
> > > +dma-names = "tx", "rx", "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c2: i2c@e6510000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe6510000 0 0x40>;
> > > +interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 929>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 929>;
> > > +dmas = <&dmac1 0x95>, <&dmac1 0x94>,
> > > +       <&dmac2 0x95>, <&dmac2 0x94>;
> > > +dma-names = "tx", "rx", "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c3: i2c@e66d0000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe66d0000 0 0x40>;
> > > +interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 928>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 928>;
> > > +dmas = <&dmac0 0x97>, <&dmac0 0x96>;
> > > +dma-names = "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <110>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c4: i2c@e66d8000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe66d8000 0 0x40>;
> > > +interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 927>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 927>;
> > > +dmas = <&dmac0 0x99>, <&dmac0 0x98>;
> > > +dma-names = "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c5: i2c@e66e0000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe66e0000 0 0x40>;
> > > +interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 919>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 919>;
> > > +dmas = <&dmac0 0x9b>, <&dmac0 0x9a>;
> > > +dma-names = "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c6: i2c@e66e8000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe66e8000 0 0x40>;
> > > +interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 918>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 918>;
> > > +dmas = <&dmac0 0x9d>, <&dmac0 0x9c>;
> > > +dma-names = "tx", "rx";
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c7: i2c@e6690000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,i2c-r8a774c0",
> > > +     "renesas,rcar-gen3-i2c";
> > > +reg = <0 0xe6690000 0 0x40>;
> > > +interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 1003>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 1003>;
> > > +i2c-scl-internal-delay-ns = <6>;
> > > +status = "disabled";
> > > +};
> > > +
> > > +i2c_dvfs: i2c@e60b0000 {
> > > +#address-cells = <1>;
> > > +#size-cells = <0>;
> > > +compatible = "renesas,iic-r8a774c0";
> > > +reg = <0 0xe60b0000 0 0x15>;
> >
> > My reading of the documentation is that 0x31 would be a more appropriate
> > size for the register window.
> 
> Thank you for looking into this. RZ/G2 documentation about this seems a bit incomplete
> at the moment, and we weren't too sure about what to do here. Our expectation is
> that the IP should be the same as the one found in R-Car E3, and we thought they
> finally wanted to document some previously undocumented registers with the RZ/G2
> User's manual. We are waiting for some answers from Japan, and since the driver
> doesn't support the "new" registers we thought there was no harm in using the same
> memory region used for R-Car E3. I can see the following options:
> * use 0x31 as you recommended
> * keep 0x15 and change it later on to the right figure once the driver actually supports all
> of the documented registers (and maybe updated r8a77990.dtsi as well in case the IP is the
> same?)
> * drop i2c_dvfs from this patch, and send it with a new patch once we get some answers
> from Japan
> 
> What's best option?

If you think 0x15 is correct then lets just use that and follow-up
with a fix if necessary.

I'm now happy with this patch but would like to give others a chance to
review it.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> Thanks,
> Fab
> 
> >
> > > +interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks = <&cpg CPG_MOD 926>;
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 926>;
> > > +dmas = <&dmac0 0x11>, <&dmac0 0x10>;
> > > +dma-names = "tx", "rx";
> > > +status = "disabled";
> > > +};
> > > +
> > >  hscif0: serial@e6540000 {
> > >  compatible = "renesas,hscif-r8a774c0",
> > >       "renesas,rcar-gen3-hscif",
> > > --
> > > 2.7.4
> > >
> 
> 
> [https://www2.renesas.eu/media/email/unicef.jpg]
> 
> This Christmas, instead of sending out cards, Renesas Electronics Europe have decided to support Unicef with a donation. For further details click here<https://www.unicef.org/> to find out about the valuable work they do, helping children all over the world.
> We would like to take this opportunity to wish you a Merry Christmas and a prosperous New Year.
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 

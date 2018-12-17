Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78CFC206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Y/gV2Aap"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732237AbeLQLsi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:48:38 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39145 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbeLQLsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:48:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 33D4D25B7CF;
        Mon, 17 Dec 2018 22:48:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545047312; bh=RGHwHRFwFUdtsiBZ0y44ykhOnGCQeluvGUOFAzzBPCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/gV2Aaphl4fZT5rlC/YEEpIyC+PirtfM99p55Gus8I8Es/6XF3g0cB8Ndl/+w7uG
         EIvwGA15ZleDE/brr/YrYpwjCnww4TWtf6FEhBVDbEGP37FTTVu3lD2Y0P105tJ99W
         9xXQQ3NOfatZya+JgngzAOxcpMjf4DD92wfQ9CJk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A209594048A; Mon, 17 Dec 2018 12:48:30 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:48:30 +0100
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
Subject: Re: [PATCH 07/17] arm64: dts: renesas: r8a774c0: Add audio support
Message-ID: <20181217114830.xnjhmllq6hvnmlyn@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181217102127.x5wn4hhvv3sr3pvt@verge.net.au>
 <TY1PR01MB17704252F657769F8FB8A341C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17704252F657769F8FB8A341C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 11:38:07AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 17 December 2018 10:22
> > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH 07/17] arm64: dts: renesas: r8a774c0: Add audio support
> >
> > On Fri, Dec 14, 2018 at 09:37:30AM +0000, Fabrizio Castro wrote:
> > > Add sound support for the RZ/G2E SoC (a.k.a. R8A774C0).
> > >
> > > This work is based on similar work done on the R8A77990 SoC
> > > by Yoshihiro Kaneko <ykaneko0929@gmail.com>.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 241 ++++++++++++++++++++++++++++++
> > >  1 file changed, 241 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > index 9bd66b1..35b27b8 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > @@ -917,6 +917,247 @@
> > >  status = "disabled";
> > >  };
> > >
> > > +rcar_sound: sound@ec500000 {
> > > +/*
> > > + * #sound-dai-cells is required
> > > + *
> > > + * Single DAI : #sound-dai-cells = <0>;<&rcar_sound>;
> > > + * Multi  DAI : #sound-dai-cells = <1>;<&rcar_sound N>;
> > > + */
> > > +/*
> > > + * #clock-cells is required for audio_clkout0/1/2/3
> > > + *
> > > + * clkout: #clock-cells = <0>;<&rcar_sound>;
> > > + * clkout0/1/2/3: #clock-cells = <1>;<&rcar_sound N>;
> > > + */
> > > +compatible = "renesas,rcar_sound-r8a774c0",
> > > +     "renesas,rcar_sound-gen3";
> > > +reg =<0 0xec500000 0 0x1000>, /* SCU */
> > > +<0 0xec5a0000 0 0x100>,  /* ADG */
> > > +<0 0xec540000 0 0x1000>, /* SSIU */
> > > +<0 0xec541000 0 0x280>,  /* SSI */
> > > +<0 0xec760000 0 0x200>;  /* Audio DMAC peri peri*/
> > > +reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> > > +
> > > +clocks = <&cpg CPG_MOD 1005>,
> > > + <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
> > > + <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
> > > + <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
> > > + <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
> > > + <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
> > > + <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
> > > + <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
> > > + <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
> > > + <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
> > > + <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
> > > + <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> > > + <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> > > + <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> > > + <&audio_clk_a>, <&audio_clk_b>,
> > > + <&audio_clk_c>,
> > > + <&cpg CPG_CORE R8A774C0_CLK_ZA2>;
> > > +clock-names = "ssi-all",
> > > +      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > > +      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > > +      "ssi.1", "ssi.0",
> > > +      "src.9", "src.8", "src.7", "src.6",
> > > +      "src.5", "src.4", "src.3", "src.2",
> > > +      "src.1", "src.0",
> > > +      "mix.1", "mix.0",
> > > +      "ctu.1", "ctu.0",
> > > +      "dvc.0", "dvc.1",
> > > +      "clk_a", "clk_b", "clk_c", "clk_i";
> > > +power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > +resets = <&cpg 1005>,
> > > + <&cpg 1006>, <&cpg 1007>,
> > > + <&cpg 1008>, <&cpg 1009>,
> > > + <&cpg 1010>, <&cpg 1011>,
> > > + <&cpg 1012>, <&cpg 1013>,
> > > + <&cpg 1014>, <&cpg 1015>;
> > > +reset-names = "ssi-all",
> > > +      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > > +      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > > +      "ssi.1", "ssi.0";
> > > +status = "disabled";
> > > +
> > > +rcar_sound,dvc {
> > > +dvc0: dvc-0 {
> > > +dmas = <&audma0 0xbc>;
> > > +dma-names = "tx";
> > > +};
> > > +dvc1: dvc-1 {
> > > +dmas = <&audma0 0xbe>;
> > > +dma-names = "tx";
> > > +};
> > > +};
> > > +
> > > +rcar_sound,mix {
> > > +mix0: mix-0 { };
> > > +mix1: mix-1 { };
> > > +};
> > > +
> > > +rcar_sound,ctu {
> > > +ctu00: ctu-0 { };
> > > +ctu01: ctu-1 { };
> > > +ctu02: ctu-2 { };
> > > +ctu03: ctu-3 { };
> > > +ctu10: ctu-4 { };
> > > +ctu11: ctu-5 { };
> > > +ctu12: ctu-6 { };
> > > +ctu13: ctu-7 { };
> > > +};
> > > +
> > > +rcar_sound,src {
> > > +src0: src-0 {
> > > +interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
> > > +dmas = <&audma0 0x85>, <&audma0 0x9a>;
> > > +dma-names = "rx", "tx";
> > > +};
> >
> > I am a little confused here as the table i48.4 of User's Manual: Hardware
> > v0.61 lists DMAR 0x85 and 0x9a as being unavailable on RZ/G2E. Likewise for
> > other DMARs used below. And likewise for the R-Car E3 but in that case the
> > documentation is corrected by an Errata dated 24th Aug 2018.  Is it safe to
> > assume that the RZ/G2E documentation is in error in this regards?
> 
> Yeah, the current version of chapter 48 was based on top of R-Car Gen 3 manual, version 1.00.
> The new version will be based on version 1.50 of the R-Car Gen3 manual, and therefore they
> should rectify this.

Thanks, in that case looks good to me but I will wait to see if there are
other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

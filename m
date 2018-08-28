Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 28 Aug 2018 14:20:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
Message-ID: <20180828122043.h7vup3e5gamfzejz@verge.net.au>
References: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
 <1535014731-64472-5-git-send-email-biju.das@bp.renesas.com>
 <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
 <TY1PR01MB17707A80E98DE4602177C8EBC0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17707A80E98DE4602177C8EBC0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 24, 2018 at 09:06:49AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
> >
> > On Thu, Aug 23, 2018 at 09:58:50AM +0100, Biju Das wrote:
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > This patch adds the SoC specific part of the Ethernet AVB
> > > device tree node.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 45 +++++++++++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > index 15d7785..b771211 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > @@ -350,6 +350,51 @@
> > >  dma-channels = <16>;
> > >  };
> > >
> > > +avb: ethernet@e6800000 {
> > > +compatible = "renesas,etheravb-r8a774a1",
> > > +     "renesas,etheravb-rcar-gen3";
> > > +reg = <0 0xe6800000 0 0x800>;
> >
> > Should a region, <0 0xe6a00000 0 0x10000>, also be added
> > here to describe the suggested space for descriptors?
> 
> There is no STBE (Stream Buffer for EthernetAVB-IF) on the r8a774a1, and that's why this node doesn't come with such a region.

Thanks for the follow-up. In that case I'm fine with this patch but
I'd like to wait a little longer to allow review by others.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

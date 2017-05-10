Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58349 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdEJM3T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 08:29:19 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
Date: Wed, 10 May 2017 15:29:18 +0300
Message-ID: <8258966.uNlgZS14Hm@avalon>
In-Reply-To: <CAMuHMdUv6L4-=WSSrOQGoV0wh8tSXurx1hfwP7-38csvwMz6yQ@mail.gmail.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com> <20170510070458.21193-5-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUv6L4-=WSSrOQGoV0wh8tSXurx1hfwP7-38csvwMz6yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 10 May 2017 10:57:04 Geert Uytterhoeven wrote:
> On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart wrote:
> > The DU1 and DU2 external dot clocks are fixed frequency clock generators
> > running at 33MHz.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm64/boot/dts/renesas/salvator-x.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > b/arch/arm64/boot/dts/renesas/salvator-x.dtsi index
> > 2cd0cce818e7..884c63ebba69 100644
> > --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > @@ -212,6 +212,19 @@
> > 
> >                 #clock-cells = <0>;
> >                 clock-frequency = <24576000>;
> >         
> >         };
> > 
> > +
> > +       /* External DU dot clocks */
> > +       x21_clk: x21-clock {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               clock-frequency = <33000000>;
> > +       };
> > +
> > +       x22_clk: x22-clock {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               clock-frequency = <33000000>;
> > +       };
> > 
> >  };
> >  
> >  &audio_clk_a {
> > 
> > @@ -238,6 +251,16 @@
> > 
> >         pinctrl-names = "default";
> >         status = "okay";
> > 
> > +       clocks = <&cpg CPG_MOD 724>,
> > +                <&cpg CPG_MOD 723>,
> > +                <&cpg CPG_MOD 722>,
> > +                <&cpg CPG_MOD 721>,
> > +                <&cpg CPG_MOD 727>,
> > +                <&x21_clk>,
> > +                <&x22_clk>;
> > +       clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
> > +                     "dclkin.1", "dclkin.2";
> 
> Another H3 vs. M3-W oddity: DU_DOTCLKIN2 is wired to pin AR7 on H3 SiP,
> and AR8 on M3-W SiP.
> But crystal X22 is wired to AR7, and AR8 is not connected.
> Hence on M3-W, "dclkin.2" is not available, cfr. "NC <M3SiP>" in the
> schematics.

Indeed :-/ X22 is populated though. No wonder the board is expensive :-)

> So either the du clocks and -names should be overridden in
> r8a7795-salvator.dtsi to add "dclkin.2", or in r8a7796-salvator.dtsi to
> remove it.

Or specified differently in both. I'll do that, it would be confusing 
otherwise.

-- 
Regards,

Laurent Pinchart

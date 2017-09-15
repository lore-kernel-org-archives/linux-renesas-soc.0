Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 15 Sep 2017 09:35:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: draak: enable
 EthernetAVB
Message-ID: <20170915073501.GD3924@verge.net.au>
References: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1505305119-4257-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX3q=foc1hkcqTc3WQYxCh1x+bc8fu9+YcqVAx9bp4qaA@mail.gmail.com>
 <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0992906ACD39FA3D176CDFE6D86E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 11:58:47PM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > From: Geert Uytterhoeven
> > Sent: Wednesday, September 13, 2017 11:55 PM
> > 
> > Hi Shimoda-san,
> > 
> > On Wed, Sep 13, 2017 at 2:18 PM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > This patch enables EthernetAVB for R-Car D3 draak board.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > 
> > > @@ -37,6 +39,14 @@
> > >  };
> > >
> > >  &pfc {
> > > +       avb0_pins: avb {
> > > +               mux {
> > > +                       groups = "avb0_link", "avb0_phy_int", "avb0_mdc",
> > > +                                "avb0_mii";
> > > +                       function = "avb0";
> > 
> > This part depends on (an updated version of) "[PATCH 5/8] pinctrl: sh-pfc:
> > r8a77995: Add EthernetAVB pins, groups and functions", so it may change?
> 
> Oops, I fotgot to submit v2 PFC patch yesterday...
> Yes, it is changed like other gen3 SoCs. I submitted it now. 
> 
> > And we will probably have to add driver-strengths later, to avoid a
> > dependency on bootloader setup?
> 
> Yes, I will do so, if needed.
> 
> > Apart from that:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thank you for your review!

Thanks. I have marked this as "Deferred" pending acceptance of the PFC
patch. Please repost or ping me, f.e. via a reply-to-all to this email,
once that dependency is resolved.

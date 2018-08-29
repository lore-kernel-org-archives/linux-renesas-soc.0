Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbeH2NIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 09:08:15 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: vsps and channel indices (was: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a77980: add FCPVD/VSPD/DU/LVDS support)
Date: Wed, 29 Aug 2018 12:12:19 +0300
Message-ID: <1722619.RLsez26Y98@avalon>
In-Reply-To: <CAMuHMdVqGBo4uXtzNeLyD4f3CKeQzmgdJNs4N2ZB7MDosU+t4w@mail.gmail.com>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com> <1611fe94-07dd-fc8b-e94f-143e1ed26a17@cogentembedded.com> <CAMuHMdVqGBo4uXtzNeLyD4f3CKeQzmgdJNs4N2ZB7MDosU+t4w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 28 August 2018 15:10:52 EEST Geert Uytterhoeven wrote:
> Hi Sergei, Laurent, Kieran,
> 
> On Wed, Jun 13, 2018 at 10:11 PM Sergei Shtylyov wrote:
> > Describe the interconnected FCPVD0, VSPD0, DU, and LVDS0 devices in the
> > R8A77980 device tree...
> > 
> > Based on the original (and large) patch by Vladimir Barinov.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > 
> > +               du: display@feb00000 {
> > +                       compatible = "renesas,du-r8a77980",
> > +                                    "renesas,du-r8a77970";
> > +                       reg = <0 0xfeb00000 0 0x80000>;
> > +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 724>;
> > +                       clock-names = "du.0";
> > +                       power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 724>;
> > +                       vsps = <&vspd0>;
> 
> According to the bindings, the vsps property should also contain a
> channel index.
> 
> Laurent added the indices to r8a7795.dtsi, but r8a7795-es.dtsi overrides
> that with a version without the indices.
> Kieran included the indices when adding DU support for r8a77965 and
> r8a77995.
> 
> r8a7796.dtsi, r8a77970.dtsi, and r8a77980.dtsi lack the indices.
> 
> Commit fd57d77f9c649cf9 ("dt-bindings: display: rcar-du: Add a VSP channel
> index to the vsps DT property") says a backwards-compatibility mode can be
> implemented, but I fail to see how this can work, as rcar_du_vsps_init()
> will just return an error, which is propagated.
> 
> What am I missing?

We're missing a DT validator :-/

The vsps property shoould indeed contain indices. However, rcar_du_vsps_init() 
implements a backward-compatibility mode by checking the length of the 
property:

	cells = of_property_count_u32_elems(np, "vsps") / rcdu->num_crtcs - 1;

and using that as an argument to of_parse_phandle_with_fixed_args().

-- 
Regards,

Laurent Pinchart

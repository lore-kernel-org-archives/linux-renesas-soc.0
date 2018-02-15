Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47985 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966662AbeBOL3l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 06:29:41 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 06/12] ARM: dts: r8a7790: Convert to new LVDS DT bindings
Date: Thu, 15 Feb 2018 13:30:15 +0200
Message-ID: <2226345.KzEyxdNEYr@avalon>
In-Reply-To: <CAMuHMdWvFe1oHnTG9fTN46jOEbns_QS1Ff1BTyw1BFwLjVkAQQ@mail.gmail.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com> <20180215000415.19077-7-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWvFe1oHnTG9fTN46jOEbns_QS1Ff1BTyw1BFwLjVkAQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday, 15 February 2018 11:20:22 EET Geert Uytterhoeven wrote:
> On Thu, Feb 15, 2018 at 1:04 AM, Laurent Pinchart wrote:
> > The internal LVDS encoder now has DT bindings separate from the DU. Port
> > the device tree over to the new model.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > --- a/arch/arm/boot/dts/r8a7790.dtsi
> > +++ b/arch/arm/boot/dts/r8a7790.dtsi
> > @@ -1067,17 +1067,13 @@
> > 
> > @@ -1092,11 +1088,61 @@
> >                         port@1 {
> >                                 reg = <1>;
> >                                 du_out_lvds0: endpoint {
> > +                                       remote-endpoint = <&lvds0_in>;
> >                                 };
> >                         };
> >                         port@2 {
> >                                 reg = <2>;
> >                                 du_out_lvds1: endpoint {
> > +                                       remote-endpoint = <&lvds1_in>;
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> > +       lvds0: lvds@feb90000 {
> > +               compatible = "renesas,r8a7790-lvds";
> > +               reg = <0 0xfeb90000 0 0x1c>;
> > +               clocks = <&cpg CPG_MOD 726>;
> > +               status = "disabled";
> 
> Missing resets, power-domains (for all lvds nodes in all DTS patches).

Will be fixed in v4.

-- 
Regards,

Laurent Pinchart

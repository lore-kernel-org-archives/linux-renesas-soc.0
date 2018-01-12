Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35365 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933478AbeALNg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 08:36:56 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Fri, 12 Jan 2018 15:36:55 +0200
Message-ID: <24461573.LqbDqcKzYR@avalon>
In-Reply-To: <CAMuHMdWMgst-1evod+0hZujU2xPtO3UmO9c2CPPrTg=gpHpTbw@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWMgst-1evod+0hZujU2xPtO3UmO9c2CPPrTg=gpHpTbw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday, 12 January 2018 11:45:56 EET Geert Uytterhoeven wrote:
> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> > corresponding device tree bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -0,0 +1,54 @@
> > +Renesas R-Car LVDS Encoder
> > +==========================
> > +
> > +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> > Gen2 +and Gen3 SoCs.
> > +
> > +Required properties:
> > +
> > +- compatible : Shall contain one of
> > +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7790" for R8A7790 (R-Car H2) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7791" for R8A7791 (R-Car M2-W) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7793" for R8A7791 (R-Car M2-N) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7795" for R8A7795 (R-Car H3) compatible LVDS
> > encoders
> > +  - "renesas,lvds-r8a7796" for R8A7796 (R-Car M3-W) compatible LVDS
> > encoders
> > +
> > +- reg: Base address and length for the memory-mapped registers
> > +- clocks: A phandle + clock-specifier pair for the functional clock
> 
> Please document the "resets" property, too, and add it to the example.
> According to the rcar-3.6.0 BSP, reset support is needed desperately.

Good point. I'll make it mandatory in the new bindings but treat it as 
optional in the driver as the live DT patching doesn't create the reset 
properties.

-- 
Regards,

Laurent Pinchart

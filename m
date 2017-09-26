Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54623 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbdIZMjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 08:39:21 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC 02/13] dt-bindings: media: renesas-fcp: Add a compatible string for VSPI FCP
Date: Tue, 26 Sep 2017 15:39:19 +0300
Message-ID: <1739039.foeTIo5Y36@avalon>
In-Reply-To: <CAMuHMdW9a96_0KpFZXErgBwQOGMAOuMjp8=YCUcwVbLhWVs3ZQ@mail.gmail.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com> <20170926100605.2313-5-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdW9a96_0KpFZXErgBwQOGMAOuMjp8=YCUcwVbLhWVs3ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 26 September 2017 14:47:35 EEST Geert Uytterhoeven wrote:
> On Tue, Sep 26, 2017 at 12:05 PM, Laurent Pinchart wrote:
> > The FCP instances associated with a VSPI must be treated differently
> > than the ones associated with another type of VSP. Add a new compatible
> > string to allow telling them apart.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> > b/Documentation/devicetree/bindings/media/renesas,fcp.txt index
> > 3ec91803ba58..c1f28736e2d6 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> > +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> > @@ -11,7 +11,8 @@ are paired with. These DT bindings currently support the
> > FCPV and FCPF.> 
> >   - compatible: Must be one or more of the following
> > 
> > -   - "renesas,fcpv" for generic compatible 'FCP for VSP'
> > +   - "renesas,fcpvi" for generic compatible 'FCP for VSPI'
> > +   - "renesas,fcpv" for generic compatible 'FCP for VSP' (all other VSPs)
> > 
> >     - "renesas,fcpf" for generic compatible 'FCP for FDP'
> 
> You may want to update the paragraph before that, referring to three types
> of FCP.

As far as I know the FCP-VSPI and FCP-VSP[^I] are the same type of device, 
with different SoC integration.

> It seems there's also a similar split for FCPC? So that makes (at
> least) 5 types.

There's little documentation on the FCPC unfortunately, so I'm not sure how we 
should handle it.

> Just wondering: as FCPVI vs. FCPV is programmable through the FCPVSEL
> bit, can you deduce the type using the renesas,fcp link in the corresponding
> VSP node in DT?

You could possibly, if you had a link from the FCP to the VSP in DT. As 
there's none, the type can't be currently inferred from DT at probe time. We 
could pass the type from the VSP driver to the FCP driver, but I'm not sure I 
want to go that way. If the FCP-VSPI and VSP[^I] are identicaly and need 
different software configuration due to being used by different types of VSPs 
it would make sense, but if there are hardware differences between the FCPs 
then I think they should be described in DT.

-- 
Regards,

Laurent Pinchart

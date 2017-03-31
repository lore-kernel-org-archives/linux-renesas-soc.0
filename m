Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42866 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753586AbdCaJSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 05:18:30 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
Date: Fri, 31 Mar 2017 12:19:12 +0300
Message-ID: <8105647.ANSr0hWnZy@avalon>
In-Reply-To: <CAMuHMdUiDzGt6bz96D-5yRLF-HiZfpQTTxKP5Y4+j-9HiF1LLQ@mail.gmail.com>
References: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUiDzGt6bz96D-5yRLF-HiZfpQTTxKP5Y4+j-9HiF1LLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 27 Mar 2017 13:05:48 Geert Uytterhoeven wrote:
> On Mon, Mar 27, 2017 at 11:56 AM, Laurent Pinchart wrote:
> > The property is used by the driver but is missing from the DT bindings.
> > Document it.
> > 
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> > b/Documentation/devicetree/bindings/display/renesas,du.txt index
> > 1a02f099a0ff..cf34893a1b53 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > 
> > @@ -36,6 +36,11 @@ Required Properties:
> >        When supplied they must be named "dclkin.x" with "x" being the
> >        input
> >        clock numerical index.
> > 
> > +Optional Properties:
> > +
> > +  - vsps: A list of phandles to the VSP nodes that handle the memory
> > +    interfaces for the DU channels (Gen3 only).
> 
> ", one per channel"?
> 
> Required for Gen3, optional for Gen2? (cfr. Sergei's patches).

How about making it mandatory on Gen2 as well ? The VSPs are there, even if 
the driver doesn't use them, it makes sense to describe the connection. Of 
course the driver will treat the property as optional for backward 
compatibility.

-- 
Regards,

Laurent Pinchart

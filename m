Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49681 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754555AbdDEIXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 04:23:41 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
Date: Wed, 05 Apr 2017 11:24:25 +0300
Message-ID: <1734428.mRCzHVCrKW@avalon>
In-Reply-To: <CAMuHMdWYq-w9T4chEh4Hg0+9_MCb+bivD3sgHeCoMPe61=czjg@mail.gmail.com>
References: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdWSuz79mdHLuT4jDQsNvecFck21aBNLOrs5JHmMXnyTCQ@mail.gmail.com> <CAMuHMdWYq-w9T4chEh4Hg0+9_MCb+bivD3sgHeCoMPe61=czjg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 05 Apr 2017 09:54:38 Geert Uytterhoeven wrote:
> On Fri, Mar 31, 2017 at 11:21 AM, Geert Uytterhoeven wrote:
> > On Fri, Mar 31, 2017 at 11:19 AM, Laurent Pinchart wrote:
> >> On Monday 27 Mar 2017 13:05:48 Geert Uytterhoeven wrote:
> >>> On Mon, Mar 27, 2017 at 11:56 AM, Laurent Pinchart wrote:
> >>>> The property is used by the driver but is missing from the DT
> >>>> bindings. Document it.
> >>>> 
> >>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>>> Signed-off-by: Laurent Pinchart
> >>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>> ---
> >>>> 
> >>>>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>> 
> >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> >>>> 1a02f099a0ff..cf34893a1b53 100644
> >>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >>>> 
> >>>> @@ -36,6 +36,11 @@ Required Properties:
> >>>>        When supplied they must be named "dclkin.x" with "x" being the
> >>>>        input clock numerical index.
> >>> > 
> >>> > +Optional Properties:
> >>> > +
> >>> > +  - vsps: A list of phandles to the VSP nodes that handle the memory
> >>> > +    interfaces for the DU channels (Gen3 only).
> >>> 
> >>> ", one per channel"?
> >>> 
> >>> Required for Gen3, optional for Gen2? (cfr. Sergei's patches).
> >> 
> >> How about making it mandatory on Gen2 as well ? The VSPs are there, even
> >> if the driver doesn't use them, it makes sense to describe the
> >> connection. Of
> > 
> > Fine for me, as this is hardware description.
> > 
> >> course the driver will treat the property as optional for backward
> >> compatibility.
> > 
> > OK.
> 
> Will you do this as an incremental update?
> I noticed the initial version is now in drm-next.

I've included it in the pull request by mistake and realized that too late, 
sorry :-/ I will send an incremental update.

-- 
Regards,

Laurent Pinchart

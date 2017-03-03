Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42955 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdCCTT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 14:19:29 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Fri, 03 Mar 2017 21:17:58 +0200
Message-ID: <5304812.zzcGWdqkpi@avalon>
In-Reply-To: <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be> <2423895.QcDWT1fsiC@avalon> <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 03 Mar 2017 20:03:09 Geert Uytterhoeven wrote:
> On Fri, Mar 3, 2017 at 3:41 PM, Laurent Pinchart wrote:
> > On Friday 03 Mar 2017 14:30:35 Geert Uytterhoeven wrote:
> >> Document the optional properties for describing module resets, to
> >> support resetting display channels and LVDS encoders on R-Car Gen2 and
> >> Gen3.
> >> 
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> 
> >>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
> >> b/Documentation/devicetree/bindings/display/renesas,du.txt index
> >> 1a02f099a0ff0a3a..7873d53764a297c2 100644
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> 
> >> @@ -36,6 +36,16 @@ Required Properties:
> >>        When supplied they must be named "dclkin.x" with "x" being the
> >>        input clock numerical index.
> >> 
> >> +Optional properties:
> >> +  - resets: A list of phandles + reset-specifier pairs, one for each
> >> entry in
> > 
> > s/phandlers/phandle/
> 
> You're seeing typos that do not exist ;-)
> 
> >> +    the reset-names property.
> > 
> > What's in the reset specifier ?
> 
> That depends on the reset provider.
> 
> See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
> support" (https://patchwork.kernel.org/patch/9536627/) for the Renesas
> CPG/MSSR case.
> 
> E.g. "resets = <&cpg 310>;"

Thanks. I never know whether the specified is the combination of phandle + 
data, or is only the cells following the phandle.

-- 
Regards,

Laurent Pinchart

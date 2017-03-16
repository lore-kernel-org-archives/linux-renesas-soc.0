Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36700 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753007AbdCPVDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 17:03:48 -0400
Date: Thu, 16 Mar 2017 15:56:39 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset
 properties
Message-ID: <20170316205639.xufbtbnqgy72bwyc@rob-hp-laptop>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be>
 <20170315170112.mnhgntbjreheavua@rob-hp-laptop>
 <CAMuHMdUt_d-kp57v2A18tuf-QQcOXnZ6wBtU9pqAyGJRZ2m3TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUt_d-kp57v2A18tuf-QQcOXnZ6wBtU9pqAyGJRZ2m3TQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 16, 2017 at 09:13:16AM +0100, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Wed, Mar 15, 2017 at 6:01 PM, Rob Herring <robh@kernel.org> wrote:
> > On Mon, Mar 06, 2017 at 05:25:56PM +0100, Geert Uytterhoeven wrote:
> >> Document the optional properties for describing module resets, to
> >> support resetting display channels and LVDS encoders on R-Car Gen2 and
> >> Gen3.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
> >> support" (https://patchwork.kernel.org/patch/9536627/) for the format of
> >> a reset specifier in the Renesas CPG/MSSR case.
> >>
> >> E.g. "resets = <&cpg 310>;"
> >>
> >> v2:
> >>   - s/phandles/phandle/.
> >> ---
> >>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> index 1a02f099a0ff0a3a..3db418c827193e82 100644
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> >> @@ -36,6 +36,16 @@ Required Properties:
> >>        When supplied they must be named "dclkin.x" with "x" being the input
> >>        clock numerical index.
> >>
> >> +Optional properties:
> >> +  - resets: A list of phandle + reset-specifier pairs, one for each entry in
> >> +    the reset-names property.
> >> +  - reset-names: Names of the resets. This property is model-dependent.
> >> +    - R8A779[0123456] use one reset for a group of one or more successive
> >> +      channels, and one reset per LVDS encoder (if available). The resets
> >> +      must be named "du.x" with "x" being the numerical index of the lowest
> >> +      channel in the group. The LVDS resets must be named "lvds.x" with "x"
> >> +      being the LVDS encoder numerical index.
> >
> > LVDS is not a separate block?
> 
> Well... from a hardware point of view, the LVDS encoders and DU channels
> are all separate blocks (they have separate reg blocks, clocks, and resets).
> But due to the dependencies between the blocks, they're modeled in DT as
> a single device, with multiple reg, clocks, and resets properties.

Dependencies being DRM requirement of wanting a single device with 
sub-devices or some h/w dependencies? The former shouldn't define your 
binding.

Rob

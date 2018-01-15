Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Mon, 15 Jan 2018 21:22:08 +0200
Message-ID: <1891263.xKRehmHzfM@avalon>
In-Reply-To: <fd59ff16-f29f-1b10-aa2a-347c6c905689@gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <CAL_JsqK9yWE2nLX3AbSx-U6zAyE3fkYnURBY+r6KkJCogU5_sA@mail.gmail.com> <fd59ff16-f29f-1b10-aa2a-347c6c905689@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Frank,

On Monday, 15 January 2018 21:12:44 EET Frank Rowand wrote:
> On 01/15/18 09:09, Rob Herring wrote:
> > +Frank
> > 
> > On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
> >> The internal LVDS encoders now have their own DT bindings. Before
> >> switching the driver infrastructure to those new bindings, implement
> >> backward-compatibility through live DT patching.
> > 
> > Uhh, we just got rid of TI's patching and now adding this one. I guess
> 
> Please no.  What we just got rid of was making it difficult for me to
> make changes to the overlay infrastructure.  There are issues with
> overlays that need to be fixed before overlays become really usable.
> I am about to propose the next change, which involves removing a
> chunk of code that I will not be able to remove if this patch is
> accepted (the proposal is awaiting me collecting some data about
> the impact of the change, which I expect to complete this week).
> 
> Can you please handle both the old and new bindings through driver
> code instead?

I could, but it would be pointless. The point here is to allow cleanups in the 
driver. The LVDS encoder handling code is very intrusive in its current form 
and I need to get rid of it. There would be zero point in moving to the new 
infrastructure, as the main point is to get rid of the old code which prevents 
moving forward. As a consequence that would block new boards from receiving 
proper upstream support. An easy option is to break backward compatibility. 
I'm personally fine with that, but I assume other people would complain :-)

I can, on the other hand, work with you to see how live DT patching could be 
implemented in this driver without blocking your code. When developing this 
patch series I start by patching the device tree manually without relying on 
overlays at all, but got blocked by the fact that I need to allocate phandles 
for new nodes I create. If there was an API to allocate an unused phandle I 
could avoid using the overlay infrastructure at all. Or there could be other 
options I'm not thinking of as I don't know what the changes you're working on 
are. Can we work on this together to find a solution that would suit us both ?

> > it's necessary, but I'd like to know how long we need to keep this?
> > 
> > How many overlays would you need if everything is static (i.e.
> > removing all your fixup code)?
> > 
> >> Patching is disabled and will be enabled along with support for the new
> >> DT bindings in the DU driver.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> >> ---
> >> Changes since v1:
> >> 
> >> - Select OF_FLATTREE
> >> - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> >> - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> >> - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> >> - Pass void begin and end pointers to rcar_du_of_get_overlay()
> >> - Use of_get_parent() instead of accessing the parent pointer directly
> >> - Find the LVDS endpoints nodes based on the LVDS node instead of the
> >>   root of the overlay
> >> - Update to the <soc>-lvds compatible string format
> >> ---
> >> 
> >>  drivers/gpu/drm/rcar-du/Kconfig             |   2 +
> >>  drivers/gpu/drm/rcar-du/Makefile            |   3 +-
> >>  drivers/gpu/drm/rcar-du/rcar_du_of.c        | 451 ++++++++++++++++++++++
> >>  drivers/gpu/drm/rcar-du/rcar_du_of.h        |  16 +
> >>  drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts |  82 +++++
> >>  5 files changed, 553 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts

[snip]

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33412 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750830AbeAPKXa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 05:23:30 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Frank Rowand <frowand.list@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Tue, 16 Jan 2018 12:23:33 +0200
Message-ID: <3577821.t9hx4zKZqv@avalon>
In-Reply-To: <CAMuHMdUNcKOod1KCAGSBeMr52PWKqkJo0AWmSNk76t0=Zvu0gA@mail.gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <1905364.eR590Hd45s@avalon> <CAMuHMdUNcKOod1KCAGSBeMr52PWKqkJo0AWmSNk76t0=Zvu0gA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 16 January 2018 10:56:10 EET Geert Uytterhoeven wrote:
> On Mon, Jan 15, 2018 at 7:01 PM, Laurent Pinchart wrote:
> > On Monday, 15 January 2018 19:09:53 EET Rob Herring wrote:
> >> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
> >>> The internal LVDS encoders now have their own DT bindings. Before
> >>> switching the driver infrastructure to those new bindings, implement
> >>> backward-compatibility through live DT patching.
> >> 
> >> Uhh, we just got rid of TI's patching and now adding this one. I guess
> >> it's necessary, but I'd like to know how long we need to keep this?
> > 
> > That's a good question. How long are we supposed to keep DT backward
> > compatibility for ? I don't think there's a one-size-fits-them-all answer
> > to this question. Geert, any opinion ? How long do you plan to keep the
> > CPG (clocks) DT backward compatibility for instance ?
> 
> Good question indeed...
> 
> It's not just CPG/MSSR. Over the years we also added or changed APMU (SMP),
> SYSC (power domains), RST (mode pins), CMT (timers), ..., all of which have
> some sort of compatibility support in the kernel.
> 
> Hence to avoid having to remember the kernel versions that dropped backwards
> compatibility for each of the above components, I was thinking about an
> R-Car Gen2 DT Flag Day.
> 
> However, that was before I learned about your plans for LVDS (it seems every
> kernel release we learn about something new, postponing the flag day ;-).
> And now I'm quite sure we'll have another change in the future (DU per
> channel device nodes)...

I don't think the DU and LVDS rework should postpone your flag day for all the 
core components.

> About using DT fixups to implement backwards compatibility: I did my share
> of thinking and experimenting with DT fixups (see e.g. "[PATCH/RFC 0/1]
> soc: renesas: Add DT fixup code for backwards compatibility"
> (https://www.spinics.net/lists/linux-renesas-soc/msg04305.html).
> DT fixups are hard to implement right, and not everything can be done
> that way.  Hence in the end, none of this was ever used upstream, and
> everything was handled in C...
> 
> So I'm wondering if it would be easier if you would implement backwards
> compatibility in C, using different compatible values for the new bindings?
> I.e. switch from "renesas,du-r8a77*" to "renesas,r8a77*-du" +
> "renesas,r8a77*-lvds"?
> That way it also becomes very clear that there are old and new bindings,
> and that there is backwards compatibility code for the old binding.

Quoting my reply to Frank,

I could, but it would be pointless. The point here is to allow cleanups in the 
driver. The LVDS encoder handling code is very intrusive in its current form 
and I need to get rid of it. There would be zero point in moving to the new 
infrastructure, as the main point is to get rid of the old code which prevents 
moving forward. As a consequence that would block new boards from receiving 
proper upstream support. An easy option is to break backward compatibility. 
I'm personally fine with that, but I assume other people would complain :-)

> I know you're aware (the rest of the audience may not be) that the LVDS
> part is not the only separate hardware block current unified in the single
> DU node: each DU channel has its own hardware block.  Perhaps you can also
> bite the bullet and have a single device node per DT channel, allowing
> Runtime PM for DU channels?

That's more difficult as the channels have cross-dependencies. I might give it 
a try at some point, or I might not. In any case it's a separate piece of 
work, and backward compatibility for that one might be handled in the driver 
instead of through DT patching.

> Of course you have to tie channels together using a "companion" (cfr. USB)
> or "renesas,bonding" (cfr. DRIF) property (unfortunately I learned about
> the former only after the latter was already established).
> 
> Finally, implementing backwards compatibility support by DT fixup using
> overlays may complicate backporting to LTSI kernels, due to the dependency
> on DT overlays, which were reworked lately.

I can drop backward compatibility completely if you prefer, that would be much 
easier to backport ;-)

As discussed with Frank I will likely try to patch the DT live without using 
overlays, but that will likely also be annoying to backport as the ongoing 
modifications to the OF core are not limited to overlays anyway.

> >>> --- a/drivers/gpu/drm/rcar-du/Kconfig
> >>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> >>> @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
> >>>         bool "R-Car DU LVDS Encoder Support"
> >>>         depends on DRM_RCAR_DU
> >>>         select DRM_PANEL
> >>> +       select OF_FLATTREE
> >>> +       select OF_OVERLAY
> >> 
> >> OF_OVERLAY should probably select OF_FLATTREE. I guess in theory, we
> >> could have an overlay from a non-FDT source...
> 
> Currently the select is needed for of_fdt_unflatten_tree() only, which is
> not used by the core OF_OVERLAY code. So you could build an overlay in
> memory yourself, and pass that, without using of_fdt_unflatten_tree().
> But that is going to change if I read Frank's reponse well?

-- 
Regards,

Laurent Pinchart

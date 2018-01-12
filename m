Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35984 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933544AbeALNx2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 08:53:28 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 03/10] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Fri, 12 Jan 2018 15:53:27 +0200
Message-ID: <1675787.pl840eVHyY@avalon>
In-Reply-To: <CAMuHMdW5wDj5gyTnh+Xa3J10b_6For0MdhcTFgdU_+sgx=BYmA@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-4-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdW5wDj5gyTnh+Xa3J10b_6For0MdhcTFgdU_+sgx=BYmA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday, 12 January 2018 12:09:45 EET Geert Uytterhoeven wrote:
> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings. Before
> > switching the driver infrastructure to those new bindings, implement
> > backward-compatibility through live DT patching.
> > 
> > Patching is disabled and will be enabled along with support for the new
> > DT bindings in the DU driver.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -22,6 +22,7 @@ config DRM_RCAR_LVDS
> >         bool "R-Car DU LVDS Encoder Support"
> >         depends on DRM_RCAR_DU
> >         select DRM_PANEL
> > +       select OF_OVERLAY
> 
> select OF_FLATTREE for of_fdt_unflatten_tree()

I'll fix that.

> (you can probably check with sparc all*config)

I'd have to install a sparc cross-compiler :-)

> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > @@ -0,0 +1,440 @@

[snip]

> > +static void __init rcar_du_of_lvds_patch_one(struct device_node *du,
> > +                                            unsigned int port_id,
> > +                                            const struct resource *res,
> > +                                            const __be32 *reg,
> > +                                            const struct of_phandle_args
> > *clkspec,
> > +                                            struct device_node *local,
> > +                                            struct device_node *remote)
> > +{
> > 
> > +
> > +       /* Skip if the LVDS node already exists. */
> > +       sprintf(name, "lvds@%llx", (u64)res->start);
> 
> I guess you cannot use %pa because you don't want a 0x prefix?

Correct.

> > +       /*
> > +        * Patch the LVDS and DU port nodes names and the associated fixup
> > +        * entries.
> > +        */
> > +       lvds = rcar_du_of_find_node_by_path(overlay.np,
> > +               "/fragment@0/__overlay__/lvds");
> > +       lvds_endpoints[0] = rcar_du_of_find_node_by_path(overlay.np,
> > +               "/fragment@0/__overlay__/lvds/ports/port@0/endpoint");
> > +       lvds_endpoints[1] = rcar_du_of_find_node_by_path(overlay.np,
> > +               "/fragment@0/__overlay__/lvds/ports/port@1/endpoint");
> > +       du_port = rcar_du_of_find_node_by_path(overlay.np,
> > +               "/fragment@1/__overlay__/ports/port@0");
> > +       du_port_fixup = rcar_du_of_find_node_by_path(overlay.np,
> > +               "/__local_fixups__/fragment@1/__overlay__/ports/port@0");
> 
> Many strings with similar prefixes or substrings?
> Would it make sense to e.g. locate "/fragment@0/__overlay__/lvds/ports"
> first, and continue from there?

I can do that for the first three, yes.

-- 
Regards,

Laurent Pinchart

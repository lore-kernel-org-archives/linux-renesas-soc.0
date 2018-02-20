Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57832 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbeBTJPP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 04:15:15 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Tue, 20 Feb 2018 11:15:53 +0200
Message-ID: <3866023.VvEQmjTL1d@avalon>
In-Reply-To: <CAL_JsqJMwHQoht0Jj_UCVWgrW=1dU5egWrTeSVfFrKGfqMm9+g@mail.gmail.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com> <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com> <CAL_JsqJMwHQoht0Jj_UCVWgrW=1dU5egWrTeSVfFrKGfqMm9+g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Tuesday, 20 February 2018 02:54:00 EET Rob Herring wrote:
> On Wed, Feb 14, 2018 at 6:04 PM, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings. Before
> > switching the driver infrastructure to those new bindings, implement
> > backward-compatibility through live DT patching.
> > 
> > Patching is disabled and will be enabled along with support for the new
> > DT bindings in the DU driver.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Update the SPDX headers to use C-style comments in header files
> > - Removed the manually created __local_fixups__ node
> > - Perform manual fixups on live DT instead of overlay
> 
> Generally looks fine to me. A few things below.
> 
> > Changes since v1:
> > 
> > - Select OF_FLATTREE
> > - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> > - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> > - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> > - Pass void begin and end pointers to rcar_du_of_get_overlay()
> > - Use of_get_parent() instead of accessing the parent pointer directly
> > - Find the LVDS endpoints nodes based on the LVDS node instead of the
> > 
> >   root of the overlay
> > 
> > - Update to the <soc>-lvds compatible string format
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
> >  drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_of.c               | 374
> >  +++++++++++++++++++++ drivers/gpu/drm/rcar-du/rcar_du_of.h              
> >  |  20 ++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  81 +++++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  55 +++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  55 +++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  55 +++
> >  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  55 +++
> >  9 files changed, 703 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > b/drivers/gpu/drm/rcar-du/Kconfig index 5d0b4b7119af..3f83352a7313 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
> > 
> >         bool "R-Car DU LVDS Encoder Support"
> >         depends on DRM_RCAR_DU
> >         select DRM_PANEL
> > 
> > +       select OF_FLATTREE
> > +       select OF_OVERLAY
> > 
> >         help
> >         
> >           Enable support for the R-Car Display Unit embedded LVDS
> >           encoders.
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > b/drivers/gpu/drm/rcar-du/Makefile index 0cf5c11030e8..86b337b4be5d
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -8,7 +8,12 @@ rcar-du-drm-y := rcar_du_crtc.o \
> > 
> >                  rcar_du_plane.o
> >  
> >  rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    += rcar_du_lvdsenc.o
> > 
> > -
> > +rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)    += rcar_du_of.o \
> > +                                          rcar_du_of_lvds_r8a7790.dtb.o \
> > +                                          rcar_du_of_lvds_r8a7791.dtb.o \
> > +                                          rcar_du_of_lvds_r8a7793.dtb.o \
> > +                                          rcar_du_of_lvds_r8a7795.dtb.o \
> > +                                          rcar_du_of_lvds_r8a7796.dtb.o
> > 
> >  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)     += rcar_du_vsp.o
> >  
> >  obj-$(CONFIG_DRM_RCAR_DU)              += rcar-du-drm.o
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_of.c new file mode 100644
> > index 000000000000..141f6eda6e98
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c

[snip]

> > +static struct device_node __init *
> > +rcar_du_of_find_node_by_path(struct device_node *parent, const char
> > *path)
> > +{
> 
> I guess I never followed up on the last version. I think a wrapper
> around __of_find_node_by_path would work for you here. It can start at
> any level. Though maybe it is not needed. See below.

You're right, I won't need this function anymore, so I'll drop it. I think 
looking up a node by path starting at a given parent would still be useful, 
but there's no need to add a function without a user.

> > +       parent = of_node_get(parent);
> > +       if (!parent)
> > +               return NULL;
> > +
> > +       while (parent && *path == '/') {
> > +               struct device_node *child = NULL;
> > +               struct device_node *node;
> > +               const char *next;
> > +               size_t len;
> > +
> > +               /* Skip the initial '/' delimiter and find the next one.
> > */
> > +               path++;
> > +               next = strchrnul(path, '/');
> > +               len = next - path;
> > +               if (!len)
> > +                       goto error;
> > +
> > +               for_each_child_of_node(parent, node) {
> > +                       const char *name = kbasename(node->full_name);
> > +
> > +                       if (strncmp(path, name, len) == 0 &&
> > +                           strlen(name) == len) {
> > +                               child = node;
> > +                               break;
> > +                       }
> > +               }
> > +
> > +               if (!child)
> > +                       goto error;
> > +
> > +               of_node_put(parent);
> > +               parent = child;
> > +               path = next;
> > +       }
> > +
> > +       return parent;
> > +
> > +error:
> > +       of_node_put(parent);
> > +       return NULL;
> > +}
> > +
> > +static int __init rcar_du_of_add_property(struct device_node *np,
> > +                                         const char *name, const void
> > *value,
> > +                                         size_t length)
> 
> So, were you going to revive Pantelis' patch or move this to the core?

Do you have a pointer to that patch ?

> > +{
> > +       struct property *prop;
> > +
> > +       prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +       if (!prop)
> > +               return -ENOMEM;
> > +
> > +       prop->name = kstrdup(name, GFP_KERNEL);
> > +       prop->value = kmemdup(value, length, GFP_KERNEL);
> > +       prop->length = length;
> > +
> > +       if (!prop->name || !prop->value) {
> > +               kfree(prop->name);
> > +               kfree(prop->value);
> > +               kfree(prop);
> > +               return -ENOMEM;
> > +       }
> > +
> > +       of_property_set_flag(prop, OF_DYNAMIC);
> > +
> > +       prop->next = np->properties;
> > +       np->properties = prop;
> > +
> > +       return 0;
> > +}

[snip]

> > +static void __init rcar_du_of_lvds_patch_one(struct device_node *lvds,
> > +                                            const struct of_phandle_args
> > *clk,
> > +                                            struct device_node *local,
> > +                                            struct device_node *remote)
> > +{
> > +       struct device_node *endpoints[2];
> > +       unsigned int psize;
> > +       unsigned int i;
> > +       __be32 value[4];
> > +       int ret;
> > +
> > +       /*
> > +        * Set the LVDS clocks property. This can't be performed by the
> > overlay
> > +        * as the structure of the clock specifier has changed over time,
> > and we
> > +        * don't know at compile time which binding version the system we
> > will
> > +        * run on uses.
> > +        */
> > +       if (clk->args_count >= ARRAY_SIZE(value) - 1)
> > +               return;
> > +
> > +       value[0] = cpu_to_be32(clk->np->phandle);
> > +       for (i = 0; i < clk->args_count; ++i)
> > +               value[i + 1] = cpu_to_be32(clk->args[i]);
> > +
> > +       psize = (clk->args_count + 1) * 4;
> > +       ret = rcar_du_of_add_property(lvds, "clocks", value, psize);
> > +       if (ret < 0)
> > +               return;
> > +
> > +       /*
> > +        * Insert the node in the OF graph: patch the LVDS ports
> > remote-endpoint
> > +        * properties to point to the endpoints of the sibling nodes in
> > the
> > +        * graph. This can't be performed by the overlay: on the input
> > side the
> > +        * overlay would contain a phandle for the DU LVDS output port
> > that
> > +        * would clash with the system DT, and on the output side the
> > connection
> > +        * is board-specific.
> > +        */
> > +       endpoints[0] = rcar_du_of_find_node_by_path(lvds,
> > +                                                  
> > "/ports/port@0/endpoint");
> 
> of_graph_get_endpoint_by_regs() should work here instead or am I
> missing something?

Good point. The patch series started with a need for a node lookup by path 
function to patch the overlay before applying it, and I failed to see that the 
function wasn't needed anymore in this new version. I've successfully tested 
of_graph_get_endpoint_by_regs(), I'll use that in v4.

> > +       endpoints[1] = rcar_du_of_find_node_by_path(lvds,
> > +                                                  
> > "/ports/port@1/endpoint"); +       if (!endpoints[0] || !endpoints[1])
> > +               return;
> > +
> > +       value[0] = cpu_to_be32(local->phandle);
> > +       ret = rcar_du_of_add_property(endpoints[0], "remote-endpoint",
> > +                                     value, 4);
> 
> s/4/sizeof(__be32)/

Will fix in v4.

> > +       if (ret < 0)
> > +               goto done;
> > +
> > +       value[0] = cpu_to_be32(remote->phandle);
> > +       ret = rcar_du_of_add_property(endpoints[1], "remote-endpoint",
> > +                                     value, 4);
> > +       if (ret < 0)
> > +               goto done;
> > +
> > +done:
> > +       of_node_put(endpoints[0]);
> > +       of_node_put(endpoints[1]);
> > +}

[snip]

-- 
Regards,

Laurent Pinchart

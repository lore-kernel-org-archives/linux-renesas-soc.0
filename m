Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:43934 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbeBYLcP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Feb 2018 06:32:15 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/4] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Sun, 25 Feb 2018 13:33:01 +0200
Message-ID: <2193011.n7ipjnO3AS@avalon>
In-Reply-To: <f31fad7e-112a-4ac3-4e60-f57534c0cf91@gmail.com>
References: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com> <06d3fb91-961d-a053-df22-cddf3419b159@gmail.com> <f31fad7e-112a-4ac3-4e60-f57534c0cf91@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Frank,

On Sunday, 25 February 2018 00:42:47 EET Frank Rowand wrote:
> On 02/22/18 14:10, Frank Rowand wrote:
> > Hi Laurent, Rob,
> > 
> > Thanks for the prompt spin to address my concerns.  There are some small
> > technical issues.
> > 
> > I did not read the v3 patch until today.  v3 through v6 are still using
> > the old overlay apply method which uses an expanded device tree as input.
> > 
> > Rob, I don't see my overlay patches in you for-next branch, and I have
> > not seen an "Applied" message from you.  What is the status of the
> > overlay patches?
> > 
> > Comments in the patch below.
> > 
> > On 02/22/18 05:13, Laurent Pinchart wrote:
> >> The internal LVDS encoders now have their own DT bindings. Before
> >> switching the driver infrastructure to those new bindings, implement
> >> backward-compatibility through live DT patching.
> >> 
> >> Patching is disabled and will be enabled along with support for the new
> >> DT bindings in the DU driver.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> >> ---
> >> Changes since v5:
> >> 
> >> - Use a private copy of rcar_du_of_changeset_add_property()
> >> 
> >> Changes since v3:
> >> 
> >> - Use the OF changeset API
> >> - Use of_graph_get_endpoint_by_regs()
> >> - Replace hardcoded constants by sizeof()
> >> 
> >> Changes since v2:
> >> 
> >> - Update the SPDX headers to use C-style comments in header files
> >> - Removed the manually created __local_fixups__ node
> >> - Perform manual fixups on live DT instead of overlay
> >> 
> >> Changes since v1:
> >> 
> >> - Select OF_FLATTREE
> >> - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> >> - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> >> - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> >> - Pass void begin and end pointers to rcar_du_of_get_overlay()
> >> - Use of_get_parent() instead of accessing the parent pointer directly
> >> - Find the LVDS endpoints nodes based on the LVDS node instead of the
> >> 
> >>   root of the overlay
> >> 
> >> - Update to the <soc>-lvds compatible string format
> >> ---
> >> 
> >>  drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
> >>  drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
> >>  drivers/gpu/drm/rcar-du/rcar_du_of.c               | 342 +++++++++++++++
> >>  drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
> >>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 +++++
> >>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 ++++
> >>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 ++++
> >>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 ++++
> >>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 ++++
> >>  9 files changed, 661 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> >>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts

[snip]

> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> >> b/drivers/gpu/drm/rcar-du/rcar_du_of.c new file mode 100644
> >> index 000000000000..ac442ddfed16
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c

[snip]

> >> +static int __init rcar_du_of_apply_overlay(const struct
> >> rcar_du_of_overlay *dtbs,
> >> +					   const char *compatible)
> >> +{
> >> +	const struct rcar_du_of_overlay *dtb = NULL;
> >> +	struct device_node *node = NULL;
> >> +	unsigned int i;
> >> +	int ovcs_id;
> >> +	void *data;
> >> +	void *mem;
> >> +	int ret;
> >> +
> >> +	for (i = 0; dtbs[i].compatible; ++i) {
> >> +		if (!strcmp(dtbs[i].compatible, compatible)) {
> >> +			dtb = &dtbs[i];
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	if (!dtb)
> >> +		return -ENODEV;
> 
> I was trying to avoid reviewing this little block of code, because it
> meant spending the time to do the research to verify my memory.  I did
> the research, so here are the comments...

Thank you.

> > __If__ my overlay patches are accepted, this block:
> >> +
> >> +	data = kmemdup(dtb->begin, dtb->end - dtb->begin, GFP_KERNEL);
> >> +	if (!data)
> >> +		return -ENOMEM;
> >> +
> >> +	mem = of_fdt_unflatten_tree(data, NULL, &node);
> >> +	if (!mem) {
> >> 
> >> +		ret = -ENOMEM;
> 
>                 kfree(data);
> 
> This could be done at the tail of the function if you prefer, but
> it is easier for me to put it here to show which case it is ok
> to kfree().  And if doing the kfree() here, may as well just
> return -ENOMEM here instead of going to done.
> 
> >> +		goto done;
> >> +	}
> >> +
> >> +	ovcs_id = 0;
> >> +	ret = of_overlay_apply(node, &ovcs_id);
> >> +
> 
> >> +done:
> Do not do the of_node_put() or the kfree()s here.  The live
> devicetree and the overlay changeset have pointers into them.
> 
> Some error values from of_overlay_apply() do allow you to do some
> freeing, but since this is at most a temporary piece of code, it
> isn't worth all the complexity of trying to figure that out.  The
> implications of the various return values from of_overlay_apply()
> are a bit of a hairball.
> 
> >> +	of_node_put(node);
> >> +	kfree(data);
> >> +	kfree(mem);

OK, I'll remove the error handling code here and add a kfree(data) if 
of_fdt_unflatten_tree() fails. Thank you.

> > becomes:
> > 	ret = of_overlay_fdt_apply(dtb->begin, &ovcs_id);
> > 
> > If my overlay patches do not exist, there are other small errors
> > in the code block above.  I'll ignore them for the moment.
> > 
> > A quick scan of the rest of the code looks OK.  I'll read through it
> > more carefully, but wanted to get this reply out without further
> > delay.
> > 
> > -Frank
> > 
> >> +
> >> +	return ret;
> >> +}

[snip]

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54637 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754630AbeBWT4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 14:56:02 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/4] drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
Date: Fri, 23 Feb 2018 21:56:47 +0200
Message-ID: <1950752.H92aV169ua@avalon>
In-Reply-To: <65f98b4d-ceba-c8cf-525b-529df3635cac@gmail.com>
References: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com> <6897566.HfZ0CxhyhN@avalon> <65f98b4d-ceba-c8cf-525b-529df3635cac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Frank,

On Friday, 23 February 2018 21:43:17 EET Frank Rowand wrote:
> On 02/23/18 01:00, Laurent Pinchart wrote:
> > On Friday, 23 February 2018 04:38:06 EET Frank Rowand wrote:
> >> On 02/22/18 14:10, Frank Rowand wrote:
> >>> Hi Laurent, Rob,
> >>> 
> >>> Thanks for the prompt spin to address my concerns.  There are some small
> >>> technical issues.
> >>> 
> >>> I did not read the v3 patch until today.  v3 through v6 are still using
> >>> the old overlay apply method which uses an expanded device tree as
> >>> input.
> >>> 
> >>> Rob, I don't see my overlay patches in you for-next branch, and I have
> >>> not seen an "Applied" message from you.  What is the status of the
> >>> overlay patches?
> >>> 
> >>> Comments in the patch below.
> >>> 
> >>> On 02/22/18 05:13, Laurent Pinchart wrote:
> >>>> The internal LVDS encoders now have their own DT bindings. Before
> >>>> switching the driver infrastructure to those new bindings, implement
> >>>> backward-compatibility through live DT patching.
> >>>> 
> >>>> Patching is disabled and will be enabled along with support for the new
> >>>> DT bindings in the DU driver.
> >>>> 
> >>>> Signed-off-by: Laurent Pinchart
> >>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>> ---
> >>>> Changes since v5:
> >>>> 
> >>>> - Use a private copy of rcar_du_of_changeset_add_property()
> >>>> 
> >>>> Changes since v3:
> >>>> 
> >>>> - Use the OF changeset API
> >>>> - Use of_graph_get_endpoint_by_regs()
> >>>> - Replace hardcoded constants by sizeof()
> >>>> 
> >>>> Changes since v2:
> >>>> 
> >>>> - Update the SPDX headers to use C-style comments in header files
> >>>> - Removed the manually created __local_fixups__ node
> >>>> - Perform manual fixups on live DT instead of overlay
> >>>> 
> >>>> Changes since v1:
> >>>> 
> >>>> - Select OF_FLATTREE
> >>>> - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> >>>> - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> >>>> - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> >>>> - Pass void begin and end pointers to rcar_du_of_get_overlay()
> >>>> - Use of_get_parent() instead of accessing the parent pointer directly
> >>>> - Find the LVDS endpoints nodes based on the LVDS node instead of the
> >>>>   root of the overlay
> >>>> - Update to the <soc>-lvds compatible string format
> >>>> ---
> >>>> 
> >>>>  drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
> >>>>  drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_of.c               | 342 +++++++++++++
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
> >>>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 +++++
> >>>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 ++++
> >>>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 ++++
> >>>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 ++++
> >>>>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 ++++
> >>>>  9 files changed, 661 insertions(+), 1 deletion(-)
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> >>>>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> >>>> 
> >>>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> >>>> b/drivers/gpu/drm/rcar-du/Kconfig index 5d0b4b7119af..3f83352a7313
> >>>> 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
> >>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> >> 
> >> < snip >
> >> 
> >>> becomes:
> >>> 	ret = of_overlay_fdt_apply(dtb->begin, &ovcs_id);
> >>> 
> >>> If my overlay patches do not exist, there are other small errors
> >>> in the code block above.  I'll ignore them for the moment.

If you have time to not ignore them I'd appreciate your comments :-) I'd like 
to get this patch series merged in v4.17, and for that I want to be prepared 
to submit it on top of your overlay patches if they make it to mainline, or 
without them if they don't.

> >>> A quick scan of the rest of the code looks OK.  I'll read through it
> >>> more carefully, but wanted to get this reply out without further
> >>> delay.
> >> 
> >> < snip >
> >> 
> >> I was hoping to be able to convert the .dts files to use sugar syntax
> >> instead of hand coding the fragment nodes, but for this specific set
> >> of files I failed, since the labels that would have been required do
> >> not already exist in the base .dts files that that overlays would be
> >> applied against.
> > 
> > And even if they existed in the base .dts in the kernel sources, there's
> > no guarantee that the .dtb on the systems we want to patch would contain
> > symbol, so that wouldn't have been an option anyway, would it ?
> 
> Correct.  And even more troublesome is that some of the fragments are
> targeted at node "/", which dtc does not even allow a label on (at the
> moment).
> 
> >> Oh well.  It was an interesting exercise anyway, trying to be crafty.

-- 
Regards,

Laurent Pinchart

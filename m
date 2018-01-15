Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55972 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751965AbeAOIc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:32:56 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 04/12] drm: rcar-du: Convert LVDS encoder code to bridge driver
Date: Mon, 15 Jan 2018 10:32:59 +0200
Message-ID: <47388491.06420JOnp6@avalon>
In-Reply-To: <CAMuHMdW4zWjSGfX1dqc7j-VnadNig_ijibHq8_v-1v1XACJhNA@mail.gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com> <20180112231430.26943-5-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdW4zWjSGfX1dqc7j-VnadNig_ijibHq8_v-1v1XACJhNA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, 15 January 2018 10:30:23 EET Geert Uytterhoeven wrote:
> On Sat, Jan 13, 2018 at 12:14 AM, Laurent Pinchart wrote:
> > The LVDS encoders used to be described in DT as part of the DU. They now
> > have their own DT node, linked to the DU using the OF graph bindings.
> > This allows moving internal LVDS encoder support to a separate driver
> > modelled as a DRM bridge. Backward compatibility is retained as legacy
> > DT is patched live to move to the new bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > 
> > +static void rcar_lvds_enable(struct drm_bridge *bridge)
> > +{
> > +       struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> > +       u32 lvdhcr;
> > +       int ret;
> > +
> > +       WARN_ON(lvds->enabled);
> > +
> > +       ret = clk_prepare_enable(lvds->clock);
> 
> What about starting to use Runtime PM to manage the clock, and thus calling
> pm_runtime_get_sync() here instead?
> That will make the driver future-proof w.r.t. LVDS blocks in power domains.
> 
> You do need a "power-domains" property, though, which may complicate DT
> runtime patching.

And that's why I've left it out for now. It's on my to-do list, but I will do 
so in a separate patch series. Depending on the complexity I might use runtime 
PM for new DTs only and leave the runtime-patched devices trees out.

-- 
Regards,

Laurent Pinchart

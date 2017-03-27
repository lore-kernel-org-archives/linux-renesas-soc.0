Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52667 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbdC0J57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2017 05:57:59 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: vsps DT property (was: Re: [PATCH 10/22] drm: rcar-du: Expose the VSP1 compositor through KMS planes)
Date: Mon, 27 Mar 2017 12:58:12 +0300
Message-ID: <2703084.4C8u5gxoRf@avalon>
In-Reply-To: <CAMuHMdUSLXwHg0PrPXcxi8T9KNtN4X2=fZxwht3ktU5uMV8ibg@mail.gmail.com>
References: <CAMuHMdUSLXwHg0PrPXcxi8T9KNtN4X2=fZxwht3ktU5uMV8ibg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday 23 Mar 2017 16:10:56 Geert Uytterhoeven wrote:
> On Mon, Sep 14, 2015 at 12:50 AM, Laurent Pinchart wrote:
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > 
> > +int rcar_du_vsp_init(struct rcar_du_vsp *vsp)
> > +{
> > +       struct rcar_du_device *rcdu = vsp->dev;
> > +       struct platform_device *pdev;
> > +       struct device_node *np;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       /* Find the VSP device and initialize it. */
> > +       np = of_parse_phandle(rcdu->dev->of_node, "vsps", vsp->index);
> > +       if (!np) {
> > +               dev_err(rcdu->dev, "vsps node not found\n");
> > +               return -ENXIO;
> > +       }
> 
> Apparently the "vsps" DT property was never documented in
> Documentation/devicetree/bindings/display/renesas,du.txt.
> 
> Can you please fix that? Thanks!

Oops. I've just sent a patch.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbeLDSMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 13:12:40 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] drm: rcar-du: dw-hdmi: Reject modes with a too high clock frequency
Date: Tue, 04 Dec 2018 20:13:10 +0200
Message-ID: <7465409.qeCXr2vvpE@avalon>
In-Reply-To: <CAMuHMdUZmkuBpG0kk=oxcTz4Mqjq-zfP218PTJH4OXGhdzZN4w@mail.gmail.com>
References: <20181204163640.316-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUZmkuBpG0kk=oxcTz4Mqjq-zfP218PTJH4OXGhdzZN4w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 4 December 2018 19:30:25 EET Geert Uytterhoeven wrote:
> On Tue, Dec 4, 2018 at 5:36 PM Laurent Pinchart wrote:
> > Implement a .mode_valid() handler in the R-Car glue layer to reject
> > modes with an unsupported clock frequency.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > @@ -35,6 +35,20 @@ static const struct rcar_hdmi_phy_params
> > rcar_hdmi_phy_params[] = {
> >         { ~0UL,      0x0000, 0x0000, 0x0000 },
> >  };
> > 
> > +static enum drm_mode_status
> > +rcar_hdmi_mode_valid(struct drm_connector *connector,
> > +                    const struct drm_display_mode *mode)
> > +{
> > +       /*
> > +        * The maximum supported clock frequency is 297 MHz, as shown in
> > the PHY +        * parameters table.
> > +        */
> > +       if (mode->clock > 297000)
> > +               return MODE_CLOCK_HIGH;
> 
> Perhaps you need a check for the lower limit (25 MHz), too?

There's no lower limit implied by the rcar_hdmi_phy_params table.

> > +
> > +       return MODE_OK;
> > +}

-- 
Regards,

Laurent Pinchart

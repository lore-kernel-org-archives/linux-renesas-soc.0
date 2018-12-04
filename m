Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45387 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbeLDSnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 13:43:07 -0500
Received: by mail-vs1-f66.google.com with SMTP id v10so10446429vsv.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 10:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20181204163640.316-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUZmkuBpG0kk=oxcTz4Mqjq-zfP218PTJH4OXGhdzZN4w@mail.gmail.com> <7465409.qeCXr2vvpE@avalon>
In-Reply-To: <7465409.qeCXr2vvpE@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 19:42:53 +0100
Message-ID: <CAMuHMdWwCh2BggD9p9aZrmVziiqPiB2strFvgBBMVhJQ4AQx=w@mail.gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: dw-hdmi: Reject modes with a too high
 clock frequency
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Dec 4, 2018 at 7:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 4 December 2018 19:30:25 EET Geert Uytterhoeven wrote:
> > On Tue, Dec 4, 2018 at 5:36 PM Laurent Pinchart wrote:
> > > Implement a .mode_valid() handler in the R-Car glue layer to reject
> > > modes with an unsupported clock frequency.
> > >
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > > @@ -35,6 +35,20 @@ static const struct rcar_hdmi_phy_params
> > > rcar_hdmi_phy_params[] = {
> > >         { ~0UL,      0x0000, 0x0000, 0x0000 },
> > >  };
> > >
> > > +static enum drm_mode_status
> > > +rcar_hdmi_mode_valid(struct drm_connector *connector,
> > > +                    const struct drm_display_mode *mode)
> > > +{
> > > +       /*
> > > +        * The maximum supported clock frequency is 297 MHz, as shown in
> > > the PHY +        * parameters table.
> > > +        */
> > > +       if (mode->clock > 297000)
> > > +               return MODE_CLOCK_HIGH;
> >
> > Perhaps you need a check for the lower limit (25 MHz), too?
>
> There's no lower limit implied by the rcar_hdmi_phy_params table.

Oh, you mean the table in the driver, not a table in the Hardware User's
Manual?
That's why I couldn't find the table, but only a short notice in the HDMI
section of the Hardware User's Manual, stating:

    Pixel clock from 25MHz up to 297MHz

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

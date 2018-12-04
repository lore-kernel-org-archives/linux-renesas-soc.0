Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42540 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbeLDTu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 14:50:28 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] drm: rcar-du: dw-hdmi: Reject modes with a too high clock frequency
Date: Tue, 04 Dec 2018 21:50:58 +0200
Message-ID: <4643222.4hxeShCNyd@avalon>
In-Reply-To: <CAMuHMdUn9MXibGb2EVf=Vk3-vvWZnc3M-KB6Me_q5vx7MkL9sQ@mail.gmail.com>
References: <20181204163640.316-1-laurent.pinchart+renesas@ideasonboard.com> <4080472.x6oRvDE9so@avalon> <CAMuHMdUn9MXibGb2EVf=Vk3-vvWZnc3M-KB6Me_q5vx7MkL9sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 4 December 2018 21:45:10 EET Geert Uytterhoeven wrote:
> On Tue, Dec 4, 2018 at 7:51 PM Laurent Pinchart wrote:
> > On Tuesday, 4 December 2018 20:42:53 EET Geert Uytterhoeven wrote:
> > > On Tue, Dec 4, 2018 at 7:12 PM Laurent Pinchart wrote:
> > > > On Tuesday, 4 December 2018 19:30:25 EET Geert Uytterhoeven wrote:
> > > >> On Tue, Dec 4, 2018 at 5:36 PM Laurent Pinchart wrote:
> > > >>> Implement a .mode_valid() handler in the R-Car glue layer to reject
> > > >>> modes with an unsupported clock frequency.
> > > >>> 
> > > >>> Signed-off-by: Laurent Pinchart
> > > >>> <laurent.pinchart+renesas@ideasonboard.com>
> > > >> 
> > > >> Thanks for your patch!
> > > >> 
> > > >>> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > > >>> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > > >>> @@ -35,6 +35,20 @@ static const struct rcar_hdmi_phy_params
> > > >>> rcar_hdmi_phy_params[] = {
> > > >>> 
> > > >>>         { ~0UL,      0x0000, 0x0000, 0x0000 },
> > > >>>  
> > > >>>  };
> > > >>> 
> > > >>> +static enum drm_mode_status
> > > >>> +rcar_hdmi_mode_valid(struct drm_connector *connector,
> > > >>> +                    const struct drm_display_mode *mode)
> > > >>> +{
> > > >>> +       /*
> > > >>> +        * The maximum supported clock frequency is 297 MHz, as
> > > >>> shown
> > > >>> in the PHY
> > > >>> +        * parameters table.
> > > >>> +        */
> > > >>> +       if (mode->clock > 297000)
> > > >>> +               return MODE_CLOCK_HIGH;
> > > >> 
> > > >> Perhaps you need a check for the lower limit (25 MHz), too?
> > > > 
> > > > There's no lower limit implied by the rcar_hdmi_phy_params table.
> > > 
> > > Oh, you mean the table in the driver, not a table in the Hardware User's
> > > Manual?
> > 
> > Correct, I mean the table in the driver. This patch was prompted by an
> > error returned from rcar_hdmi_phy_configure() when the mode frequency was
> > too high, making mode setting failed. I've thus added a .mode_valid()
> > handler to ensure that invalid modes don't get exposed to upper layers,
> > fixing such use cases as fbvon on a 4K monitor (where the fbcon was
> > picking a mode advertised as supported by the driver while its frequency
> > was too high).
> > 
> > > That's why I couldn't find the table, but only a short notice in the
> > > HDMI section of the Hardware User's Manual, stating:
> > > 
> > >     Pixel clock from 25MHz up to 297MHz
> > 
> > Well, the IP core vendor doesn't allow us to submit patches based on the
> > content of non-public documentation, so I'm afraid I won't sign such a
> > patch without being given explicit permission. It's a very stupid game
> > really, but I don't set the rules :-(
> 
> https://en.wikipedia.org/wiki/HDMI claims 25 MHz is  the minimum TMDS rate
> for HDMI anyway. Anything below that needs to use pixel replication.
> 
> So you can reject < 25 MHz for sure.

That should then be performed in the common dw_hdmi_bridge_mode_valid() 
handler, in drivers/gpu/drm/bridge/synopsys/dw-hdmi.c.


-- 
Regards,

Laurent Pinchart

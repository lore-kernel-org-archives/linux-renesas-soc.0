Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbeLFJu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 04:50:26 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2 07/16] drm: rcar-du: Use LVDS PLL clock as dot clock when possible
Date: Thu, 06 Dec 2018 11:50:59 +0200
Message-ID: <2156355.nrP3YJkyIb@avalon>
In-Reply-To: <87pnur1ho1.wl-kuninori.morimoto.gx@renesas.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com> <20180914091046.483-8-laurent.pinchart+renesas@ideasonboard.com> <87pnur1ho1.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tuesday, 27 November 2018 02:44:58 EET Kuninori Morimoto wrote:
> Hi Laurent
> 
> Sorry for super late response.
> I got opinion from BSP team about this patch.

No worries. My reply is late too I'm afraid :-S

> > On selected SoCs, the DU can use the clock output by the LVDS encoder
> > PLL as its input dot clock. This feature is optional, but on the D3 and
> > E3 SoC it is often the only way to obtain a precise dot clock frequency,
> > as the other available clocks (CPG-generated clock and external clock)
> > usually have fixed rates.
> > 
> > Add a DU model information field to describe which DU channels can use
> > the LVDS PLL output clock as their input clock, and configure clock
> > routing accordingly.
> > 
> > This feature is available on H2, M2-W, M2-N, D3 and E3 SoCs, with D3 and
> > E3 being the primary targets. It is left disabled in this commit, and
> > will be enabled per-SoC after careful testing.
> > 
> > At the hardware level, clock routing is configured at runtime in two
> > steps, first selecting an internal dot clock between the LVDS PLL clock
> > and the external DOTCLKIN clock, and then selecting between the internal
> > dot clock and the CPG-generated clock. The first part requires stopping
> > the whole DU group in order for the change to take effect, thus causing
> > flickering on the screen. For this reason we currently hardcode the
> > clock source to the LVDS PLL clock if available, and allow flicker-free
> > selection of the external DOTCLKIN clock or CPG-generated clock
> > otherwise. A more dynamic clock selection process can be implemented
> > later if the need arises.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> 
> (snip)
> 
> > +	didsr = DIDSR_CODE;
> > +	for (i = 0; i < num_crtcs; ++i, ++rcrtc) {
> > +		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
> > +			didsr |= DIDSR_LCDS_LVDS0(i)
> > +			      |  DIDSR_PDCS_CLK(i, 0);
> > +		else
> > +			didsr |= DIDSR_LCDS_DCLKIN(i)
> > +			      |  DIDSR_PDCS_CLK(i, 0);
> > +	}
> 
> Here, this is for DU pin settings, and fixed for
> 
> 	DU_DOTCLKIN0 -> DU0
> 	DU_DOTCLKIN1 -> DU1
> 
> But on E3 (Ebisu) board, it has only DU_DOTCLKIN0.
> We might use like this
> 
> 	DU_DOTCLKIN0 -> DU0
> 	DU_DOTCLKIN0 -> DU1
> 
> It is possible to adjust to this situation ?
> DIDSR :: PDCSn allows only 0

I think this would make sense. I'm not sure how to implement that, but I'll 
give it a try. What is the priority ?

-- 
Regards,

Laurent Pinchart

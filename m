Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Fabio Estevam <fabio.estevam@freescale.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 16/29] drm: bridge: dw-hdmi: Detect PHY type at runtime
Date: Tue, 20 Dec 2016 15:11:48 +0200
Message-ID: <1706424.IHm6bGF9sZ@avalon>
In-Reply-To: <57dd2817-88a9-70ef-745d-221cfed2d20c@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com> <20161220013400.28317-17-laurent.pinchart+renesas@ideasonboard.com> <57dd2817-88a9-70ef-745d-221cfed2d20c@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jose,

On Tuesday 20 Dec 2016 11:39:21 Jose Abreu wrote:
> On 20-12-2016 01:33, Laurent Pinchart wrote:
> > Detect the PHY type and use it to handle the PHY type-specific SVSRET
> > signal.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/bridge/dw-hdmi.c | 68 +++++++++++++++++++++++++++++++++--
> >  include/drm/bridge/dw_hdmi.h     | 10 ++++++
> >  2 files changed, 75 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/dw-hdmi.c index f4faa14213e5..ef4f2f96ed2c
> > 100644
> > --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/dw-hdmi.c

[snip]

> >  	struct i2c_adapter *ddc;
> > @@ -1015,7 +1023,8 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
> > int cscon)> 
> >  	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
> >  	dw_hdmi_phy_gen2_pddq(hdmi, 0);
> > 
> > -	if (hdmi->dev_type == RK3288_HDMI)
> > +	/* The DWC MHL and HDMI 2.0 PHYs need the SVSRET signal to be set. */
> > +	if (hdmi->phy->has_svsret)
> >  		dw_hdmi_phy_enable_svsret(hdmi, 1);
> 
> I didn't review the original code but according to the docs the
> svsret signal should be set before de-asserting phy reset.

I don't have access to the documentation so I can't comment on that :-) What  
does the SVSRET signal control (and what does the name stand for) ?

By de-asserting PHY reset, do you mean

        /* PHY reset */
        hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_DEASSERT, HDMI_MC_PHYRSTZ);
        hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_ASSERT, HDMI_MC_PHYRSTZ);

? HDMI_MC_PHYRSTZ_DEASSERT is defined as 0x01 and HDMI_MC_PHYRSTZ_ASSERT as 
0x00, which I believe leads to correct operation on Gen2 PHYs, but is 
incorrect on Gen1 PHYs that have an active low reset signal. Could you confirm 
that ? The DEASSERT and ASSERT macros should be renamed as they're obviously 
incorrect.

I can move the SVSRET assertion before PHY reset and test it on RK3288 and R-
Car H3.

> >  	/*Wait for PHY PLL lock */
> > 
> > @@ -1840,6 +1849,54 @@ static irqreturn_t dw_hdmi_irq(int irq, void
> > *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> > 
> > +static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
> > +	{
> > +		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
> > +		.name = "DWC HDMI TX PHY",
> > +	}, {
> > +		.type = DW_HDMI_PHY_DWC_MHL_PHY_HEAC,
> > +		.name = "DWC MHL PHY + HEAC PHY",
> > +		.has_svsret = true,
> > +	}, {
> > +		.type = DW_HDMI_PHY_DWC_MHL_PHY,
> > +		.name = "DWC MHL PHY",
> > +		.has_svsret = true,
> > +	}, {
> > +		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY_HEAC,
> > +		.name = "DWC HDMI 3D TX PHY + HEAC PHY",
> > +	}, {
> > +		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY,
> > +		.name = "DWC HDMI 3D TX PHY",
> > +	}, {
> > +		.type = DW_HDMI_PHY_DWC_HDMI20_TX_PHY,
> > +		.name = "DWC HDMI 2.0 TX PHY",
> > +		.has_svsret = true,
> 
> Hmm, what I have here is that only MHL phys have svsret. Is this
> case for your phy?

The SoC datasheet mentions the SVSRET bit in the HDMI TX registers but doesn't 
document it any further. If I don't set SVSRET the HDMI output stays dead, so 
I assume I need to set it :-)

> > +	}
> > +};

[snip]

-- 
Regards,

Laurent Pinchart

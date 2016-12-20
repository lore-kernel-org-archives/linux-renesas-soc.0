Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Fabio Estevam <fabio.estevam@freescale.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power handling
Date: Tue, 20 Dec 2016 15:50:34 +0200
Message-ID: <17861036.j3qVTS9FcC@avalon>
In-Reply-To: <20161220114553.GS14217@n2100.armlinux.org.uk>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com> <20161220013400.28317-18-laurent.pinchart+renesas@ideasonboard.com> <20161220114553.GS14217@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

Thank you for the review.

On Tuesday 20 Dec 2016 11:45:53 Russell King - ARM Linux wrote:
> On Tue, Dec 20, 2016 at 03:33:48AM +0200, Laurent Pinchart wrote:
> > Instead of spreading version-dependent PHY power handling code around,
> > group it in two functions to power the PHY on and off and use them
> > through the driver.
> > 
> > Powering off the PHY at the beginning of the setup phase is currently
> > split in two locations for first and second generation PHYs, group all
> > the operations in the dw_hdmi_phy_init() function.
> 
> This changes the behaviour of the driver.

It does, but slightly only (I'm of course very aware that slightly can easily 
be way too much :-)).

Let's analyse the differences, starting with PHY initialization in 
dw_hdmi_phy_init(). Before this patch, the function calls

        for (i = 0; i < 2; i++) {
                dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
                dw_hdmi_phy_sel_interface_control(hdmi, 0);
                dw_hdmi_phy_enable_tmds(hdmi, 0);
                dw_hdmi_phy_enable_powerdown(hdmi, true);

                /* Enable CSC */
                ret = hdmi_phy_configure(hdmi, cscon);
                if (ret)
                        return ret;
        }

and hdmi_phy_configure() starts with (I've removed lines that don't touch the 
hardware)

        /* Enable csc path */
        if (cscon)
                val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH;
        else
                val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS;

        hdmi_writeb(hdmi, val, HDMI_MC_FLOWCTRL);

        /* gen2 tx power off */
        dw_hdmi_phy_gen2_txpwron(hdmi, 0);

        /* gen2 pddq */
        dw_hdmi_phy_gen2_pddq(hdmi, 1);

After the change, dw_hdmi_phy_init() calls

        for (i = 0; i < 2; i++) {
                dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
                dw_hdmi_phy_sel_interface_control(hdmi, 0);

                /* Enable CSC */
                ret = hdmi_phy_configure(hdmi, cscon);
                if (ret)
                        return ret;
        }

and hdmi_phy_configure() starts with

        /* Enable csc path */
        if (cscon)
                val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH;
        else
                val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS;

        hdmi_writeb(hdmi, val, HDMI_MC_FLOWCTRL);

        dw_hdmi_phy_power_off(hdmi);

with dw_hdmi_phy_power_off() defined as

        if (hdmi->phy->gen == 1) {
                dw_hdmi_phy_enable_tmds(hdmi, 0);
                dw_hdmi_phy_enable_powerdown(hdmi, true);
        } else {
                dw_hdmi_phy_gen2_txpwron(hdmi, 0);
                dw_hdmi_phy_gen2_pddq(hdmi, 1);
        }

This patch thus changes the behaviour in two ways:

- Move the dw_hdmi_phy_enable_tmds() and dw_hdmi_phy_enable_powerdown() calls 
after CSC configuration (HDMI_MC_FLOWCTRL).

- Only touch the power bits related to the PHY generation.

I believe the first change to be harmless. Furthermore, given that the i.MX6 
and Rockchip SoCs use a Gen2 PHY, the TMDS and POWERDOWN bits should be no-
ops, so it should have no effect at all on those platforms.

I also believe the second change to be harmless as the TMDS and POWERDOWN bits 
should be no-ops on i.MX6 and Rockchip. I have tested this patch series on 
RK3288 and i.MX6Q and haven't noticed any regression.

The power on path should similarly be fine too, as the change

-       dw_hdmi_phy_enable_powerdown(hdmi, false);
-
-       /* toggle TMDS enable */
-       dw_hdmi_phy_enable_tmds(hdmi, 0);
-       dw_hdmi_phy_enable_tmds(hdmi, 1);
-
-       /* gen2 tx power on */
-       dw_hdmi_phy_gen2_txpwron(hdmi, 1);
-       dw_hdmi_phy_gen2_pddq(hdmi, 0);
+       dw_hdmi_phy_power_on(hdmi);

results in

static void dw_hdmi_phy_power_on(struct dw_hdmi *hdmi)
{
	if (hdmi->phy->gen == 1) {
		dw_hdmi_phy_enable_powerdown(hdmi, false);

		/* Toggle TMDS enable. */
		dw_hdmi_phy_enable_tmds(hdmi, 0);
		dw_hdmi_phy_enable_tmds(hdmi, 1);
	} else {
		dw_hdmi_phy_gen2_txpwron(hdmi, 1);
		dw_hdmi_phy_gen2_pddq(hdmi, 0);
	}
}

which splits the Gen1/Gen2 code but doesn't reorder anything.

The last change is in dw_hdmi_phy_disable(), see below.

> > +static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
> > +{
> > +	if (hdmi->phy->gen == 1) {
> > +		dw_hdmi_phy_enable_tmds(hdmi, 0);
> > +		dw_hdmi_phy_enable_powerdown(hdmi, true);
> > +	} else {
> > +		dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> > +		dw_hdmi_phy_gen2_pddq(hdmi, 1);
> > +	}
> > +}
> > 
> > @@ -1290,9 +1302,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi
> > *hdmi)
> >  	if (!hdmi->phy_enabled)
> >  		return;
> > 
> > -	dw_hdmi_phy_enable_tmds(hdmi, 0);
> > -	dw_hdmi_phy_enable_powerdown(hdmi, true);
> > -
> > +	dw_hdmi_phy_power_off(hdmi);
> 
> This makes dw_hdmi_phy_disable() power down a gen2 phy.

That's correct.

> The iMX6 has a DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY phy, which you list as a
> gen2 phy.

To the best of my knowledge, based on the documentation I've been able to 
gather, the information I've received from different developers and the tests 
I've performed so far, this is the case.

> I've been carrying this change for a while, which I've had
> to revert (and finally expunge), as it causes problems on iMX6:
> 
> @@ -1112,6 +1112,14 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
> if (!hdmi->phy_enabled)
>                 return;
> 
> +       /* Actually set the phy into low power mode */
> +       dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> +
> +       /* FIXME: We should wait for TX_READY to be deasserted */
> +
> +       dw_hdmi_phy_gen2_pddq(hdmi, 1);
> +
> +       /* This appears to have no effect on iMX6 */
>         dw_hdmi_phy_enable_tmds(hdmi, 0);
>         dw_hdmi_phy_enable_powerdown(hdmi, true);
> 
> So, I think your change here will cause problems for iMX6.
> 
> From what I remember, it seems that iMX6 has issues with RXSENSE/HPD
> bouncing when the PHY is powered down.  I can't promise when I'll be
> able to check for that again.

The current code is supposed to power the PHY down in dw_hdmi_phy_disable() 
but doesn't do so as it only handles Gen1 PHY signals there. Gen2 PHYs thus 
always stay enabled.

If this causes an issue on i.MX6 related to RXSENSE and HPD, I think it should 
be handled by explicitly skipping power down in dw_hdmi_phy_disable() instead 
of pretending we power the PHY down. This could be achieved through a quirk 
flag if the issue is specific to i.MX6, or based on the PHY model if the issue 
is present in all DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY_HEAC PHYs. Jose, would you 
happen to be aware of RXSENSE/HPD issues when the PHY is disabled ?

If there's an easy way to reproduce the problem on i.MX6Q I can try locally. I 
unfortunately don't have access to i.MX6DL.

-- 
Regards,

Laurent Pinchart

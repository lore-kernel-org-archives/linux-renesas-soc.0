Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <fabio.estevam@freescale.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, Ulrich Hecht <ulrich.hecht@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power handling
Date: Thu, 02 Mar 2017 00:47:50 +0200
Message-ID: <2035754.xySSvQpCjl@avalon>
In-Reply-To: <2b176eff-2fe9-2daf-b9e8-0dfb116235cc@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com> <7271033.6cEIpZMQXV@avalon> <2b176eff-2fe9-2daf-b9e8-0dfb116235cc@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jose,

On Wednesday 01 Mar 2017 16:25:46 Jose Abreu wrote:
> On 01-03-2017 11:09, Laurent Pinchart wrote:
> > On Thursday 05 Jan 2017 15:06:49 Jose Abreu wrote:
> >> On 05-01-2017 12:29, Laurent Pinchart wrote:
> >>> On Tuesday 20 Dec 2016 12:17:23 Jose Abreu wrote:
> >>>> On 20-12-2016 11:45, Russell King - ARM Linux wrote:
> >>>>> On Tue, Dec 20, 2016 at 03:33:48AM +0200, Laurent Pinchart wrote:
> >>>>>> Instead of spreading version-dependent PHY power handling code
> >>>>>> around, group it in two functions to power the PHY on and off and use
> >>>>>> them through the driver.
> >>>>>> 
> >>>>>> Powering off the PHY at the beginning of the setup phase is currently
> >>>>>> split in two locations for first and second generation PHYs, group
> >>>>>> all the operations in the dw_hdmi_phy_init() function.
> >>>>> 
> >>>>> This changes the behaviour of the driver.
> >>>>> 
> >>>>>> +static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
> >>>>>> +{
> >>>>>> +	if (hdmi->phy->gen == 1) {
> >>>>>> +		dw_hdmi_phy_enable_tmds(hdmi, 0);
> >>>>>> +		dw_hdmi_phy_enable_powerdown(hdmi, true);
> >>>>>> +	} else {
> >>>>>> +		dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> >>>>>> +		dw_hdmi_phy_gen2_pddq(hdmi, 1);
> >>>>>> +	}
> >>>>>> +}
> >>>>>> @@ -1290,9 +1302,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi
> >>>>>> *hdmi)
> >>>>>>  	if (!hdmi->phy_enabled)
> >>>>>>  		return;
> >>>>>> 
> >>>>>> -	dw_hdmi_phy_enable_tmds(hdmi, 0);
> >>>>>> -	dw_hdmi_phy_enable_powerdown(hdmi, true);
> >>>>>> -
> >>>>>> +	dw_hdmi_phy_power_off(hdmi);
> >>>>> 
> >>>>> This makes dw_hdmi_phy_disable() power down a gen2 phy.
> >>>>> 
> >>>>> The iMX6 has a DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY phy, which you list as a
> >>>>> gen2 phy.  I've been carrying this change for a while, which I've had
> >>>>> to revert (and finally expunge), as it causes problems on iMX6:
> >>>>> 
> >>>>> @@ -1112,6 +1112,14 @@ static void dw_hdmi_phy_disable(struct dw_hdmi
> >>>>> *hdmi)
> >>>>>         if (!hdmi->phy_enabled)
> >>>>>                 return;
> >>>>> 
> >>>>> +       /* Actually set the phy into low power mode */
> >>>>> +       dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> >>>>> +
> >>>>> +       /* FIXME: We should wait for TX_READY to be deasserted */
> >>>>> +
> >>>>> +       dw_hdmi_phy_gen2_pddq(hdmi, 1);
> >>>>> +
> >>>>> +       /* This appears to have no effect on iMX6 */
> >>>>>         dw_hdmi_phy_enable_tmds(hdmi, 0);
> >>>>>         dw_hdmi_phy_enable_powerdown(hdmi, true);
> >>>>> 
> >>>>> So, I think your change here will cause problems for iMX6.
> >>>>> 
> >>>>> From what I remember, it seems that iMX6 has issues with RXSENSE/HPD
> >>>>> bouncing when the PHY is powered down.  I can't promise when I'll be
> >>>>> able to check for that again.
> >>>> 
> >>>> Indeed TX_READY must be low before asserting pddq.
> >>> 
> >>> The TX_READY signal is documented in the i.MX6 datasheet as being a PHY
> >>> output signal, but there seems to be no HDMI TX register from which its
> >>> state can be read. Do I need to poll the HDMI_PHY_PTRPT_ENBL register
> >>> through I2C ? How long is the PHY expected to take to set TX_READY to 0
> >>> ?
> >> 
> >> TX_READY can be read from register 0x1A of phy, BIT(2) (through
> >> I2C). Not sure if same offset for all phys though.
> > 
> > I have been told that another option is to poll the TX_PHY_LOCK bit in the
> > phy_stat0 register. That would be a simpler solution that doesn't require
> > I2C access. Could you confirm (or disconfirm) this ?
> 
> Yes (In our implementation we have TX_PHY_LOCK wired up to
> TX_READY that comes from phy. But if using a custom phy or an
> unusual implementation then this may not hold).

Thank you for the information. I've submitted a v4 that poll the TX_PHY_LOCK 
bit.  With the patch series applied the vendor PHY handling code already 
delegates PHY power control to the glue code, there's thus no issue there. For 
platforms using a Synopsys PHY, all the ones we have to support today have 
TX_READY wired to the PHY lock signal so we should be good as well there. If 
that doesn't remain true in the future we'll fix it.

> >>>> HPD and RXSENSE should work in power down mode by enabling enhpdrxsense
> >>>> bit in phy_conf0 BUT to enter power down you must disable TX_PWRON,
> >>>> enhpdrxsense and enable PDDQ and PHY_RESET. Only after doing this (and
> >>>> consequently entering power down mode) you can enable again
> >>>> enhpdrxsense.
> >>> 
> >>> Thanks, I'll give it a try.

-- 
Regards,

Laurent Pinchart

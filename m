Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Fabio Estevam <fabio.estevam@freescale.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 16/29] drm: bridge: dw-hdmi: Detect PHY type at runtime
Date: Thu, 05 Jan 2017 13:44:51 +0200
Message-ID: <3716714.KhkP0QV9QI@avalon>
In-Reply-To: <5e1041ec-dd9e-4cbf-f2d3-1bd17595adaf@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com> <6935724.YkYy7FE9s6@avalon> <5e1041ec-dd9e-4cbf-f2d3-1bd17595adaf@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jose,

On Thursday 05 Jan 2017 10:33:55 Jose Abreu wrote:
> On 05-01-2017 00:15, Laurent Pinchart wrote:
> > On Tuesday 20 Dec 2016 15:01:52 Jose Abreu wrote:
> >> On 20-12-2016 13:11, Laurent Pinchart wrote:
> >>> On Tuesday 20 Dec 2016 11:39:21 Jose Abreu wrote:
> >>>> On 20-12-2016 01:33, Laurent Pinchart wrote:
> >>>>> Detect the PHY type and use it to handle the PHY type-specific SVSRET
> >>>>> signal.
> >>>>> 
> >>>>> Signed-off-by: Laurent Pinchart
> >>>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>>> ---
> >>>>> 
> >>>>>  drivers/gpu/drm/bridge/dw-hdmi.c | 68 +++++++++++++++++++++++++++++--
> >>>>>  include/drm/bridge/dw_hdmi.h     | 10 ++++++
> >>>>>  2 files changed, 75 insertions(+), 3 deletions(-)
> >>>>> 
> >>>>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
> >>>>> b/drivers/gpu/drm/bridge/dw-hdmi.c index f4faa14213e5..ef4f2f96ed2c
> >>>>> 100644
> >>>>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> >>>>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> >> 
> >> [snip]
> >> 
> >>> I don't have access to the documentation so I can't comment on that :-)
> >>> What does the SVSRET signal control (and what does the name stand for) ?
> >> 
> >> SVSRET stands for SVSRET :) (no idea what it means) Its a low
> >> power mode of consumption.
> >> 
> >>> By de-asserting PHY reset, do you mean
> >>> 
> >>>         /* PHY reset */
> >>>         hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_DEASSERT, HDMI_MC_PHYRSTZ);
> >>>         hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_ASSERT, HDMI_MC_PHYRSTZ);
> >>> 
> >>> ? HDMI_MC_PHYRSTZ_DEASSERT is defined as 0x01 and HDMI_MC_PHYRSTZ_ASSERT
> >>> as 0x00, which I believe leads to correct operation on Gen2 PHYs, but is
> >>> incorrect on Gen1 PHYs that have an active low reset signal. Could you
> >>> confirm that ? The DEASSERT and ASSERT macros should be renamed as
> >>> they're obviously incorrect.
> >> 
> >> Correct. Older phys require PHYRSTZ to be deasserted (i.e. low)
> >> for a PHY-dependent time. Newer phys require PHYRSTZ to be
> >> asserted (i.e. high) for, again, a PHY-dependent time.
> > 
> > Thanks for the confirmation, I'll rename the macros.
> > 
> >> This is the kind of things that made me suggest you to extract
> >> all the phy configuration from dw-hdmi. I think that having a
> >> bunch of if's because of all the phy's that we need to support
> >> does not make much sense. The downside is, of course, having code
> >> duplicated.
> > 
> > I agree with you in principle, but I'd rather do that when I'll have
> > devices to test the code on. The three devices (soon to be) supported in
> > mainline by the dw-hdmi drivers, i.MX6, RK3288 and R-Car Gen3, all use
> > Gen2 PHYs, so I can't test the Gen1 code paths meaningfully at the
> > moment.
> > 
> >>> I can move the SVSRET assertion before PHY reset and test it on RK3288
> >>> and R-Car H3.
> >> 
> >> Probably wont make much difference unless you have a way to
> >> measure how much power the phy is consuming. But I think it is
> >> the right thing to do according to docs.
> > 
> > The init sequence is currently
> > 
> > - Power the PHY off (TXPWRON = 0, PDDQ = 1)
> > - Reset the PHY (through HDMI_MC_PHYRSTZ and HDMI_MC_HEACPHY_RST)
> > - Configure the PHY through I2C
> > - Power the PHY on (TXPWRON = 1, PDDQ = 0)
> > - Set SVSRET
> > - Wait for PHY PLL lock
> 
> What I have here for the most recent phy we tested is this:
>     - Board specific configuration (should not be needed by you)
>     - Set MC_PHY_RST high
>     - Set TXPWRON = 0
>     - Set PDDQ = 1
>     - Set SVSRET = 0
>     - Board specific impendance calibration reset (should not be
> needed by you)
>     - Set SVSRET = 1
>     - Set MC_PHY_RST low
>     - Configure phy through I2C
>     - Set PDDQ = 0
>     - Set TXPWRON = 1,
>     - Wait for phy pll lock

Thank you, I'll test that.

> > I've tried moving SVSRET right before the reset and everything still seems
> > to work fine, so I'll submit a patch.
> > 
> > Is the rest of the sequence correct ? When should SVSRET be deasserted
> > (the driver currently keeps it asserted at all times) ?
> 
> It should not be deasserted.

At all ? Even when powering the PHY down ?

> > Speaking of reset, I believe support for HEAC PHYs is broken, given that
> > the driver asserts the reset signal (through the HDMI_MC_HEACPHY_RST
> > register) but never deasserts it.
> 
> Hmm, probably, but not sure. I never tested this in older phys.

One more item we'll fix when we'll be able to test it :-)

> >> [snip]
> >> 
> >>> The SoC datasheet mentions the SVSRET bit in the HDMI TX registers but
> >>> doesn't document it any further. If I don't set SVSRET the HDMI output
> >>> stays dead, so I assume I need to set it :-)
> >> 
> >> Hmm, ok. I still haven't figured out which phy you are using so
> >> can't comment much further.
> > 
> > I'll then leave has_svsret set to true for DW_HDMI_PHY_DWC_HDMI20_TX_PHY
> > as tests show it's needed.

-- 
Regards,

Laurent Pinchart

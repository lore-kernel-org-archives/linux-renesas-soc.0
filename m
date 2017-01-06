Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <fabio.estevam@freescale.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, Ulrich Hecht <ulrich.hecht@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power handling
Date: Fri, 06 Jan 2017 16:52:15 +0200
Message-ID: <1781659.ynIBoqkrKC@avalon>
In-Reply-To: <fdc8c0fb-9028-2679-a75e-5d485acdd158@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com> <30295846.0iPnmn0IgG@avalon> <fdc8c0fb-9028-2679-a75e-5d485acdd158@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jose,

On Friday 06 Jan 2017 10:07:03 Jose Abreu wrote:
> Hi Laurent,
> 
> Sorry for the delayed answer but I am quite busy at the moment.

No worries, your help is really appreciated.

> On 06-01-2017 01:48, Laurent Pinchart wrote:
> 
> [snip]
> 
> >>>> The TX_READY signal is documented in the i.MX6 datasheet as being a PHY
> >>>> output signal, but there seems to be no HDMI TX register from which its
> >>>> state can be read. Do I need to poll the HDMI_PHY_PTRPT_ENBL register
> >>>> through I2C ? How long is the PHY expected to take to set TX_READY to 0
> >>>> ?
> >>> 
> >>> TX_READY can be read from register 0x1A of phy, BIT(2) (through
> >>> I2C).
> >> 
> >> That's what I thought, I'll poll that then. Do you have any idea how long
> >> it's supposed to take, to set an appropriate timeout ?
> 
> For 3d tx phy and for 25 MHz input reference clock the power-up
> time is ~1ms, there is no data in the docs to power-down time but
> it should be similar. Reference clock value is board dependent
> and the minimum value for HDMI shall be 13.5MHz.
> 
> > On i.MX6 (3D TX PHY) register 0x1a reads as 0x0007 before powering down
> > the PHY (by deasserting TXPWRON) and as 0x0000 immediately after. On
> > RK3288 (MHL PHY) the register reads as 0x0207 and as 0x0000 immediately
> > after deasserting TXPWRON. It seems that one I2C read is a sufficient
> > delay for TX_READY to go low.
> > 
> >>> Not sure if same offset for all phys though.
> >> 
> >> Most probably not, it would be too easy :-) I'll investigate (which will
> >> likely include lots of guesswork). If you can find any information about
> >> that (and especially about the MHL and HDMI 2.0 PHYs) that would be very
> >> appreciated, as I don't have access to any documentation that mentions a
> >> TX_READY bit for those.
> > 
> > I haven't tested the HDMI 2.0 PHY yet, but I'd be surprised if the
> > TX_READY bit was in the same register at the same position.
> 
> The info I got the register offset is from an HDMI 2.0 phy :)

That's good news :-)

> Notice that there are a lot of phy versions and some of them
> (used in dw-hdmi) maybe customized, I don't think I have access
> to that custom phys documentation.

I think we will eventually have to implement PHY-specific power up and power 
down sequences, but for now a common sequence should work.

> Please test the HDMI 2.0 phy and check if the register is the same, it
> should be.

I did, and it is \o/ I'll send patches.

> In the meantime it would really be helpful if some of the developers
> that used dw-hdmi supplied this info about the registers as they
> should know exactly what phy was used.

I will ask internally for the R-Car H3 SoC.

-- 
Regards,

Laurent Pinchart

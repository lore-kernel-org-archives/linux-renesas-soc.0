Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Archit Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 13/22] drm: bridge: dw-hdmi: Replace device type with platform quirks
Date: Mon, 05 Dec 2016 13:51:25 +0200
Message-ID: <2383743.TUIngK2BGX@avalon>
In-Reply-To: <1898458.1NNH7zlFYO@avalon>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161202160817.GE14217@n2100.armlinux.org.uk> <1898458.1NNH7zlFYO@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Friday 02 Dec 2016 18:45:46 Laurent Pinchart wrote:
> On Friday 02 Dec 2016 16:08:17 Russell King - ARM Linux wrote:
> > On Fri, Dec 02, 2016 at 05:43:43PM +0200, Laurent Pinchart wrote:
> >> DW_HDMI_QUIRK_FC_INVIDCONF is indeed a bad name, I'll fix that.
> >> 
> >> Do you know why this function needs to write to the HDMI_FC_INVIDCONF
> >> register  four times in the normal case, and once only for IMX6DL ?
> > 
> > (I don't have much time at present, I'm buried in ARM64 crud trying to
> > get a platform to boot, and working out how to debug an ARM64 platform
> > that even earlycon doesn't work on... no printascii() types of easy
> > debug facilities on ARM64 make this job several orders of magnitude
> > harder than it needs to be...)
> 
> Thanks all the more for taking time to reply.
> 
> > It prevents a magenta line down the left hand side of the screen, which
> > is caused when the frame composer in the HDMI Tx gets confused -
> > according to the errata, it does a load of maths when you write to the
> > frame composer registers, and sometimes it doesn't update properly.
> > 
> > So, the four writes (and the number is critical) is there to persuade
> > the IP to do the maths with the right values so the internal timings
> > are correct.
> > 
> > The rather confusing thing is - it's actually IMX6Q which has the more
> > severe errata, not IMX6DL - the workaround of four writes is applied
> > in the 6Q case.
> > 
> > It's covered by ERR004308 in the IMX6Q Errata document (search for
> > IMX6DQCE).  It isn't mentioned in the IMX6DL documentation, but it
> > seems that similar workaround of one write is necessary there.
> > 
> > Some of this was determined by experimentation in conjunction with the
> > errata documentation - I remember it took a while to get it right so
> > that we didn't ever see the magenta line.
> 
> That's interesting. I'll test the different options on my Renesas platform
> (no write, one write, four writes) and see what is needed. Could anyone
> perform the same tests on a Rockchip RK3288 system ?

Daniel Stone has been nice enough to test HDMI output without the errata 
workaround on RK3288 and hasn't noticed any issue. I've performed the same 
test on R-Car H3 and haven't noticed any issue either.

The i.MX6DL and i.MX6Q use a DWC HDMI TX version 1.31a and 1.30a respectively, 
while RK3288 and R-Car H3 uses v2.00a and v2.01a. We could enable the 
workaround based on the HDMI TX version.

-- 
Regards,

Laurent Pinchart

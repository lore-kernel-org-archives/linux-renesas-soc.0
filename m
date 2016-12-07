Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Archit Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 14/22] dt-bindings: display: dw-hdmi: Clean up DT bindings documentation
Date: Wed, 07 Dec 2016 11:53:50 +0200
Message-ID: <3719786.y6Dc2uNlMe@avalon>
In-Reply-To: <20161206211550.oprrw3m76locagfo@rob-hp-laptop>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480635817-1258-15-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161206211550.oprrw3m76locagfo@rob-hp-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Tuesday 06 Dec 2016 15:15:50 Rob Herring wrote:
> On Fri, Dec 02, 2016 at 01:43:29AM +0200, Laurent Pinchart wrote:
> > Make it clear that the core bridge/dw_hdmi.txt document isn't a device
> > tree binding by itself but is meant to be referenced by platform device
> > tree bindings, and update the Rockchip and Freescale DWC HDMI TX
> > bindings to reference it.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  .../devicetree/bindings/display/bridge/dw_hdmi.txt | 85 +++++++----------
> >  .../devicetree/bindings/display/imx/hdmi.txt       | 51 +++++++------
> >  .../bindings/display/rockchip/dw_hdmi-rockchip.txt | 43 +++++++----
> >  3 files changed, 91 insertions(+), 88 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> Really, the ddc-i2c-bus prop needs to move to a connector node, but
> that's a separate problem.

I fully agree. One step at a time though :-)

> We might also want to drop the 'ddc-' part and have a generic way to refer
> to an i2c bus. There's a couple of other cases.

Right, but a DT node might need to refer to multiple I2C buses (probably not 
for connectors though). The ddc- prefix serves a similar purpose than the 
power supply or GPIO name in the *-supply or *-gpios properties.

-- 
Regards,

Laurent Pinchart

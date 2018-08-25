Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46080 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbeHYKPP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Aug 2018 06:15:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id e23-v6so8203884lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 23:37:18 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Sat, 25 Aug 2018 08:37:15 +0200
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Message-ID: <20180825063715.GI1493@bigcity.dyn.berto.se>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
 <12690843.BN01eCh2kh@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12690843.BN01eCh2kh@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent and Jacopo,

On 2018-08-25 02:54:44 +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Monday, 20 August 2018 13:16:34 EEST Jacopo Mondi wrote:
> > Hello renesas list,
> >    this series add supports for the HDMI and CVBS input to R-Car E3 R8A77990
> > Ebisu board.
> > 
> > It's an RFT, as I don't have an Ebisu to test with :(
> > 
> > The series adds supports for the following items:
> > 
> > - PFC: add VIN groups and functions
> > - R-Car VIN and R-Car CSI-2: add support for R8A77990
> > - R8A77990: Add I2C, VIN and CSI-2 nodes
> > - Ebisu: describe HDMI and CVBS inputs
> > 
> > Each patch, when relevant reports difference between the upported BSP patch
> > and the proposed one.
> > 
> > I know Laurent should receive an Ebisu sooner or later, maybe we can sync
> > for testing :)
> 
> I've given the series a first test, and I think a bit more work is needed :-)
> 
> [    1.455533] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
> port@7/endpoint on port 7
> [    1.464683] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
> port@8/endpoint on port 8
> [    1.473728] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
> port@a/endpoint on port 10
> [    1.484835] adv748x 0-0070: chip found @ 0xe0 revision 2143
> [    1.639470] adv748x 0-0070: No endpoint found for txb
> [    1.644653] adv748x 0-0070: Failed to probe TXB

I fear this is a design choice in the adv748x driver. Currently the 
driver requires both of its two CSI-2 transmitters to be connected/used 
else probe fails. Furthermore the HDMI capture is always routed to TXA 
while the analog capture is always routed to TXB.

Now that we have a board where only TXA is connected but both HDMI and 
analog captures are used maybe it's time to do some more work on v4l2 
and the adv748x driver ;-P What's missing:

- Probe should be OK with either TXA or TXB connected and not bail if 
  not both are used.
- The media_device_ops or at least the .link_notify() callback of that 
  struct must be changed so not one driver in the media graph is 
  responsible for all links. In this case rcar-vin provides the callback 
  and rcar-vin should not judge which links between the adv748x 
  subdevices are OK to enable/disable. Currently the links between the 
  adv748x subdevices are immutably enabled to avoid this particular 
  problem.

> 
> > PS: the list of upported patches will be sent separately.
> > 
> > Jacopo Mondi (5):
> >   media: dt-bindings: media: rcar-vin: Add R8A77990 support
> >   media: rcar-vin: Add support for R-Car R8A77990
> >   dt-bindings: media: rcar-csi2: Add R8A77990
> >   media: rcar-csi2: Add R8A77990 support
> >   arm64: dts: renesas: ebisu: Add HDMI and CVBS input
> > 
> > Koji Matsuoka (1):
> >   arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> > 
> > Takeshi Kihara (2):
> >   pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
> >   arm64: dts: r8a77990: Add I2C device nodes
> > 
> >  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
> >  .../bindings/media/renesas,rcar-csi2.txt           |   1 +
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 ++++
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++
> >  drivers/media/platform/rcar-vin/rcar-core.c        |  20 +
> >  drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
> >  drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 504 ++++++++++++++++++
> >  7 files changed, 823 insertions(+)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 

-- 
Regards,
Niklas S�derlund

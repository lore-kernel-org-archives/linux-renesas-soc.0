Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:49786 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbeHYDbg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 23:31:36 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Date: Sat, 25 Aug 2018 02:54:44 +0300
Message-ID: <12690843.BN01eCh2kh@avalon>
In-Reply-To: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Monday, 20 August 2018 13:16:34 EEST Jacopo Mondi wrote:
> Hello renesas list,
>    this series add supports for the HDMI and CVBS input to R-Car E3 R8A77990
> Ebisu board.
> 
> It's an RFT, as I don't have an Ebisu to test with :(
> 
> The series adds supports for the following items:
> 
> - PFC: add VIN groups and functions
> - R-Car VIN and R-Car CSI-2: add support for R8A77990
> - R8A77990: Add I2C, VIN and CSI-2 nodes
> - Ebisu: describe HDMI and CVBS inputs
> 
> Each patch, when relevant reports difference between the upported BSP patch
> and the proposed one.
> 
> I know Laurent should receive an Ebisu sooner or later, maybe we can sync
> for testing :)

I've given the series a first test, and I think a bit more work is needed :-)

[    1.455533] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
port@7/endpoint on port 7
[    1.464683] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
port@8/endpoint on port 8
[    1.473728] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-receiver@70/
port@a/endpoint on port 10
[    1.484835] adv748x 0-0070: chip found @ 0xe0 revision 2143
[    1.639470] adv748x 0-0070: No endpoint found for txb
[    1.644653] adv748x 0-0070: Failed to probe TXB

> PS: the list of upported patches will be sent separately.
> 
> Jacopo Mondi (5):
>   media: dt-bindings: media: rcar-vin: Add R8A77990 support
>   media: rcar-vin: Add support for R-Car R8A77990
>   dt-bindings: media: rcar-csi2: Add R8A77990
>   media: rcar-csi2: Add R8A77990 support
>   arm64: dts: renesas: ebisu: Add HDMI and CVBS input
> 
> Koji Matsuoka (1):
>   arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> 
> Takeshi Kihara (2):
>   pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
>   arm64: dts: r8a77990: Add I2C device nodes
> 
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../bindings/media/renesas,rcar-csi2.txt           |   1 +
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 ++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++
>  drivers/media/platform/rcar-vin/rcar-core.c        |  20 +
>  drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 504 ++++++++++++++++++
>  7 files changed, 823 insertions(+)

-- 
Regards,

Laurent Pinchart

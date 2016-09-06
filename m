Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38736 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755397AbcIFHtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 03:49:08 -0400
Date: Tue, 6 Sep 2016 09:49:02 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFT v2 0/8] Add SDHI to r8a7796/salvator-x
Message-ID: <20160906074901.GE17888@verge.net.au>
References: <1471938590-10650-1-git-send-email-horms+renesas@verge.net.au>
 <2032317.SOiUovHhFZ@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2032317.SOiUovHhFZ@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 06, 2016 at 03:34:41AM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> Thank you for the patches.
> 
> On Tuesday 23 Aug 2016 09:49:42 Simon Horman wrote:
> > Hi,
> > 
> > this patch set updates drivers, documentation and DT to
> > enable SDHI0 & 3 on the r8a7796/salvator-x. This includes
> > defining nodes for all available SDHI and GPIO devices.
> > 
> > I have boot-tested this which seems successful.
> > However, I do not have physical access to an r8a7796/salvator-x board
> > and the one that I have remote access to does not appear to have
> > any SD cards present. I would be grateful of any testing anyone
> > can provide.
> > 
> > Based on renesas-drivers-2016-08-09-v4.8-rc1
> 
> For patches 1/8, 4/8 and 6/8, applied on top of your devel branch (with the 
> gpio-ranges property removed from 6/8 due to the lack of PFC support),
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

> I've tested the patches with ethernet support that uses GPIO-2-11 as an 
> interrupt pin (I'll post the ethernet patches for r8a7796 soon).

Great! I have a use for them and was planing to make some myself.

> > Provided for testing as the topic/r8a7796-sdhi-v2 branch in
> > my renesas tree on kernel.org.
> > 
> > Changes since v1 noted in individual changelogs.
> > Acks from v1 also added.
> > 
> > Ai Kyuse (1):
> >   mmc: sh_mobile_sdhi: Add r8a7796 support
> > 
> > Simon Horman (4):
> >   clk: renesas: r8a7796: Add SDIF clocks
> >   gpio: rcar: Add r8a7796 (R-Car M3-W) support
> >   arm64: dts: r8a7796: add SDHI nodes
> >   arm64: dts: r8a7796: salvator-x: enable SDHI0 & 3
> > 
> > Takeshi Kihara (3):
> >   clk: renesas: r8a7796: Add GPIO clocks
> >   pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions
> >   arm64: dts: r8a7796: Add GPIO device nodes
> > 
> >  .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |   1 +
> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   1 +
> >  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  84 +++++++
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 154 ++++++++++++
> >  drivers/clk/renesas/r8a7796-cpg-mssr.c             |  18 ++
> >  drivers/gpio/gpio-rcar.c                           |   4 +
> >  drivers/mmc/host/sh_mobile_sdhi.c                  |   1 +
> >  drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 275 ++++++++++++++++++
> >  8 files changed, 538 insertions(+)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

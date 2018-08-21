Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:42976 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbeHUTMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 15:12:20 -0400
Date: Tue, 21 Aug 2018 16:51:22 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Kevin Hilman <khilman@kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: bcm2837: tons of DMA mask not set in 4.18.0-rc6-next-20180727
Message-ID: <20180821155121.GZ30658@n2100.armlinux.org.uk>
References: <325098108.159647.1532708245242@email.1und1.de>
 <aee486c9-e503-ce1a-9102-82712be2db62@arm.com>
 <CAMuHMdURr7nLs3d1G4KyM9MCtY2veP2jV6Fid4qhjDyo-A3F7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdURr7nLs3d1G4KyM9MCtY2veP2jV6Fid4qhjDyo-A3F7w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 21, 2018 at 05:45:43PM +0200, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> CC Lee (mfd), Wolfram (i2c), Marek (bd9571wmv + recent da9063 hacking)
> 
> On Fri, Jul 27, 2018 at 6:28 PM Robin Murphy <robin.murphy@arm.com> wrote:
> > On 27/07/18 17:17, Stefan Wahren wrote:
> > > i was noticed that recent linux-next on Raspberry Pi 3 (32 bit) doesn't boot anymore. So i tested todays linux-next with multi_v7_defconfig and i'm getting a lot of DMA mask not set warnings. At least USB dwc2 is broken.
> > >
> > > Any suggestions before i start to bisect?
> >
> > https://patchwork.kernel.org/patch/10547231/
> >
> > Although the upside of this hiccup is that it should give us a fair view
> > of how many active drivers are still relying on implicit default DMA
> > masks - I'm now waiting for kernelci's boot chart to catch up with
> > today's -next to see the full fallout...
> 
> I'm still seeing the following on r8a7791/koelsch with a DA9063 PMIC, which
> is an MFD device:
> 
>     da9063-watchdog da9063-watchdog: DMA mask not set
>     da9063-rtc da9063-rtc: DMA mask not set
> 
> The dma masks (both normal and coherent) are NULL, and inherited from the
> i2c parent device (6-0058):

I think the larger question is: why is the kernel complaining about
an unset DMA mask for a device that does not have any capability to
perform DMA?  Surely the warning is wrong.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 13.8Mbps down 630kbps up
According to speedtest.net: 13Mbps down 490kbps up

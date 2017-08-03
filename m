Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36433 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751941AbdHCBmA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 21:42:00 -0400
Date: Wed, 2 Aug 2017 18:41:57 -0700
From: Greg KH <greg@kroah.com>
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.11
Message-ID: <20170803014157.GB3031@kroah.com>
References: <20170710133049.GB27613@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170710133049.GB27613@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 03:30:50PM +0200, Simon Horman wrote:
> Hi,
> 
> This is a submission to LTSI-v4.9.
> 
> This series is comprised of backports to v4.9 of the following
> components to their standard as of v4.11:
> 
> * adv7511
> * ak4642
> * clk
> * cpg
> * gen3
> * gpio-keys
> * gpio-rcar
> * gpio-regulator
> * i2c-emev2
> * i2c-riic
> * i2c-rcar
> * i2c-sh-mobile
> * ipmu-vmsa
> * m25p80
> * mach-shmobile
> * otsm
> * pci-rcar-gen2
> * pcie-rcar
> * phy-micrel
> * phy-rcar-gen3-usb2
> * ravb
> * rcar-can
> * rcar-canfd
> * rcar-dmac
> * rcar-du
> * rcar-fdp1
> * rcar-gyroadc
> * rcar-snd
> * rspi
> * sata-rcar
> * sh-eth
> * sh-mmcif
> * sh-mobile-sdhi
> * sh-msiof
> * sh-pfc
> * sh-sci
> * simple-scu-card
> * st1232
> * usb3-peri
> * usbhs
> * vsp1
> * xhci-plat
> 
> It is a follow up to early preparatory work the main difference being
> a rebase onto v4.9.36. This is a follow-up to a similar submission
> backporting Renesas SoCs and Drivers to v4.10. I plan to follow-up with
> a backport to v4.12.
> 
> I have tested for build regressions on a wide range of defconfigs
> on a wide range of architectures.
> 
> There are 255 patches.
> 
> This is based on a similar backport to v4.10 which is in turn based on v4.9.36.
> That work was posted as "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.10"
> and is tagged as tags/backport/v4.9.31/snapshot-to-v4.10-flattened
> 
> 
> The following changes since commit e629b8e80ed3dc7817ba8a92d4d8098bc5fdbe65:
> 
>   drm: bridge: add DesignWare HDMI I2S audio support (2017-07-10 14:18:08 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.36/snapshot-to-v4.11-flattened

All now applied, thanks.

greg k-h

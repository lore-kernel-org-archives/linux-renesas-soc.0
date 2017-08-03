Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48526 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdHCBcW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 21:32:22 -0400
Date: Wed, 2 Aug 2017 18:32:19 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9 repost] Renesas SoCs and Drivers
 to v4.10
Message-ID: <20170803013219.GA3031@kroah.com>
References: <20170710131835.GA27613@verge.net.au>
 <20170710132658.GA984@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170710132658.GA984@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 03:26:58PM +0200, Simon Horman wrote:
> [Reposting with correct tag to pull, an old revision was posted by mistake]
> 
> Hi,
> 
> This is a submission to LTSI-v4.9.
> 
> This series is comprised of backports to v4.9 of the following
> components to their standard as of v4.10:
> 
> * adv7511
> * cpg
> * em-sti
> * gen3
> * gpio-keys
> * gpio-regulator
> * i2c-rcar
> * i2c-sh-mobile
> * intc
> * irq-gic
> * mach-shmobile
> * pci-rcar-gen2
> * pcie-rcar
> * phy-micrel
> * phy-rcar-gen3-usb2
> * ravb
> * rcar-can
> * rcar-canfd
> * rcar-dmac
> * rcar-du
> * rcar-fcp
> * rcar-fdp1
> * rcar-rst
> * rcar-snd
> * renesas-soc-id
> * rspi
> * sh-cmt
> * sh-drivers
> * sh-eth
> * sh-mmcif
> * sh-mobile-sdhi
> * sh-msiof
> * sh-pfc
> * sh-sci
> * sh-timers
> * sh-tmu
> * smsc911x
> * sysc
> * usbhs
> * vsp1
> * wm8978
> * xhci-plat
> * xhci-rcar
> 
> Limited backport of the following to provide dependencies for the above:
> * drm
> * fsi
> * phy
> * simple-scu-card
> * soc-device-match
> 
> It is a follow up to early preparatory work the main difference being
> a rebase onto v4.9.36. I plan to follow-up with similar submissions
> backporting Renesas SoCs and Drivers to v4.11 and v4.12.
> 
> I have tested for build regressions on a wide range of defconfigs
> on a wide range of architectures.
> 
> There are 299 patches.
> 
> This is based on of v4.9.36.
> Earlier revisions of this work was based on v4.9.21 and v4.9.31.
> 
> 
> The following changes since commit 9f86f302ec0e37e84617481c587e11c47a397e3f:
> 
>   Linux 4.9.36 (2017-07-05 14:40:44 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.36/snapshot-to-v4.10-flattened

All now pulled and checked in, thanks!

greg k-h

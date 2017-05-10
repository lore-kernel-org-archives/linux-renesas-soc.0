Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53661 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751735AbdEJJOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 05:14:46 -0400
Date: Wed, 10 May 2017 11:14:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/7] R-Car H3 HDMI output DT integration
Message-ID: <20170510091440.GC16496@verge.net.au>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 10, 2017 at 10:04:51AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series contains all the DT changes needed to integrate HDMI output
> support for the H3 Salvator-X board.
> 
> The patches have been rebased on top of Simon's latest devel branch. Conflict
> resolution led to the new 2/7 patch. For convenience, the patches are
> available from
> 
> 	git://linuxtv.org/pinchartl/media.git drm-next-dt-v4-20170510
> 
> Simon, this depends on driver changes that were merged by Linus for v4.12-rc1
> (the checkpatch warnings related to unknown compatible strings will then be
> gone). Could you please apply these patches once you merge v4.12-rc1 in your
> tree ?

Yes, that sounds reasonable. I plan to rebase shortly after v4.12-rc1 is
released. Please feel free to ping me if I forget to queue these up at that
time.

> Koji Matsuoka (1):
>   arm64: dts: renesas: salvator-x: Enable HDMI outputs
> 
> Laurent Pinchart (5):
>   arm64: dts: r8a7796: Add display placeholders
>   arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
>   arm64: dts: r8a7795: salvator-x: Add DU0 and DU3 external dot clocks
>   arm64: dts: r8a7795: salvator-x: Add panel backlight support
>   ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi
>     panels
> 
> Ulrich Hecht (1):
>   arm64: dts: r8a7795: Add HDMI encoder support
> 
>  arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi |   3 +-
>  arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi |   3 +-
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi       |  50 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi       |  22 +++++
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi    | 117 +++++++++++++++++++++++++
>  5 files changed, 193 insertions(+), 2 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

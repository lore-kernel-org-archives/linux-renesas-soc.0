Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11229 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751109AbdESJXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 05:23:43 -0400
Date: Fri, 19 May 2017 14:55:52 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] dmaengine: rcar-dmac: fix resource freeing
 synchronization
Message-ID: <20170519092552.GQ15061@localhost>
References: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170515230917.31888-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 16, 2017 at 01:09:14AM +0200, Niklas S�derlund wrote:
> Hi,
> 
> This series fix resource freeing synchronization by:
> 
> 1. Patch 1/3
>    Store the IRQ number in the global struct so it can be used later
>    together with synchronize_irq().
> 
> 2. Patch 2/3
>    Adding support for the device_synchronize() callback in patch 2/3.
> 
> 3. Patch 3/3
>    Waiting for any ISR that might still be running after the channel is
>    halted prior to freeing its resources. This was patch previously part
>    of a patch sent out by Yoshihiro Shimoda and authored by Hiroyuki
>    Yokoyama, see [1].
> 
>    In that thread it was suggested by Lars-Peter Clausen to instead
>    implement the device_synchronize() callback. Unfortunately this is not
>    enough to solve the issue. In rcar_dmac_free_chan_resources() the
>    channel is halted by a call to rcar_dmac_chan_halt() and then directly
>    moves on to freeing resources, here it is still needed to add a wait
>    for any ISR to finish before freeing the resources, despite that a
>    device_synchronize() have been added.  This is because call chain:
> 
>    dma_release_channel()
>      dma_chan_put()
>        dmaengine_synchronize()
>        rcar_dmac_free_chan_resources()
>          rcar_dmac_chan_halt()
> 
>    Here dmaengine_synchronize() is called prior to rcar_dmac_chan_halt()
>    so an extra synchronisation to wait for any running ISR is still
>    needed.
> 
> By both adding a device_synchronize() which can be used in conjunction
> with device_terminate_all() and fiends and by adding an explicit
> synchronize_irq() when freeing channel resources I feel the
> synchronisation for freeing channel resources are in a much better
> shape. It also solves the issue in the original mail thread.

Applied now, thanks

-- 
~Vinod

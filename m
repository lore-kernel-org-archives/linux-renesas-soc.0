Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:17903 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754416AbdHYGyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 02:54:40 -0400
Date: Fri, 25 Aug 2017 12:28:01 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anton Volkov <avolkov@ispras.ru>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        ldv-project@linuxtesting.org, dmaengine@vger.kernel.org,
        geert+renesas@glider.be
Subject: Re: [PATCH v2] rcar-dmac: initialize all data before registering IRQ
 handler
Message-ID: <20170825065801.GT3053@localhost>
References: <877exxcu9q.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877exxcu9q.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 21, 2017 at 06:31:57AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Anton Volkov noticed that engine->dev is NULL before
> of_dma_controller_register() in probe.
> Thus there might be a NULL pointer dereference in
> rcar_dmac_chan_start_xfer while accessing chan->chan.device->dev which
> is equal to (&dmac->engine)->dev.
> On same reason, same and similar things will happen if we didn't
> initialize all necessary data before calling register irq function.
> To be more safety code, this patch initialize all necessary data
> before calling register irq function.

Applied after adding subsytem name, thanks

-- 
~Vinod

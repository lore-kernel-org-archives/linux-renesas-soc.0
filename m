Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 27 Mar 2017 10:06:53 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        dmaengine@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: enable descriptor mode on 40bit
Message-ID: <20170327043653.GD9308@localhost>
References: <87y3vyndu6.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y3vyndu6.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 22, 2017 at 04:22:36AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> SYS-DMAC can use 40bit address transfer, and it supports Descriptor
> Mode too. Current SYS-DMAC driver disables Descriptor Mode if it was
> 40bit address today. But it can use Descriptor Mode with 40bit if
> transfer Source/Destination address are located in same 4GiB region
> in the 40 bit address space.
> This patch enables it if all condition was clear

Applied, thanks

-- 
~Vinod

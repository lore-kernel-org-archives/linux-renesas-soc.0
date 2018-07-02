Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57353 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752069AbeGBOHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 10:07:37 -0400
Date: Mon, 2 Jul 2018 16:07:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod <vkoul@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org,
        Hiroki Negishi <hiroki.negishi.bx@renesas.com>
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: clear channel register when
 error
Message-ID: <20180702140715.ybj2jtwczunbosrz@verge.net.au>
References: <87sh52fk0a.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sh52fk0a.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 02, 2018 at 02:34:04AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We need to clear channel register in error case as recovery.
> The channel is already stopped in such case, thus we don't need to call
> rcar_dmac_chan_halt() before clearing.
> 
> rcar_dmac_chan_halt() will clear and confirm DE bit.
> But it will be failed because channel is already stopped in error case.
> In other words, we shouldn't call it then.
> 
> Reported-by: Hiroki Negishi <hiroki.negishi.bx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Hiroki Negishi <hiroki.negishi.bx@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

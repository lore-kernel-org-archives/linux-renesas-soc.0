Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933164AbeGIQxB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 12:53:01 -0400
Date: Mon, 9 Jul 2018 22:22:52 +0530
From: Vinod <vkoul@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org,
        Hiroki Negishi <hiroki.negishi.bx@renesas.com>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: clear channel register when
 error
Message-ID: <20180709165252.GG22377@vkoul-mobl>
References: <877emdrwsf.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877emdrwsf.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03-07-18, 00:29, Kuninori Morimoto wrote:
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

Applied, thanks

-- 
~Vinod

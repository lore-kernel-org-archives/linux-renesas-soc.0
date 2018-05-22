Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:43342 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753036AbeEVW6Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 18:58:16 -0400
Date: Tue, 22 May 2018 17:58:13 -0500
From: Rob Herring <robh@kernel.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 2/2] dmaengine: rcar-dmac: Document R8A77990 bindings
Message-ID: <20180522225813.GA7148@rob-hp-laptop>
References: <1526475979-13891-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526475979-13891-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526475979-13891-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 03:06:19PM +0200, Ulrich Hecht wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Renesas R-Car E3 (R8A77990) SoC also has the R-Car gen2/3 compatible DMA
> controllers, so document the SoC specific binding.
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

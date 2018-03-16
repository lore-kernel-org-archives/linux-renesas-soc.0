Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60688 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbeCPIFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 04:05:05 -0400
Date: Fri, 16 Mar 2018 09:05:00 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7790: Add missing TX_ER pin to
 avb_mii group
Message-ID: <20180316080459.pq3eb6r4sellvzkz@verge.net.au>
References: <1520864802-10948-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520864802-10948-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 12, 2018 at 03:26:42PM +0100, Geert Uytterhoeven wrote:
> The pin controller drivers for all R-Car Gen2 SoCs have entries for the
> EtherAVB TX_ER pins in their EtherAVB MII groups, except on R-Car H2.
> 
> Add the missing pin to restore consistency.
> 
> Note that technically TX_ER is an optional signal in the MII bus, and
> thus could have its own group, but this is currently not supported by
> any R-Car Gen2 pin controller driver.
> 
> Fixes: 19ef697d1eb7be06 ("sh-pfc: r8a7790: add EtherAVB pin groups")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> There are no upstream users of EtherAVB MII.
> 
> To be queued im sh-pfc-for-v4.17.

I'm not sure this warrants a fixes tag, but in any case:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

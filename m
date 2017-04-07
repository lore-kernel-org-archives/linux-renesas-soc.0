Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53765 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934208AbdDGO6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 10:58:37 -0400
Date: Fri, 7 Apr 2017 10:58:33 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: r8a7795-salvator-x: Update memory node to 4
 GiB map
Message-ID: <20170407145832.GB1278@verge.net.au>
References: <1491485487-2006-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491485487-2006-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 06, 2017 at 03:31:27PM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch addes memory region:
> 
>   - After changes, the Salvator-X board has the following map:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
>     Bank1: 1GiB RAM : 0x000500000000 -> 0x0053fffffff
>     Bank2: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
>     Bank3: 1GiB RAM : 0x000700000000 -> 0x0073fffffff
> 
>   - Before changes, the old map looked like this:
>     Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This patch is looooong overdue.

Thanks, I have queued this up for v4.13.

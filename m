Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38810 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754180AbcLTKyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:54:31 -0500
Date: Tue, 20 Dec 2016 11:54:25 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH resend] arm64: dts: r8a7796: salvator-x: Update memory
 node to 4 GiB map
Message-ID: <20161220105424.GK19532@verge.net.au>
References: <1481815889-15583-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481815889-15583-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 15, 2016 at 04:31:29PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch updates memory region:
> 
>   - After changes, the new map of the Salvator-X board on R8A7796 SoC
>     Bank0: 2GiB RAM : 0x000048000000 -> 0x000bfffffff
>     Bank1: 2GiB RAM : 0x000600000000 -> 0x0067fffffff
> 
>   - Before changes, the old map looked like this:
>     Bank0: 2GiB RAM : 0x000048000000 -> 0x000bfffffff
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Correct size of old map]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Simon, please apply!
> 
> U-Boot already adds the second memory region to the "reg" property of
> the first memory node in DT, so this patch is actually a no-op.
> IMHO it doesn't make much sense to keep on pretending we don't have
> enabled memory outside the 32-bit address space.

Hi Geert,

I agree with the reasoning above and have queued up this patch for v4.11.

It is a shame that u-boot has enabled this for us as it would have
been nice to retain control of that occuring. But alas it was not to be so.

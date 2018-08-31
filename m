Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52514 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbeHaRrm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 13:47:42 -0400
Date: Fri, 31 Aug 2018 15:40:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add BRG support to SCIF2
Message-ID: <20180831134005.fx4unlmn3tkiw5ug@verge.net.au>
References: <20180830145635.7659-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180830145635.7659-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 04:56:35PM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add the device node for the external SCIF_CLK, and describe the clock
> inputs for the Baud Rate Generator for External Clock (BRG) for SCIF2,
> which can increase serial clock accuracy.
> 
> The presence of the SCIF_CLK crystal and its clock frequency depend on
> the actual board.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Enhance patch description]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note: The Ebisu board does not provide SCIF_CLK.  However, using the BRG
>       increases the serial console's clock accurary from 115200+541 bps
>       to 115200-257 bps.

Thanks Geert, applied for v4.20.

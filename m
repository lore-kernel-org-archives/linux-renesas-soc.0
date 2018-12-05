Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbeLEHcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 02:32:16 -0500
Date: Wed, 5 Dec 2018 13:02:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Williams <dan.j.williams@intel.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: sh: Remove R-Mobile APE6 support
Message-ID: <20181205073207.GC2847@vkoul-mobl>
References: <20181203141806.23232-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203141806.23232-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03-12-18, 15:18, Geert Uytterhoeven wrote:
> Renesas R-Mobile APE6 support is currently unused:
>   - DMA slaves were never enabled in r8a73a4.dtsi,
>   - The driver relies on legacy filter matching and describing all
>     slaves and MID/RIDs in a table, unlike modern DMA engine drivers for
>     similar hardware like rcar-dmac,
>   - The driver doesn't seem to work well.
> 
> Remove the driver, it can be resurrected from git history when needed.
> 
> As this was the last user of SH_DMAE_BASE on Renesas ARM SoCs, the
> sh-dma-engine driver core is now used on SuperH only.

Applied, thanks

-- 
~Vinod

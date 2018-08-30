Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39989 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbeH3SMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:12:01 -0400
Date: Thu, 30 Aug 2018 16:09:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [LOCAL] arm64: defconfig: Refresh renesas_defconfig for
 v4.19-rc1
Message-ID: <20180830140934.kwprk5o6iciriays@verge.net.au>
References: <20180828144615.9851-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828144615.9851-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 04:46:15PM +0200, Geert Uytterhoeven wrote:
> Refresh the defconfig for Renesas R-Car Gen3 boards:
>   - Move options that have moved,
>   - Remove CONFIG_PCIE_DW_PLAT_HOST (auto-disabled),
>   - Remove CONFIG_DEBUG_FS (auto-enabled).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.

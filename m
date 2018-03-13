Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52377 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbeCMSnf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 14:43:35 -0400
Date: Tue, 13 Mar 2018 19:43:31 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas
Message-ID: <20180313184330.67oh6gyjwxv44q2i@verge.net.au>
References: <1520518205-23351-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520518205-23351-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 08, 2018 at 03:10:05PM +0100, Geert Uytterhoeven wrote:
> On R-Car H3, on-chip peripheral modules that can make use of DMA are
> wired to either SYS-DMAC0 only, or to both SYS-DMAC1 and SYS-DMAC2.
> 
> Add the missing DMA properties pointing to SYS-DMAC2 for HSCIF[0-2],
> SCIF[015], and I2C[0-2].  These were initially left out because early
> firmware versions prohibited using SYS-DMAC2.  This restriction has been
> lifted in IPL and Secure Monitor Rev1.0.6 (released on Feb 25, 2016).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

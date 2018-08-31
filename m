Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53645 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbeHaTEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 15:04:54 -0400
Date: Fri, 31 Aug 2018 16:56:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Move arm_cc630p node
Message-ID: <20180831145657.mzujl4suh6hrbrmi@verge.net.au>
References: <20180831085457.3940-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180831085457.3940-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 31, 2018 at 10:54:57AM +0200, Geert Uytterhoeven wrote:
> To preserve by-address-per-group sort order.
> 
> Fixes: 0f6d237cafda2e06 ("arm64: dts: renesas: r8a7795: add ccree to device tree")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert, applied for v4.20.

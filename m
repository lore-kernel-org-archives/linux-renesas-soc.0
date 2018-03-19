Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35238 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751617AbeCSIyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 04:54:03 -0400
Date: Mon, 19 Mar 2018 09:53:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] clk: renesas: Always use readl()/writel()
Message-ID: <20180319085358.mfyjznzxe2n4duwm@verge.net.au>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 16, 2018 at 02:40:14PM +0100, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> On arm32/arm64, there is no reason to use the (soon deprecated)
> clk_readl()/clk_writel(), and the generic readl()/writel() should be
> used in instead.
> 
> Commit 30ad3cf00e94f4a7 ("clk: renesas: rcar-gen3-cpg: Always use
> readl()/writel()") already got rid of them in the R-Car Gen3 clock
> driver, but Stephen noticed that a few new users crept in recently.
> 
> Hence this series fixes that, and replaces all other uses in the Renesas
> clock drivers as a bonus.
> 
> I plan to queue these up in clk-renesas-for-v4.17.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

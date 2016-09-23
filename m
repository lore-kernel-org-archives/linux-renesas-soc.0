Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60793 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760603AbcIWVmE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 17:42:04 -0400
Date: Fri, 23 Sep 2016 14:42:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: renesas: cpg-mssr: Always use readl()/writel()
Message-ID: <20160923214202.GA21232@codeaurora.org>
References: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/23, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The Renesas CPG/MSSR clock drivers use a mix of clk_readl()/clk_writel()
> and readl()/writel() to access the clock registers. Settle on the
> generic readl()/writel().
> 
> I plan to queue this up in clk-renesas-for-v4.10.
> 
> Geert Uytterhoeven (2):
>   clk: renesas: cpg-mssr: Always use readl()/writel()
>   clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c    | 14 +++++++-------
>  drivers/clk/renesas/renesas-cpg-mssr.c |  9 ++++-----
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

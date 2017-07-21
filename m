Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42376 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753111AbdGUUeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 16:34:19 -0400
Date: Fri, 21 Jul 2017 13:34:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: renesas: rcar-gen3: Add divider support for
 PLL1 and PLL3
Message-ID: <20170721203418.GE19878@codeaurora.org>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554409-22423-3-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20, Geert Uytterhoeven wrote:
> On some R-Car Gen3 SoCs (e.g. R-Car D3), PLL1 and PLL3 use a divider
> value different from one.  Extend struct rcar_gen3_cpg_pll_config to handle
> this.  As all multipliers and dividers are small, table size increase
> can be kept limited by storing them in u8s instead of unsigned ints,
> which saves ca. 0.5 KiB for a generic kernel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

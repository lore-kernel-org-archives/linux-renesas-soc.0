Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42422 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753111AbdGUUeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 16:34:22 -0400
Date: Fri, 21 Jul 2017 13:34:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: renesas: rcar-gen3: Add support for SCCG/Clean
 peripheral clocks
Message-ID: <20170721203421.GF19878@codeaurora.org>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554409-22423-4-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20, Geert Uytterhoeven wrote:
> On R-Car Gen3 SoCs with a Spread Spectrum Clock Generator (e.g. R-Car
> D3), a peripheral clock divider has been added, to select between clean
> and spread spectrum parents.
> 
> Add a new clock type to the R-Car Gen3 driver core to handle this.
> To avoid increasing the size of struct cpg_core_clk, both parents and
> dividers are stored in the existing parent resp. div fields.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

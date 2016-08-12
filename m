Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52259 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751207AbcHLBQu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 11 Aug 2016 21:16:50 -0400
Date: Thu, 11 Aug 2016 18:16:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix SD clocks
Message-ID: <20160812011648.GN2996@codeaurora.org>
References: <1470814183-17834-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470814183-17834-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/10, Geert Uytterhoeven wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> According to the datasheet, SDn clocks are from the SDSRC clock. And
> the SDSRC has a 1/2 divider. So, we should have ".sdsrc" as an internal
> core clock. Otherwise, since the sdhi driver will calculate clock for
> a sd card using the wrong parent clock rate, and then performance will
> be not good.
> 
> Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: stable@vger.kernel.org
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

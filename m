Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54424 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdHWWmR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 18:42:17 -0400
Date: Wed, 23 Aug 2017 15:42:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.14
Message-ID: <20170823224216.GH21656@codeaurora.org>
References: <1502958542-2900-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502958542-2900-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/17, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
> 
>   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.14-tag1
> 
> for you to fetch changes up to c29f82951b974f27e0bc4ce2525db164f86f2e4d:
> 
>   clk: renesas: r8a7796: Add USB3.0 clock (2017-08-17 09:22:26 +0200)
> 
> ----------------------------------------------------------------
> A bit delayed due to holidays, but here they are!
> 
> clk: renesas: Updates for v4.14
> 
>   - Add more module clocks for R-Car V2H and M3-W,
>   - Add support for the R-Car Gen3 USB 2.0 clock selector PHY,
>   - Add support for the new R-Car D3 SoC,
>   - Allow compile-testing of all (sub)drivers now all dummy infrastructure
>     is available,
>   - Small fixes and cleanups.
> 

Thanks. Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

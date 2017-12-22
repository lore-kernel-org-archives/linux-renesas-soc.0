Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57294 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753035AbdLVAdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 19:33:35 -0500
Date: Thu, 21 Dec 2017 16:33:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.16
Message-ID: <20171222003333.GU7997@codeaurora.org>
References: <1513330717-16712-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513330717-16712-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/15, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
> 
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.16-tag1
> 
> for you to fetch changes up to 7aff266552d6042b43d3d5a9b13f0009ef862033:
> 
>   clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend (2017-12-14 16:40:36 +0100)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v4.16
> 
>   - Add support for the LVDS module clock on R-Car V3M,
>   - Keep wakeup sources in Clock Domains active during system suspend,
>     which will allow removing workarounds from drivers later.
> 
> Thanks for pulling!
> 
> P.S. There seems to be issues with kernel.org mirrorring. I can't see my
>      tag in the public repo, but the clk-renesas-for-v4.16 branch is
>      up-to-date (last change 18 hours ago).

Thanks. Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

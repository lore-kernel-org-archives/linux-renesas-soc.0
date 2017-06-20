Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46322 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbdFTBGd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 21:06:33 -0400
Date: Mon, 19 Jun 2017 18:06:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Use of_device_get_match_data()
 helper
Message-ID: <20170620010631.GA4493@codeaurora.org>
References: <1497012583-24328-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1497012583-24328-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/09, Geert Uytterhoeven wrote:
> If CONFIG_OF=n:
> 
>     drivers/clk/renesas/renesas-cpg-mssr.c: In function ‘cpg_mssr_probe’:
>     drivers/clk/renesas/renesas-cpg-mssr.c:702: warning: dereferencing ‘void *’ pointer
>     drivers/clk/renesas/renesas-cpg-mssr.c:702: error: request for member ‘data’ in something not a structure or union
> 
> To fix this, use the of_device_get_match_data() helper, for which a
> dummy version is provided if CONFIG_OF=n.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

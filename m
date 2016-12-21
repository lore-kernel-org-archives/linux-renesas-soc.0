Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34710 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755383AbcLUW4g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Dec 2016 17:56:36 -0500
Date: Wed, 21 Dec 2016 14:56:34 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: renesas: mstp: Support 8-bit registers for
 r7s72100
Message-ID: <20161221225634.GJ5423@codeaurora.org>
References: <20161215170027.28411-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161215170027.28411-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/15, Chris Brandt wrote:
> The RZ/A1 is different than the other Renesas SOCs because the MSTP
> registers are 8-bit instead of 32-bit and if you try writing values as
> 32-bit nothing happens...meaning this driver never worked for r7s72100.
> 
> Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39327 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933028AbdEKOpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 10:45:38 -0400
Date: Thu, 11 May 2017 16:45:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Correct pwm, gpio, and i2c parent
 clocks on ES2.0
Message-ID: <20170511144534.GB21895@verge.net.au>
References: <1494496275-2433-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494496275-2433-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 11, 2017 at 11:51:15AM +0200, Geert Uytterhoeven wrote:
> Cfr. the errata of April 14, 2017, for the R-Car Gen3 Hardware Manual
> Rev. 0.53E.
> 
> These have no user-visible effect, as the clock frequencies stay the
> same.
> 
> Fixes: 5573d194128b4733 ("clk: renesas: r8a7795: Add support for R-Car H3 ES2.0")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v4.13.

This matches the documentation I have.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

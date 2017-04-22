Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47422 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425937AbdDVCKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2017 22:10:45 -0400
Date: Fri, 21 Apr 2017 19:10:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: cs2000: Fix the setting of saved_rate during the
 resume process
Message-ID: <20170422021043.GD7065@codeaurora.org>
References: <1492624001-3758-12-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492624001-3758-12-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/20, Yoshihiro Kaneko wrote:
> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> 
> In the resume process, there is the case that other drivers call
> cs2000_enable before cs2000_resume is called. Since the order of
> resume process is not guaranteed, it is needed to reset the clk
> rate in any cases before cs2000 is used.
> 
> Also, the current cs2000 driver is using resume_early function.
> The using .resume_early is bad idea because the dependency with
> other drivers is to be complicated.
> 
> This patch adds to reset the clk rate in cs2000_enable and
> changes to use from .resume_early to .resume.
> 
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---

Was this supposed to be sent as a series? This is the second
patch in the series? 

In what situation does a driver call clk_prepare() on the clocks
in here before the device's resume callback is called? I would
think that any devices that use the clks provided by this driver
would be probe defered until the clks are registered, so they
would be later in the suspend/resume list than this clk driver?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41182 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755303AbdDFXLy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Apr 2017 19:11:54 -0400
Date: Thu, 6 Apr 2017 16:11:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Magnus <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cs-2000-cp: keep Reserved bit on each register
Message-ID: <20170406231152.GT7065@codeaurora.org>
References: <87y3vfxw3q.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y3vfxw3q.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/05, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thus CS2000 datasheet is indicating below, this patch
> follows it.
> 
> WARNING: All "Reserved" registers must maintain their default
>          state to ensure proper functional operation.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

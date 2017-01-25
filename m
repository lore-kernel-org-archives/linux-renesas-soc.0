Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35965 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbdAYQoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 11:44:06 -0500
Date: Wed, 25 Jan 2017 17:44:00 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: renesas: r8a7795/r8a7796: Add IIC-DVFS clock
Message-ID: <20170125164359.GA12042@verge.net.au>
References: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 25, 2017 at 12:19:32PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series, pulled from the rcar-3.5.1 BSP, adds the module
> clocks for IIC-DVFS on the R-Car H3 and M3-W SoCs.
> 
> As this is a dependency for Suspend-to-RAM, I plan to queue this in
> clk-renesas-for-v4.11.
> 
> Thanks for your comments!

Acked-by: Simon Horman <horms+renesas@verge.net.au>

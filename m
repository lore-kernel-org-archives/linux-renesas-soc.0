Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56352 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754138AbeE1JNN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:13:13 -0400
Date: Mon, 28 May 2018 11:13:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add Watchdog Timer controller node
 using RCLK Watchdog Timer
Message-ID: <20180528091308.waeg3rnd732tyroy@verge.net.au>
References: <1527078995-4259-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527078995-4259-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 09:36:35PM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add a device node for the Watchdog Timer (WDT) controller on the Renesas
> R-Car M3N (R8A77965) SoC.
> 
> Based on a similar patch of the R8A7796 device tree
> by Geert Uytterhoeven <geert+renesas@glider.be>.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

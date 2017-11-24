Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35330 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753362AbdKXKgF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 05:36:05 -0500
Date: Fri, 24 Nov 2017 10:35:37 +0000
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Increase the number of GPIO bank 1
 ports to 29
Message-ID: <20171124103536.agz62grf37cyacom@verge.net.au>
References: <1511434730-5723-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511434730-5723-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 23, 2017 at 11:58:50AM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch changes the number of GPIO bank 1 ports to 29 because GP-1-28
> port pin of R8A7795 ES2.0 SoC support was added.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 291e0c4994d0813f ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
> [geert: Keep 28 GPIOs on H3 ES1.x after r8a7795.dtsi sharing]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.16.

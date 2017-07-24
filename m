Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33861 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbdGXUJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 16:09:17 -0400
Date: Mon, 24 Jul 2017 15:09:15 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: renesas: cpg-mssr: Add R8A77995 support
Message-ID: <20170724200915.ylyvovphokrqn4e2@rob-hp-laptop>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500554409-22423-5-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 20, 2017 at 02:40:09PM +0200, Geert Uytterhoeven wrote:
> Add R-Car D3 (R8A77995) Clock Pulse Generator / Module Standby and
> Software Reset support, using the CPG/MSSR driver core and the common
> R-Car Gen3 CPG code.
> 
> Based on the R-Car Series, 3rd Generation Hardware User's Manual, Rev.
> 0.55, Jun. 30, 2017.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: devicetree@vger.kernel.org
> ---
> Notes:
>   - I couldn't verify the parent clocks of all module clocks.
>     For e.g. SYS-DMAC and some multimedia devices, I looked at how
>     related clocks were changed among R-Car H3, M3-W, and D3.
>   - For now, R clock handling is hardwired to internal RCLK.
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
>  6 files changed, 251 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c

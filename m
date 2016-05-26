Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51975 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752740AbcEZCfw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 25 May 2016 22:35:52 -0400
Date: Thu, 26 May 2016 11:35:49 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W
Message-ID: <20160526023548.GA20224@verge.net.au>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wed, May 04, 2016 at 04:35:39PM +0200, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> This patch series adds initial support for the Clock Pulse Generator and
> Module Standby and Software Reset modules on the Renesas R-Car M3-W
> SoC:
>   - Basic core clocks,
>   - SCIF2 (console) module clock,
>   - INTC-AP (GIC) module clock (disabled pending CLK_ENABLE_HAND_OFF).
> 
> Support for more core and module clocks will be added incrementally.

I am wondering about the status of this patchset vis a vis mainline.

I would like to queue up "[PATCH v3 0/3] arm64: Add Renesas R8A7796 SoC
support" for v4.8 but I'd prefer to do so only if there is a good chance
that this patch-set, which is provides run-time dependency, will also be in
v4.8.

Thanks!

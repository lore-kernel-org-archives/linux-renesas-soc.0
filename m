Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59642 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdAWJXg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:23:36 -0500
Date: Mon, 23 Jan 2017 10:23:31 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] ARM/arm64: dts: renesas: Link ARM GIC to clock and
 clock domain
Message-ID: <20170123092330.GF31651@verge.net.au>
References: <1484657360-13101-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484657360-13101-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 17, 2017 at 01:49:16PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series improves the topology description in DT of the ARM GIC
> on Renesas SoCs using the CPG/MSSR bindings (R-Car Gen3 and RZ/G).
> It links the GIC to its module clock, and adds it to the SYSC "always
> on" PM Domain.
> 
> Note that currently the GIC-400 driver doesn't support module clocks nor
> Runtime PM, so this must be handled as a critical clock.
> As the CPG/MSSR driver, unlike the legacy MSTP driver, is already aware
> of critical clocks, this series can be applied right now.

Hi Geert,

does the note above imply that "[PATCH 0/2] clk: renesas: Use
CLK_IS_CRITICAL to handle critical clocks" is a dependency of this series?

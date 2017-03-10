Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49258 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934202AbdCJJWG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 04:22:06 -0500
Date: Fri, 10 Mar 2017 10:21:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] ARM: dts: renesas: Add INTC-SYS clock to device
 tree
Message-ID: <20170310092159.GE21820@verge.net.au>
References: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 06, 2017 at 05:58:05PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series improves the topology description in DT of the ARM GIC
> on Renesas SoCs using the legacy CPG/MSTP bindings (R-Mobile APE6 and
> R-Car Gen2).  It describes the INTC-SYS clock, links the GIC to its
> module clock, and adds the GIC to the SYSC "always on" PM Domain.
> 
> Note that currently the GIC-400 driver doesn't support module clocks nor
> Runtime PM, so this must be handled as a critical clock.  Hence this
> series depends on commit e34084fb9a023d1d ("clk: renesas: mstp: Make
> INTC-SYS a critical clock"), which is in v4.11-rc1.
> 
> This series is the counterpart of "[PATCH 0/4] ARM/arm64: dts: renesas:
> Link ARM GIC to clock and clock domain" for SoCs not yet migrated to the
> new CPG/MSSR driver.  The latter is already part of v4.11-rc1 as it had
> less dependencies.
> 
> Changes compared to v1:
>   - Add missing "power-domains" property,
>   - Add clock-names property,
>   - Rebased on top of CPG Clock Domain and R-Car SYSC PM Domain support,
>   - Add r8a7792 patch,
>   - Please refer to the individual patch changelogs for more details
>     (v1 dates back to 2014).
> 
> Thanks for applying!

Thanks, done.

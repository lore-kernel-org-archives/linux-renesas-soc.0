Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45247 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964945AbeEITIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 15:08:24 -0400
Date: Wed, 9 May 2018 21:08:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: r8a77970: Add SMP Support
Message-ID: <20180509190804.l6luktwhrfeasspc@verge.net.au>
References: <1525879403-12207-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525879403-12207-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 09, 2018 at 05:23:21PM +0200, Geert Uytterhoeven wrote:
>         Hi Simon, Magnus,
> 
> This patch series enables SMP support on the R-Car V3M SoC, by adding
> the second Cortex-A53 CPU core.  It also adds the performance monitor
> unit, and links it to both CPU cores.
> 
> Changes compared to v1:
>   - Adjust GIC_CPU_MASK_SIMPLE(),
>   - Use symbolic core clock and power domain indices,
>   - Move the pmu node from the soc subnode to the root node, as it
>     doesn't have registers.
> 
> Note that the PSCI implementation on Eagle may be a preliminary version
> with some familiar quirks:
>   - SMP bringup works, and both CPUs can be used,
>   - Offlining CPU0 crashes the system,
>   - CPU1 can be offlined, but trying to bring it online again crashes
>     the system, too.
> 
> I'm confident these will be fixed in future firmware versions, just like
> on H3/Salvator-X.  Note that
> git@github.com:renesas-rcar/arm-trusted-firmware.git does not have
> support for R-Car V3M, V3H, and D3.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   arm64: dts: renesas: r8a77970: Add secondary CA53 CPU core
>   arm64: dts: renesas: r8a77970: Add Cortex-A53 PMU node

Thanks, applied.

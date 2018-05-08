Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54915 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932145AbeEHNfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 09:35:44 -0400
Date: Tue, 8 May 2018 15:35:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] ARM: dts: renesas: Correct mask for GIC PPI
 interrupts
Message-ID: <20180508133540.rxzqxulzagmnz2kc@verge.net.au>
References: <1525699193-5589-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525699193-5589-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 07, 2018 at 03:19:51PM +0200, Geert Uytterhoeven wrote:
>         Hi Simon, Magnus,
> 
> R-Car H2 and R-Mobile APE6 contain four Cortex-A15 and four Cortex-A7
> cores, hence the second interrupt specifier cell for Private Peripheral
> Interrupts should use "GIC_CPU_MASK_SIMPLE(8)", to make sure interrupts
> can be delivered to all 8 processor cores.
> 
> This brings the predecessors of R-Car Gen3 in line with what we're doing
> on other big.LITTLE SoCs, like R-Car H3 and M3-W.

Thanks, applied.

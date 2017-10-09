Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48038 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbdJIHZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:25:50 -0400
Date: Mon, 9 Oct 2017 09:25:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: renesas: Add INTC-EX device node on
 R-Car M3-W, V3M, and D3
Message-ID: <20171009072518.GQ17360@verge.net.au>
References: <1507291553-24396-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507291553-24396-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 02:05:50PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds device nodes for the Interrupt Controller for
> External Devices (INTC-EX) to the DT sources for the R-Car M3-W, V3M, and
> D3 SoCs.
> 
> This has been tested on Salvator-X with R-Car M3-W.
> (FWIW, I also tested on Salvator-XS with H3 ES2.0).
> 
> The compatible values used depend on the DT binding update "[PATCH]
> dt-bindings: irqchip: renesas-irqc: Document R-Car M3-W, V3M, D3 support",
> but they are non-controversial.
> 
> Actual use may depend on pinctrl patches (e.g. "[PATCH 2/3] pinctrl:
> sh-pfc: r8a7796: Add support for INTC-EX IRQ pins").
> 
> Thanks!
> 
> Geert Uytterhoeven (3):
>   arm64: dts: r8a7796: Add INTC-EX device node
>   arm64: dts: r8a77970: Add INTC-EX device node
>   arm64: dts: r8a77995: Add INTC-EX device node

Thanks, applied.

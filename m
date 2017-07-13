Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49331 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751782AbdGMIUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:20:48 -0400
Date: Thu, 13 Jul 2017 10:20:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: shmobile: rcar-gen2: Add support for CPG/MSSR
 bindings
Message-ID: <20170713082043.GO5580@verge.net.au>
References: <1499855972-22126-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499855972-22126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 12, 2017 at 12:39:32PM +0200, Geert Uytterhoeven wrote:
> When using the new CPG/MSSR bindings, there is no longer a
> "renesas,rcar-gen2-cpg-clocks" node, and the code to obtain the external
> clock crystal frequency falls back to a default of 20 MHz.
> While this is correct for all upstream R-Car Gen2 and RZ/G1 boards, this
> is not necessarily the case for out-of-tree third party boards.
> 
> Add support for finding the external clock crystal oscillator on RZ/G1M,
> and on R-Car H2, M2-W, and M2-N using the new CPG/MSSR bindings, through
> the corresponding "renesas,r8a77xx-cpg-mssr" nodes.
> 
> Note that this is not needed on R-Car V2H and E2, and on RZ/G1E, as on
> those SoCs the arch_timer and generic counter clock is derived from the
> ZS clock instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop RZ/G1E,
>   - Add support for R-Car H2, M2-W, and M2-N.

Thanks, applied for v4.14.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49278 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbdGMISR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:18:17 -0400
Date: Thu, 13 Jul 2017 10:18:12 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7796: Add missing second pair of DMA
 names to MSIOF nodes
Message-ID: <20170713081811.GN5580@verge.net.au>
References: <1499855753-21630-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499855753-21630-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 12, 2017 at 12:35:53PM +0200, Geert Uytterhoeven wrote:
> MSIOF0 and MSIOF1 are tied to two DMA controllers through two pairs of
> DMA specifiers.  However, the second pair of corresponding DMA names was
> missing.
> 
> Fixes: 80fab06e258da762 ("arm64: dts: r8a7796: Add all MSIOF nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied for v4.14.

Let me know if you would prefer it handled as a fix for v4.13.
I see the commit it fixes was part of v4.11.

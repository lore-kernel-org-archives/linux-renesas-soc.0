Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36408 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbeEVIzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 04:55:03 -0400
Date: Tue, 22 May 2018 10:54:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add SMP support
Message-ID: <20180522085459.4khvdbjbg5tw3rf5@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <ec4c6905-23d1-8600-a1cc-4297fbd1ddaa@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4c6905-23d1-8600-a1cc-4297fbd1ddaa@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 17, 2018 at 11:19:44PM +0300, Sergei Shtylyov wrote:
> Add the device nodes for 3 more Cortex-A53 CPU cores; adjust the interrupt
> delivery masks for the ARM GIC and Architectured Timer.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'renesas-devel-20180516v2-v4.17-rc5' tag of Simon
> Horman's 'renesas.git' repo. Tested successfully on the V3M Starter Kit board
> (except offlining CPU0 hangs the kernel).

This looks fine but I will wait to see if there are other reviews completed
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

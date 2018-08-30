Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40102 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbeH3SUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:20:24 -0400
Date: Thu, 30 Aug 2018 16:17:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: renesas: Remove the ARCH_SHMOBILE Kconfig
 symbol
Message-ID: <20180830141758.2eo2fijrdn2pbovy@verge.net.au>
References: <20180828151011.14065-1-geert+renesas@glider.be>
 <20180828151011.14065-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828151011.14065-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 05:10:11PM +0200, Geert Uytterhoeven wrote:
> The Kconfig symbol for Renesas 64-bit ARM SoCs has always been
> ARCH_RENESAS, with ARCH_SHMOBILE being selected to reuse drivers shared
> with Renesas 32-bit ARM and/or Renesas SuperH SH-Mobile SoCs.
> 
> Commit 9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS")
> started the conversion from ARCH_SHMOBILE to ARCH_RENESAS for Renesas
> 32-bit SoCs.  Now all drivers for Renesas ARM SoCs have gained proper
> ARCH_RENESAS platform dependencies, there is no longer a need to select
> ARCH_SHMOBILE.
> 
> With ARCH_SHMOBILE gone, move the ARCH_RENESAS section up, to restore
> alphabetical sort order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks Geert, applied for v4.20.

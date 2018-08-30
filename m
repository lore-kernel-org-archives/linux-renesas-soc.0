Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40046 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbeH3SP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:15:57 -0400
Date: Thu, 30 Aug 2018 16:13:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig
 symbol
Message-ID: <20180830141332.4x3hhpt5vbomy7cu@verge.net.au>
References: <20180828151011.14065-1-geert+renesas@glider.be>
 <20180828151011.14065-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828151011.14065-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 05:10:10PM +0200, Geert Uytterhoeven wrote:
> All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
> platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
> to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
> 9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks Geert, applied for v4.20.

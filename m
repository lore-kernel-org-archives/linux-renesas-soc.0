Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55972 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbeEDNFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 09:05:18 -0400
Date: Fri, 4 May 2018 15:05:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add eeprom
Message-ID: <20180504130514.zenoustzfcy4oicv@verge.net.au>
References: <20180429182639.6243-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180429182639.6243-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 29, 2018 at 08:26:39PM +0200, Wolfram Sang wrote:
> Add the EEPROM found on Salvator-X and -XS boards for H3, M3-W, and M3-N
> on the IIC_DVFS bus.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Always nice for I2C debugging to have en EEPROM around...

Thanks, applied.

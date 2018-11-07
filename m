Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57416 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbeKGUtb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:49:31 -0500
Date: Wed, 7 Nov 2018 12:19:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Message-ID: <20181107111932.s5z6xoivcebwehfs@verge.net.au>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 06, 2018 at 09:46:47PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC
> and enables SD card slot connected to SDHI0, micro SD card slot
> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board
> using the R8A77990 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Deduplicated regular and UHS pins
>     - Added sdhi3_ds pin pinmux
> V3: - Squash two patches, one adding SDHI nodes to R8A77990 E3 DTSI
>       and another enabling them on E3 Ebisu, together.
> ---
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 130 ++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  36 +++++
>  2 files changed, 166 insertions(+)

Thanks, applied for v4.21.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50986 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751551AbdIRIN5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 04:13:57 -0400
Date: Mon, 18 Sep 2017 10:13:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: initial Eagle board device
 tree
Message-ID: <20170918081338.GD4644@verge.net.au>
References: <20170915194445.950496886@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170915194445.950496886@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 15, 2017 at 10:43:25PM +0300, Sergei Shtylyov wrote:
> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
> The board has 1 debug serial port (SCIF0); include support for it,
> so that the serial console can work.
> 
> Based on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/Makefile           |    1 
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   45 +++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/Makefile
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/Makefile
> +++ renesas/arch/arm64/boot/dts/renesas/Makefile
> @@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-sa
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
>  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb

Please consider submitting a patch to enable CONFIG_ARCH_R8A77970
in the ARM64 defconfig.

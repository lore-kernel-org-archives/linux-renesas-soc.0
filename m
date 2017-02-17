Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58516 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934101AbdBQSHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 13:07:53 -0500
Date: Fri, 17 Feb 2017 18:07:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: r8a7795: Add Cortex-A53 CPU cores
Message-ID: <20170217180734.GA25876@leverpostej>
References: <1487343849-32616-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487343849-32616-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Fri, Feb 17, 2017 at 04:04:09PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds Cortex-A53 CPU cores to r8a7795 SoC for a total of 8
> cores (4 x Cortex-A57 + 4 x Cortex-A53).

>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-affinity = <&a57_0>,
>  					     <&a57_1>,
>  					     <&a57_2>,
> -					     <&a57_3>;
> +					     <&a57_3>,
> +					     <&a53_0>,
> +					     <&a53_1>,
> +					     <&a53_2>,
> +					     <&a53_3>;
>  		};

This isn't quite right; the A53 cores should have a separate PMU node.

The PMU hardware is different across microarchitectures, and they must
be handled separately.

Thanks,
Mark.

Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 4 Jun 2018 12:33:02 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: condor: specify EtherAVB PHY IRQ
Message-ID: <20180604103302.f5kx5fqhbl3ohfpi@verge.net.au>
References: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
 <21578b79-7ba0-b3a6-ae45-7e9ffbb7c8db@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21578b79-7ba0-b3a6-ae45-7e9ffbb7c8db@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 01, 2018 at 11:45:55PM +0300, Sergei Shtylyov wrote:
> Specify EtherAVB PHY IRQ in the Condor board's device tree, now that
> we have the GPIO support (previously phylib had to resort to polling).
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -59,6 +59,8 @@
>  	phy0: ethernet-phy@0 {
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;

I don't see this documented. Perhaps I'm missing something obvious.
Or you have some extra information or newer documentation?

Also, given Olof Johansson's recent comments in ("Re: [GIT PULL] Renesas
ARM64 Based SoC DT Updates for v4.18") please consider squashing this patch
and the following one.

>  	};
>  };
>  
> 

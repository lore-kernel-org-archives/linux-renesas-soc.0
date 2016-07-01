Return-Path: <kieranbingham@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: add FDP1 device nodes
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org
References: <1467293563-940-1-git-send-email-kieran@bingham.xyz>
 <1467293563-940-3-git-send-email-kieran@bingham.xyz>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
 catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Kieran Bingham <kieran@bingham.xyz>
Message-ID: <57768023.8010507@bingham.xyz>
Date: Fri, 1 Jul 2016 15:37:23 +0100
MIME-Version: 1.0
In-Reply-To: <1467293563-940-3-git-send-email-kieran@bingham.xyz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

The bindings for this have now been acked by RobH.

--
Cheers

Kieran

On 30/06/16 14:32, Kieran Bingham wrote:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
> --
> changes for v2
>  - channel labels dropped
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index a451bd217f05..8bc87e09efd7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1443,5 +1443,32 @@
>  			clocks = <&cpg CPG_MOD 613>;
>  			power-domains = <&sysc R8A7795_PD_A3VP>;
>  		};
> +
> +		fdp1@fe940000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe940000 0 0x2400>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 119>;
> +			power-domains = <&sysc R8A7795_PD_A3VP>;
> +			renesas,fcp = <&fcpf0>;
> +		};
> +
> +		fdp1@fe944000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe944000 0 0x2400>;
> +			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 118>;
> +			power-domains = <&sysc R8A7795_PD_A3VP>;
> +			renesas,fcp = <&fcpf1>;
> +		};
> +
> +		fdp1@fe948000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe948000 0 0x2400>;
> +			interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 117>;
> +			power-domains = <&sysc R8A7795_PD_A3VP>;
> +			renesas,fcp = <&fcpf2>;
> +		};
>  	};
>  };
> 

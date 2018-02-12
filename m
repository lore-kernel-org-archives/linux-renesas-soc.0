Subject: Re: [PATCH v2 2/5] arm64: dts: renesass: r8a77970: add VSPD support
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms@verge.net.au>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
 <20180208154720.5766-3-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <53aba7f8-a873-581a-6159-24d24a8a2f3b@ideasonboard.com>
Date: Mon, 12 Feb 2018 12:58:58 +0000
MIME-Version: 1.0
In-Reply-To: <20180208154720.5766-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, and Sergei,

On 08/02/18 15:47, Niklas Söderlund wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Describe VSPD0 in the R8A77970 device tree; it will be used by DU in
> the next patch...
> 
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Seems odd that the interrupts here are so distant on the V3M platform vs the
others ... but the data sheets agree.

Registers, interrupt, CPG values reviewed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 2567e68fe0c6cf7b..5eb5d4b26f955671 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -620,6 +620,16 @@
>  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>  			resets = <&cpg 603>;
>  		};
> +
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x4000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 623>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 623>;
> +			renesas,fcp = <&fcpvd0>;
> +		};
>  	};
>  
>  	timer {
> 

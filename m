Return-Path: <devicetree-owner@vger.kernel.org>
Date: Fri, 28 Apr 2017 09:24:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r7s72100: add usb clocks to device tree
Message-ID: <20170428072434.GD10196@verge.net.au>
References: <20170427191045.21199-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170427191045.21199-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 27, 2017 at 12:10:45PM -0700, Chris Brandt wrote:
> This adds the USB0 and USB1 clocks to the device tree.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi            | 6 +++---
>  include/dt-bindings/clock/r7s72100-clock.h | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)

Hi Chris,

could you break the .h patch out into a separate patch so that I can apply
it to my dt-bindings branch? The reason for that branch is to allow better
management of dependencies; something I got burnt by a few releases back.

> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index fb54cb5d3fad..4ed12a4d9d51 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -144,9 +144,9 @@
>  			#clock-cells = <1>;
>  			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
>  			reg = <0xfcfe0430 4>;
> -			clocks = <&b_clk>;
> -			clock-indices = <R7S72100_CLK_ETHER>;
> -			clock-output-names = "ether";
> +			clocks = <&b_clk>, <&p1_clk>, <&p1_clk>;
> +			clock-indices = <R7S72100_CLK_ETHER R7S72100_CLK_USB0 R7S72100_CLK_USB1>;
> +			clock-output-names = "ether", "usb0", "usb1";

The above looks fine to me although I was unable to find the USB parent
clock in the documentation I have available.

>  		};
>  
>  		mstp8_clks: mstp8_clks@fcfe0434 {
> diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
> index bc256d31099a..dcd2072151fc 100644
> --- a/include/dt-bindings/clock/r7s72100-clock.h
> +++ b/include/dt-bindings/clock/r7s72100-clock.h
> @@ -34,6 +34,8 @@
>  
>  /* MSTP7 */
>  #define R7S72100_CLK_ETHER	4
> +#define R7S72100_CLK_USB0	1
> +#define R7S72100_CLK_USB1	0
>  
>  /* MSTP8 */
>  #define R7S72100_CLK_MMCIF	4

The above also looks fine to me.

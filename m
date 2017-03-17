Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:59647 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbdCQPQS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 11:16:18 -0400
Date: Fri, 17 Mar 2017 16:16:08 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] ARM: dts: r7s72100: add rtc clock to device tree
Message-ID: <20170317151608.onw67v4qv746albh@piout.net>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170316175112.27913-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 16/03/2017 at 13:51:10 -0400, Chris Brandt wrote:

You should always include a commit message.

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi            | 9 +++++++++
>  include/dt-bindings/clock/r7s72100-clock.h | 3 +++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index ed62e19..2a42a79 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -117,6 +117,15 @@
>  			clock-output-names = "ostm0", "ostm1";
>  		};
>  
> +		mstp6_clks: mstp6_clks@fcfe042c {
> +			#clock-cells = <1>;
> +			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> +			reg = <0xfcfe042c 4>;
> +			clocks = <&p0_clk>;
> +			clock-indices = <R7S72100_CLK_RTC>;
> +			clock-output-names = "rtc0";
> +		};
> +
>  		mstp7_clks: mstp7_clks@fcfe0430 {
>  			#clock-cells = <1>;
>  			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
> index cd2ed51..bc256d3 100644
> --- a/include/dt-bindings/clock/r7s72100-clock.h
> +++ b/include/dt-bindings/clock/r7s72100-clock.h
> @@ -29,6 +29,9 @@
>  #define R7S72100_CLK_OSTM0	1
>  #define R7S72100_CLK_OSTM1	0
>  
> +/* MSTP6 */
> +#define R7S72100_CLK_RTC	0
> +
>  /* MSTP7 */
>  #define R7S72100_CLK_ETHER	4
>  
> -- 
> 2.10.1
> 
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

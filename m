Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36634 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713AbcHOR4J (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 13:56:09 -0400
Received: by mail-wm0-f53.google.com with SMTP id q128so102002980wma.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2016 10:56:09 -0700 (PDT)
Subject: Re: [PATCH 19/26] ARM: dts: r8a7794: add MSTP5 clocks
To: Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1471251169.git.horms+renesas@verge.net.au>
 <2a29f9d6fea82485941449c2328af5b2a4ea636f.1471251169.git.horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <13739ec4-3e12-4b8d-9f69-14fbbe164986@cogentembedded.com>
Date: Mon, 15 Aug 2016 20:56:05 +0300
MIME-Version: 1.0
In-Reply-To: <2a29f9d6fea82485941449c2328af5b2a4ea636f.1471251169.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 08/15/2016 11:55 AM, Simon Horman wrote:

> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Add some MSTP5 clocks to the R8A7794 device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/r8a7794.dtsi            | 9 +++++++++
>  include/dt-bindings/clock/r8a7794-clock.h | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 5d1fded79633..1c2d3846d70e 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -1204,6 +1204,15 @@
>  			clock-indices = <R8A7794_CLK_IRQC>;
>  			clock-output-names = "irqc";
>  		};
> +		mstp5_clks: mstp5_clks@e6150144 {
> +			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
> +			reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
> +			clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;

    Argh! Looks like I forgot to remove <&extal_clk> when removing the thermal 
clock... will send the patch.

> +			#clock-cells = <1>;
> +			clock-indices = <R8A7794_CLK_AUDIO_DMAC0
> +					 R8A7794_CLK_PWM>;
> +			clock-output-names = "audmac0", "pwm";
> +		};
>  		mstp7_clks: mstp7_clks@e615014c {
>  			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
>  			reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
[...]

MBR, Sergei

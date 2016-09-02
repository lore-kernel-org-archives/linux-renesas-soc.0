Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36400 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752147AbcIBMiG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 08:38:06 -0400
Received: by mail-lf0-f42.google.com with SMTP id g62so82592436lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 05:38:05 -0700 (PDT)
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <159bb1fc-aa36-d30f-5064-b61efa34c663@cogentembedded.com>
Date: Fri, 2 Sep 2016 15:38:00 +0300
MIME-Version: 1.0
In-Reply-To: <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 9/2/2016 3:05 PM, Vladimir Barinov wrote:

> This supports SSI sound for H3ULCB board.
> SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - added comment for audio_clkout
>
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 +++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index bbd7928..a254231 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -45,6 +45,12 @@
>  		};
>  	};
>
> +	x12_clk: x12_clk {

    If the crystal name is X12, name the node "x12" too, this way the output 
clock will be named just "x12".

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
> +
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
>  		compatible = "regulator-fixed";
>
[...]
> @@ -136,6 +176,73 @@
[...]
> +
> +	cs2000: clk_multiplier@4f {

    Don't use underscores in the node names, use hyphens instead.

> +		#clock-cells = <0>;
> +		compatible = "cirrus,cs2000-cp";
> +		reg = <0x4f>;
> +		clocks = <&audio_clkout>, <&x12_clk>;
> +		clock-names = "clk_in", "ref_clk";
> +
> +		assigned-clocks = <&cs2000>;
> +		assigned-clock-rates = <24576000>; /* 1/1 divide */
> +	};
> +};
[...]

MBR, Sergei

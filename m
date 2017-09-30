Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:43267 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750933AbdI3KgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Sep 2017 06:36:20 -0400
Received: by mail-lf0-f42.google.com with SMTP id 93so1447948lft.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Sep 2017 03:36:20 -0700 (PDT)
Subject: Re: [PATCH 22/48] ARM: dts: gr-peach: Add user led device nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
 <cfce5ac1aaf08fc0920d6572779360f80e8f3489.1506683482.git.horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e2e2b3a5-23b2-7f11-4fb3-2f835fdbc11a@cogentembedded.com>
Date: Sat, 30 Sep 2017 13:36:18 +0300
MIME-Version: 1.0
In-Reply-To: <cfce5ac1aaf08fc0920d6572779360f80e8f3489.1506683482.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 9/29/2017 2:53 PM, Simon Horman wrote:

> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add device nodes for user leds on gr-peach board.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>   arch/arm/boot/dts/r7s72100-gr-peach.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> index bcfa6445bbaa..13d745bb56a5 100644
> --- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
> +++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
[...]
> @@ -51,6 +52,15 @@
>   			reg = <0x00600000 0x00200000>;
>   		};
>   	};
> +
> +leds {

    Not indented properly...

> +		status = "okay";
> +		compatible = "gpio-leds";
> +
> +		led1 {
> +			gpios = <&port6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
>   };
>   
>   &pinctrl {

MBR, Sergei

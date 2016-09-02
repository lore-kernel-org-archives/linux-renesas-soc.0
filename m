Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34896 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932495AbcIBQ2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 12:28:34 -0400
Received: by mail-lf0-f46.google.com with SMTP id e198so53820110lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 09:28:33 -0700 (PDT)
Subject: Re: [PATCH v4 1/4] arm64: dts: h3ulcb: enable GPIO leds
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817909-11901-1-git-send-email-vladimir.barinov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e5033864-e7b0-8bbd-ba6f-af20e2232b6e@cogentembedded.com>
Date: Fri, 2 Sep 2016 19:28:30 +0300
MIME-Version: 1.0
In-Reply-To: <1472817909-11901-1-git-send-email-vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 09/02/2016 03:05 PM, Vladimir Barinov wrote:

> This supports GPIO leds on H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - removed led4 in favor of gpio-keys
> - added label
>
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index fb694b8..3329f78 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -31,6 +31,19 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led5 {
> +			label = "LED5";

    Do we need the "label" prop? Based on the feedback to my former LED 
patches, no?

> +			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +		led6 {
> +			label = "LED6";
> +			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
>  };
>
>  &extal_clk {

MBR, Sergei

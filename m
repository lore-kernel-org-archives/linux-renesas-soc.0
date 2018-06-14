Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44029 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755131AbeFNLmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 07:42:35 -0400
Received: by mail-lf0-f68.google.com with SMTP id n15-v6so8892305lfn.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jun 2018 04:42:35 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] ARM: dts: Renesas R9A06G032 pinctrl node
To: Michel Pollet <michel.pollet@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528974029-29617-5-git-send-email-michel.pollet@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7e9eefe0-5310-5925-3b00-b75800e6d87e@cogentembedded.com>
Date: Thu, 14 Jun 2018 14:42:32 +0300
MIME-Version: 1.0
In-Reply-To: <1528974029-29617-5-git-send-email-michel.pollet@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 06/14/2018 02:00 PM, Michel Pollet wrote:

> This provides a pinctrl driver for the Renesas R9A06G032 SoC
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 3e45375..fbad039 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -88,6 +88,14 @@
>  			status = "disabled";
>  		};
>  
> +		pinctrl: pinctrl@40067000 {

   "pin-controller@..." please, it's looking more generic.

> +			compatible = "renesas,r9a06g032-pinctrl";
> +			reg = <0x40067000 0x1000>, <0x51000000 0x800>;
> +			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> +			clock-names = "bus";
> +			status = "okay";
> +		};
> +
>  		gic: gic@44101000 {
>  			compatible = "arm,cortex-a7-gic", "arm,gic-400";
>  			interrupt-controller;

MBR, Sergei

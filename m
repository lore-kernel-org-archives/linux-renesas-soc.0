Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:49574 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751637AbdJKVkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 17:40:55 -0400
Received: by mail-wm0-f68.google.com with SMTP id b189so8331994wmd.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 14:40:54 -0700 (PDT)
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: Add BD9571 PMIC
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
References: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6bd27673-84c7-2cc0-8090-aee903c53240@gmail.com>
Date: Wed, 11 Oct 2017 23:39:27 +0200
MIME-Version: 1.0
In-Reply-To: <1507647516-28993-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/10/2017 04:58 PM, Geert Uytterhoeven wrote:
> Add a device node for the ROHM BD9571MWV PMIC, based on the example in
> the DT binding documentation, but using INTC-EX instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Do we need to describe more regulators?

To my knowledge, no.

> This depends on:
>   - [PATCH] pinctrl: sh-pfc: r8a7796: Add support for INTC-EX IRQ pins,
>   - [PATCH] pinctrl: sh-pfc: r8a7795: Add INTC-EX pins, groups and
>     function.
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index 3dcb26b1cb6bdec0..c171718bac7f52a1 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -353,6 +353,30 @@
>  
>  &i2c_dvfs {
>  	status = "okay";
> +
> +	pmic: pmic@30 {
> +		pinctrl-0 = <&irq0_pins>;
> +		pinctrl-names = "default";
> +
> +		compatible = "rohm,bd9571mwv";
> +		reg = <0x30>;
> +		interrupt-parent = <&intc_ex>;

Shouldn't this be gpio2 ? Why intc-ex ?

> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		regulators {
> +			dvfs: dvfs {
> +				regulator-name = "dvfs";
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <1030000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
>  };
>  
>  &ohci0 {
> @@ -407,6 +431,11 @@
>  		function = "i2c2";
>  	};
>  
> +	irq0_pins: irq0 {
> +		groups = "intc_ex_irq0";
> +		function = "intc_ex";
> +	};
> +
>  	pwm1_pins: pwm1 {
>  		groups = "pwm1_a";
>  		function = "pwm1";
> 


-- 
Best regards,
Marek Vasut

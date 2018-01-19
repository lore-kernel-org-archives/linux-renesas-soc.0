Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43891 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754070AbeASIfE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:35:04 -0500
Received: by mail-lf0-f65.google.com with SMTP id o89so1109291lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:35:04 -0800 (PST)
Subject: Re: [PATCH/RFC 02/03] arm64: dts: renesas: r8a77970: Add GPIO nodes
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
 <151630244944.14098.3965935014147421681.sendpatchset@little-apple>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9313185b-d70f-5b81-17d8-4693267abc79@cogentembedded.com>
Date: Fri, 19 Jan 2018 11:35:01 +0300
MIME-Version: 1.0
In-Reply-To: <151630244944.14098.3965935014147421681.sendpatchset@little-apple>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1/18/2018 10:07 PM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add GPIO device nodes for the r8a77970 SoC. Each GPIO device is
> currently assumed to have 32 pins.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
[...]

    Already posted as well:

https://patchwork.kernel.org/patch/10056695/

> --- 0002/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-01-19 03:45:15.990607110 +0900
> @@ -248,6 +248,102 @@
>   			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
>   		};
>   
> +		gpio0: gpio@e6050000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6050000 0 0x50>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 0 32>;

			gpio-ranges = <&pfc 0 0 22>;

> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 912>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 912>;
> +		};
> +
> +		gpio1: gpio@e6051000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6051000 0 0x50>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 32 32>;

			gpio-ranges = <&pfc 0 32 28>;

> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 911>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 911>;
> +		};
> +
> +		gpio2: gpio@e6052000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6052000 0 0x50>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 64 32>;

			gpio-ranges = <&pfc 0 64 17>;

> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 910>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 910>;
> +		};
> +
> +		gpio3: gpio@e6053000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6053000 0 0x50>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 96 32>;

			gpio-ranges = <&pfc 0 96 17>;


> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 909>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 909>;
> +		};
> +
> +		gpio4: gpio@e6054000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6054000 0 0x50>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 128 32>;

			gpio-ranges = <&pfc 0 128 6>;

> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 908>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 908>;
> +		};
> +
> +		gpio5: gpio@e6055000 {
> +			compatible = "renesas,gpio-r8a77970",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6055000 0 0x50>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 160 32>;
> +			#interrupt-cells = <2>;

			gpio-ranges = <&pfc 0 160 15>;

> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 907>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 907>;
> +		};
> +
>   		hscif0: serial@e6540000 {
>   			compatible = "renesas,hscif-r8a77970",
>   				     "renesas,rcar-gen3-hscif",
> 

MBR, Sergei

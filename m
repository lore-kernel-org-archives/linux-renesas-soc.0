Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33297 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbdAURjC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2017 12:39:02 -0500
Received: by mail-lf0-f51.google.com with SMTP id k86so74184540lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jan 2017 09:39:02 -0800 (PST)
Subject: Re: [PATCH v2 2/3] ARM: dts: r7s72100: add ostm to device tree
To: Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20170120212055.4157-1-chris.brandt@renesas.com>
 <20170120212055.4157-3-chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4db44120-aa9f-2cb4-aad7-2baa8fcfe7c0@cogentembedded.com>
Date: Sat, 21 Jan 2017 20:38:59 +0300
MIME-Version: 1.0
In-Reply-To: <20170120212055.4157-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/21/2017 12:20 AM, Chris Brandt wrote:

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * wrap clock lines to avoid 80 char max
> * split into 2 separate channel nodes
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index d5946df..47b2165 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -505,4 +505,20 @@
>  		cap-sdio-irq;
>  		status = "disabled";
>  	};
> +
> +	ostm0: ostm@fcfec000 {

    According to devicetree.org, the node name should be generic, i.e. 
"timer@...".

> +		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +		reg = <0xfcfec000 0x30>;
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
> +		status = "disabled";
> +	};
> +
> +	ostm1: ostm@fcfec400 {

    Likewise.

> +		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
> +		reg = <0xfcfec400 0x30>;
> +		interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
> +		clocks = <&mstp5_clks R7S72100_CLK_OSTM1>;
> +		status = "disabled";
> +	};
>  };

MBR, Sergei

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35359 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbdAMJJC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 04:09:02 -0500
Received: by mail-lf0-f46.google.com with SMTP id m78so31774683lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2017 01:09:01 -0800 (PST)
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add ostm DT support
To: Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20170112190108.2856-1-chris.brandt@renesas.com>
 <20170112190108.2856-4-chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a8716dcf-8f1d-a3d5-57ac-7380b4a57949@cogentembedded.com>
Date: Fri, 13 Jan 2017 12:08:54 +0300
MIME-Version: 1.0
In-Reply-To: <20170112190108.2856-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/12/2017 10:01 PM, Chris Brandt wrote:

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
[...]
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 247bbe0..974c084 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -513,7 +513,8 @@
>  		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
>  			      GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
>
> -		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
> +		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>,
> +			 <&mstp5_clks R7S72100_CLK_OSTM1>;

    Unintended change?

>  		status = "disabled";
>  	};
>  };

MBR, Sergei

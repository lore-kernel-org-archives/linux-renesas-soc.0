Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39913 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731821AbeGTR1b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 13:27:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id a134-v6so2215978lfe.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 09:38:26 -0700 (PDT)
Subject: Re: [PATCH 1/9] ARM: dts: porter: Add missing PMIC nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
References: <cover.1532086734.git.horms+renesas@verge.net.au>
 <5058a96cb7e8dca97629c48084537fe5def8344f.1532086734.git.horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8312c88f-9ff8-454e-fad9-7bf403c28207@cogentembedded.com>
Date: Fri, 20 Jul 2018 19:38:24 +0300
MIME-Version: 1.0
In-Reply-To: <5058a96cb7e8dca97629c48084537fe5def8344f.1532086734.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/20/2018 03:05 PM, Simon Horman wrote:

> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Add PMIC nodes to Porter and connect CPU DVFS supply. There is
> one DA9063L and one DA9210 on Porter, the only difference from
> the other boards is that DA9063L is at I2C address 0x5a rather
> than 0x58 .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/r8a7791-porter.dts | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
> index a01101b49d99..5f77d73d7462 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -375,10 +375,43 @@
>  	clock-frequency = <400000>;
>  };
>  
> +&i2c6 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	pmic@5a {
> +		compatible = "dlg,da9063l";
> +		reg = <0x5a>;
> +		interrupt-parent = <&irqc0>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;

   Without a label and #interrupt-cells?

> +
> +		wdt {
> +			compatible = "dlg,da9063-watchdog";
> +		};
> +	};
[...]

MBR, Sergei

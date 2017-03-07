Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33847 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754973AbdCGJ1c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 04:27:32 -0500
Received: by mail-lf0-f43.google.com with SMTP id k202so84108355lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2017 01:27:26 -0800 (PST)
Subject: Re: [PATCH v2 1/6] ARM: dts: r8a73a4: Add INTC-SYS clock to device
 tree
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
References: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
 <1488819491-26097-2-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <183720b2-003c-efb6-e4b6-5e6151da46fe@cogentembedded.com>
Date: Tue, 7 Mar 2017 12:27:23 +0300
MIME-Version: 1.0
In-Reply-To: <1488819491-26097-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/6/2017 7:58 PM, Geert Uytterhoeven wrote:

> Link the ARM GIC to the INTC-SYS module clock and the C4 power domain,
> so it can be power managed using that clock in the future.
>
> Note that currently the GIC-400 driver doesn't support module clocks nor
> Runtime PM, so this must be handled as a critical clock.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add missing "power-domains" property,
>   - Add clock-names property,
>   - Drop RFC status,
>   - Change one-line summary prefix to match current arm-soc practices,
>   - s/GIC driver/GIC-400 driver/,
>   - Document critical clock dependency.
> ---
>  arch/arm/boot/dts/r8a73a4.dtsi            | 13 +++++++++----
>  include/dt-bindings/clock/r8a73a4-clock.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
> index 6fb7eaba91262edf..1f5c9f6dddba9366 100644
> --- a/arch/arm/boot/dts/r8a73a4.dtsi
> +++ b/arch/arm/boot/dts/r8a73a4.dtsi
> @@ -467,6 +467,9 @@
>  			<0 0xf1004000 0 0x2000>,
>  			<0 0xf1006000 0 0x2000>;
>  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		clocks = <&mstp4_clks R8A73A4_CLK_INTC_SYS>;
> +		clock-names = "clk";

    Do we really need such "clock-names"?

[...]

MBR, Sergei

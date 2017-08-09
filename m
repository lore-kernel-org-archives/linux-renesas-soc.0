Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36276 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752465AbdHIJRK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 05:17:10 -0400
Received: by mail-lf0-f42.google.com with SMTP id o85so25322328lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Aug 2017 02:17:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
Date: Wed, 9 Aug 2017 12:17:06 +0300
MIME-Version: 1.0
In-Reply-To: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8/8/2017 3:46 PM, Biju Das wrote:

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch has been tested against Linux-next tag 20170727 and renesas-dev branch.
> This patch depends on https://www.spinics.net/lists/arm-kernel/msg599220.html
> 
>   arch/arm/boot/dts/r8a7743.dtsi | 55 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 14222c72..5c2b140 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
[...]
> @@ -436,6 +439,58 @@
>   			status = "disabled";
>   		};
>   
> +		i2c6: i2c@e60b0000 {

    I'd use iic0 as the label.

> +			/* doesn't need pinmux */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "renesas,iic-r8a7743",
> +				     "renesas,rcar-gen2-iic",
> +				     "renesas,rmobile-iic";
> +			reg = <0 0xe60b0000 0 0x425>;
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 926>;
> +			dmas = <&dmac0 0x77>, <&dmac0 0x78>,
> +			       <&dmac1 0x77>, <&dmac1 0x78>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg CPG_MOD 926>;

    CPG_MOD not needed here, it's not a "clocks" prop.

[...]

MBR, Sergei

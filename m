Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35333 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246AbcGBRHF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 2 Jul 2016 13:07:05 -0400
Received: by mail-lf0-f49.google.com with SMTP id l188so94788701lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Jul 2016 10:07:04 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r8a7792: add PFC support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
References: <2144803.0K8qXzjIFq@wasted.cogentembedded.com>
 <7894702.b5qeLxoHdo@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c0aad99a-ca5d-4f4a-408b-2d305fa6bab5@cogentembedded.com>
Date: Sat, 2 Jul 2016 20:07:00 +0300
MIME-Version: 1.0
In-Reply-To: <7894702.b5qeLxoHdo@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 07/01/2016 02:06 AM, Sergei Shtylyov wrote:

> Define the generic R8A7792 part of the PFC device node.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  arch/arm/boot/dts/r8a7792.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
> +++ renesas/arch/arm/boot/dts/r8a7792.dtsi
> @@ -108,6 +108,12 @@
>  			#power-domain-cells = <1>;
>  		};
>
> +

    Just noticed this extra empty line... :-/

> +		pfc: pin-controller@e6060000 {
> +			compatible = "renesas,pfc-r8a7792";
> +			reg = <0 0xe6060000 0 0x144>;
> +		};
> +
>  		dmac0: dma-controller@e6700000 {
>  			compatible = "renesas,dmac-r8a7792",
>  				     "renesas,rcar-dmac";

    Will repost.

MBR, Sergei

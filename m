Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34156 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1168582AbcKAL1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 07:27:13 -0400
Received: by mail-lf0-f53.google.com with SMTP id b81so123616002lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2016 04:27:12 -0700 (PDT)
Subject: Re: [PATCH/RFC 4/5] arm64: dts: r8a7796: Enable ipmmu_ds0 and
 ipmmu_mm
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
References: <1477933702-13423-1-git-send-email-geert+renesas@glider.be>
 <1477933702-13423-5-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e3922d22-eb18-0260-c57f-1b9b85b09678@cogentembedded.com>
Date: Tue, 1 Nov 2016 14:27:10 +0300
MIME-Version: 1.0
In-Reply-To: <1477933702-13423-5-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 10/31/2016 8:08 PM, Geert Uytterhoeven wrote:

> Enable the IPMMU for Ethernet AVB.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index f6d15805b75031bb..dc416c300968b0e2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -303,7 +303,7 @@
>  			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
>  			renesas,ipmmu-main = <&ipmmu_mm 0>;
>  			#iommu-cells = <1>;
> -			status = "disabled";
> +			status = "okay";
>  		};
>
>  		ipmmu_ds1: mmu@e7740000 {
> @@ -320,7 +320,7 @@
>  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
>  			#iommu-cells = <1>;
> -			status = "disabled";
> +			status = "okay";

    You could just omit the "status" prop in .dtsi -- the result should be the 
same.

[...]

MBR, Sergei

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36600 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbdAZJvE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 04:51:04 -0500
Received: by mail-lf0-f49.google.com with SMTP id z134so142695211lff.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 01:51:03 -0800 (PST)
Subject: Re: [RFC 5/5] arm: dts: genmai: Add SCIF2 pin group
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-6-git-send-email-jacopo+renesas@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4c60f795-d8af-5b3d-f632-a013a9a33be1@cogentembedded.com>
Date: Thu, 26 Jan 2017 12:51:03 +0300
MIME-Version: 1.0
In-Reply-To: <1485367787-8109-6-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1/25/2017 9:09 PM, Jacopo Mondi wrote:

> Add  TxD and RxD pin configuration for SCIF2 serial communication
> interface on r7s72100 Genmai board.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100-genmai.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
> index 118a8e2..ea649c7 100644
> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
[...]
> @@ -34,6 +35,18 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  	};
> +
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&scif2_pins>;
> +
> +	scif2_pins: serial2 {
> +		/* P3_0 as TxD2; P3_2 as RxD2 */
> +		renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,

    The comma should be after the vendor prefix ("renesas").

MBR, Sergei

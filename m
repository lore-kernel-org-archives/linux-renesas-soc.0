Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:33647 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752513AbcKOP2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 10:28:36 -0500
Received: by mail-qt0-f175.google.com with SMTP id p16so74582736qta.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2016 07:28:36 -0800 (PST)
Subject: Re: [PATCH 09/10] arm64: dts: r8a7795: add HDMI support to DU
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1478884066-1090-10-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7f4f8ac0-c1c4-df74-fad2-12e93983623c@cogentembedded.com>
Date: Tue, 15 Nov 2016 18:28:31 +0300
MIME-Version: 1.0
In-Reply-To: <1478884066-1090-10-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 11/11/2016 08:07 PM, Ulrich Hecht wrote:

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 34 ++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 811c32e..d9e5706 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -147,6 +147,30 @@
>  		clock-frequency = <0>;
>  	};
>
> +	programmable_clk0: clock_out0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	x21_clk: x21-clock {

    Please name it just x21 to math the documentation -- this will be 
reflected in the output clock name.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	x22_clk: x22-clock {

    Same here.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
> +	programmable_clk1: clock_out1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&gic>;
[...]

MBR, Sergei

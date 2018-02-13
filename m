Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42508 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964846AbeBMNyZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 08:54:25 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: lager: Move cec_clock to root node
Date: Tue, 13 Feb 2018 15:54:56 +0200
Message-ID: <7974005.brYq9PAmLL@avalon>
In-Reply-To: <1518529245-30286-1-git-send-email-geert+renesas@glider.be>
References: <1518529245-30286-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Tuesday, 13 February 2018 15:40:45 EET Geert Uytterhoeven wrote:
> cec-clock is a fixed clock generator that is not controlled by i2c-12
> and thus should not be a child of the i2c-12 bus node. Rather, it should
> be a child of the root node of the DT.
> 
> Fixes: c5aa87977626e778 ("ARM: dts: lager: Add CEC clock for HDMI
> transmitter")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7790-lager.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts
> b/arch/arm/boot/dts/r8a7790-lager.dts index
> b42579ea7a50d47c..3c66366f7c550034 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -247,6 +247,12 @@
>  		};
>  	};
> 
> +	cec_clock: cec-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12000000>;
> +	};
> +
>  	hdmi-out {
>  		compatible = "hdmi-connector";
>  		type = "a";
> @@ -352,12 +358,6 @@
>  			};
>  		};
> 
> -		cec_clock: cec-clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <12000000>;
> -		};
> -
>  		hdmi@39 {
>  			compatible = "adi,adv7511w";
>  			reg = <0x39>;

-- 
Regards,

Laurent Pinchart

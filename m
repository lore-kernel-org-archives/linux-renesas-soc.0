Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43414 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964915AbeBMOEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 09:04:34 -0500
Received: by mail-lf0-f65.google.com with SMTP id q69so7359880lfi.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 06:04:33 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 13 Feb 2018 15:04:31 +0100
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: lager: Move cec_clock to root node
Message-ID: <20180213140431.GC18618@bigcity.dyn.berto.se>
References: <1518529245-30286-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1518529245-30286-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your patch.

On 2018-02-13 14:40:45 +0100, Geert Uytterhoeven wrote:
> cec-clock is a fixed clock generator that is not controlled by i2c-12
> and thus should not be a child of the i2c-12 bus node. Rather, it should
> be a child of the root node of the DT.
> 
> Fixes: c5aa87977626e778 ("ARM: dts: lager: Add CEC clock for HDMI transmitter")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a7790-lager.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> index b42579ea7a50d47c..3c66366f7c550034 100644
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
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund

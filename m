Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58686 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbeIFNxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 09:53:03 -0400
Date: Thu, 6 Sep 2018 11:18:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995-draak: Add MSIOF ch2
 pins support
Message-ID: <20180906091827.jauhvbq6cudanlzl@verge.net.au>
References: <1536092527-5950-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536092527-5950-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 05:22:07AM +0900, Yoshihiro Kaneko wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> This patch adds support for MSIOF ch2 pinctrl to use the LVDS Control
> Connector (CN41) for the Draak board on the R8A77995 SoC.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [ykaneko0929@gmail.com: deleted the unused reference to 'msiof_ref_clk']
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Hi Kaneko-san,

sorry about this but I think we should drop this patch as
it is my understanding that msiof2 is not used on the Draak board.

> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.
> 
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index a8e8f26..e60b1e4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -135,6 +135,12 @@
>  		function = "i2c1";
>  	};
>  
> +	msiof2_pins: spi2 {
> +		groups = "msiof2_clk", "msiof2_sync_b",
> +			 "msiof2_rxd",  "msiof2_txd";
> +		function = "msiof2";
> +	};
> +
>  	pwm0_pins: pwm0 {
>  		groups = "pwm0_c";
>  		function = "pwm0";
> @@ -371,3 +377,10 @@
>  		};
>  	};
>  };
> +
> +&msiof2 {
> +	pinctrl-0 = <&msiof2_pins>;
> +	pinctrl-names = "default";
> +	/* In case of using this node, please enable this property */
> +	/* status = "okay"; */
> +};
> -- 
> 1.9.1
> 

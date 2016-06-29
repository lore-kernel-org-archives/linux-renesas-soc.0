Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57281 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565AbcF2IUm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 04:20:42 -0400
Subject: Re: [PATCH 3/3] arm64: dts: r8a7795: salvator: enable UHS for SDHI 0
 & 3
To: Wolfram Sang <wsa@the-dreams.de>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
 <1465229307-1961-4-git-send-email-wsa@the-dreams.de>
CC: <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <e34fd0e6-603b-584b-0aa6-09aa46ada041@de.bosch.com>
Date: Wed, 29 Jun 2016 10:20:38 +0200
MIME-Version: 1.0
In-Reply-To: <1465229307-1961-4-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 06.06.2016 18:08, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index abb25cfc20bd57..726426693f1fa0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -229,11 +229,25 @@
>  	sdhi0_pins: sd0 {
>  		groups = "sdhi0_data4", "sdhi0_ctrl";
>  		function = "sdhi0";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi0_pins_uhs: sd0_uhs {
> +		groups = "sdhi0_data4", "sdhi0_ctrl";
> +		function = "sdhi0";
> +		power-source = <1800>;
>  	};
>
>  	sdhi3_pins: sd3 {
>  		groups = "sdhi3_data4", "sdhi3_ctrl";
>  		function = "sdhi3";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi3_pins_uhs: sd3_uhs {
> +		groups = "sdhi3_data4", "sdhi3_ctrl";
> +		function = "sdhi3";
> +		power-source = <1800>;
>  	};
>
>  	sound_pins: sound {
> @@ -374,25 +388,29 @@
>
>  &sdhi0 {
>  	pinctrl-0 = <&sdhi0_pins>;
> -	pinctrl-names = "default";
> +	pinctrl-1 = <&sdhi0_pins_uhs>;
> +	pinctrl-names = "default", "state_uhs";
>
>  	vmmc-supply = <&vcc_sdhi0>;
>  	vqmmc-supply = <&vccq_sdhi0>;
>  	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
>  	wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
>  	bus-width = <4>;
> +	sd-uhs-sdr50;
>  	status = "okay";
>  };
>
>  &sdhi3 {
>  	pinctrl-0 = <&sdhi3_pins>;
> -	pinctrl-names = "default";
> +	pinctrl-1 = <&sdhi3_pins_uhs>;
> +	pinctrl-names = "default", "state_uhs";
>
>  	vmmc-supply = <&vcc_sdhi3>;
>  	vqmmc-supply = <&vccq_sdhi3>;
>  	cd-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
>  	wp-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
>  	bus-width = <4>;
> +	sd-uhs-sdr50;
>  	status = "okay";
>  };


Could you kindly share the recent status of the MMC support for RCar3? 
Esp. the eMMC support on the Salvator-X? From time to time I get this 
question from several people ;)


Best regards

Dirk

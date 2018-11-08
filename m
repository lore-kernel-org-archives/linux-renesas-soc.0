Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:35221 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbeKHXMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 18:12:31 -0500
Subject: Re: [PATCH 3/4] arm64: renesas: ulcb-kf: add pcm3168 sound codec
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>
CC: Magnus <magnus.damm@gmail.com>, <linux-renesas-soc@vger.kernel.org>
References: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
 <87bm70e3rc.wl-kuninori.morimoto.gx@renesas.com>
From: Jiada Wang <jiada_wang@mentor.com>
Message-ID: <12136bb6-d0af-bdb8-f288-345c733499d7@mentor.com>
Date: Thu, 8 Nov 2018 22:36:30 +0900
MIME-Version: 1.0
In-Reply-To: <87bm70e3rc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san

with the TDM Split patch-set you sent earlier in community,
together with this DTS change set,
I am able to test TDM Split mode,
just some minor findings.

On 2018/11/08 10:59, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> KingFisher has pcm3168 sound codec. This patch enables it.
> Because pcm3168 can't handle symmetric channel on playback/
> capture, we need to handle it as different DAI.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 151 +++++++++++++++++++++++++++++++
>   1 file changed, 151 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 1b316d79..fdd625d 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -6,11 +6,50 @@
>    * Copyright (C) 2017 Cogent Embedded, Inc.
>    */
>   
> +/*
> + * SSI-PCM3168A
> + *	aplay   -D plughw:0,2 xxx.wav
> + *	arecord -D plughw:0,3 xxx.wav
> + */
> +
>   / {
>   	aliases {
>   		serial1 = &hscif0;
>   		serial2 = &scif1;
>   	};
> +
> +	clk8snd: clk8snd {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
This is the same clock as cs2000, why not directly refer to &cs2000 from 
clksndsel,
otherwise, if snd_soc_rcar is loaded after snd_soc_pcm3168a_i2c,
load of snd_soc_pcm3168a_i2c fails with
"[    8.412356] pcm3168a 15-0044: Failed to reset device: -6"
and sound cards can not be created

Thanks,
Jiada
> +
> +	clksnd: clksnd {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <22579200>;
> +	};
> +
> +	clksndsel: clksndsel {
> +		#clock-cells = <0>;
> +		compatible = "gpio-mux-clock";
> +		clocks = <&clk8snd>, <&clksnd>;
> +		select-gpios = <&gpio_exp_75 13 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	snd_3p3v: regulator-snd_3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "snd-3.3v";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	snd_vcc5v: regulator-snd_vcc5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "snd-vcc5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
>   };
>   
>   &can0 {
> @@ -44,6 +83,7 @@
>   };
>   
>   &i2c2 {
> +	/* U11 */
>   	gpio_exp_74: gpio@74 {
>   		compatible = "ti,tca9539";
>   		reg = <0x74>;
> @@ -53,6 +93,13 @@
>   		interrupt-parent = <&gpio6>;
>   		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
>   
> +		audio_out_off {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>; /* P00 */
> +			output-high;
> +			line-name = "Audio_Out_OFF";
> +		};
> +
>   		hub_pwen {
>   			gpio-hog;
>   			gpios = <6 GPIO_ACTIVE_HIGH>;
> @@ -80,8 +127,16 @@
>   			output-high;
>   			line-name = "OTG EXTLPn";
>   		};
> +
> +		snd_rst {
> +			gpio-hog;
> +			gpios = <15 GPIO_ACTIVE_HIGH>; /* P17 */
> +			output-high;
> +			line-name = "SND_RST";
> +		};
>   	};
>   
> +	/* U5 */
>   	gpio_exp_75: gpio@75 {
>   		compatible = "ti,tca9539";
>   		reg = <0x75>;
> @@ -98,6 +153,49 @@
>   		#size-cells = <0>;
>   		reg = <0x71>;
>   		reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> +
> +		/* Audio_SDA, Audio_SCL */
> +		i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +
> +			pcm3168a: audio-codec@44 {
> +				#sound-dai-cells = <0>;
> +				compatible = "ti,pcm3168a";
> +				reg = <0x44>;
> +				clocks = <&clksndsel>;
> +				clock-names = "scki";
> +
> +				VDD1-supply	= <&snd_3p3v>;
> +				VDD2-supply	= <&snd_3p3v>;
> +				VCCAD1-supply	= <&snd_vcc5v>;
> +				VCCAD2-supply	= <&snd_vcc5v>;
> +				VCCDA1-supply	= <&snd_vcc5v>;
> +				VCCDA2-supply	= <&snd_vcc5v>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						pcm3168a_endpoint_p: endpoint {
> +							remote-endpoint = <&rsnd_endpoint2>;
> +							clocks = <&clksndsel>;
> +							mclk-fs = <512>;
> +						};
> +					};
> +					port@1 {
> +						reg = <1>;
> +						pcm3168a_endpoint_c: endpoint {
> +							remote-endpoint = <&rsnd_endpoint3>;
> +							clocks = <&clksndsel>;
> +							mclk-fs = <512>;
> +						};
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   
> @@ -173,6 +271,11 @@
>   		groups = "usb0";
>   		function = "usb0";
>   	};
> +
> +	sound_pcm_pins: sound-pcm {
> +		groups = "ssi349_ctrl", "ssi3_data", "ssi4_data";
> +		function = "ssi";
> +	};
>   };
>   
>   &scif1 {
> @@ -193,3 +296,51 @@
>   &xhci0 {
>   	status = "okay";
>   };
> +
> +&sound_card {
> +	dais = <&rsnd_port0	/* ak4613 */
> +		&rsnd_port1	/* HDMI0  */
> +		&rsnd_port2	/* pcm3168a playback */
> +		&rsnd_port3	/* pcm3168a capture  */
> +		>;
> +};
> +
> +&rcar_sound {
> +	pinctrl-0 = <&sound_pins
> +		     &sound_clk_pins
> +		     &sound_pcm_pins>;
> +
> +	ports {
> +		/* rsnd_port0/1 are on salvator-common */
> +		rsnd_port2: port@2 {
> +			reg = <2>;
> +			rsnd_endpoint2: endpoint {
> +				remote-endpoint = <&pcm3168a_endpoint_p>;
> +
> +				dai-format = "i2s";
> +				bitclock-master = <&rsnd_endpoint2>;
> +				frame-master = <&rsnd_endpoint2>;
> +				dai-tdm-slot-num = <8>;
> +
> +				playback = <&ssi3>;
> +			};
> +		};
> +		rsnd_port3: port@3 {
> +			reg = <3>;
> +			rsnd_endpoint3: endpoint {
> +				remote-endpoint = <&pcm3168a_endpoint_c>;
> +
> +				dai-format = "i2s";
> +				bitclock-master = <&rsnd_endpoint3>;
> +				frame-master = <&rsnd_endpoint3>;
> +				dai-tdm-slot-num = <6>;
> +
> +				capture  = <&ssi4>;
> +			};
> +		};
> +	};
> +};
> +
> +&ssi4 {
> +	shared-pin;
> +};

Subject: Re: [PATCH 5/5] arm64: dts: renesas: eagle: add HDMI output using the
 ADV7511W
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
 <20180131161811.12699-6-niklas.soderlund@ragnatech.se>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <feff4afa-843f-3906-4726-b5ba4dcfd65f@ideasonboard.com>
Date: Thu, 15 Feb 2018 09:09:11 +0000
MIME-Version: 1.0
In-Reply-To: <20180131161811.12699-6-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On 31/01/18 16:18, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Add the HDMI connector and the ADV7511W, also connect it to LVDS. Enable
> the DU and LVDS to be able to use the HDMI output.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 66 ++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 359e835cca9876fe..c0fd144970c55fa2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -31,6 +31,17 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint = <&adv7511_out>;
> +			};
> +		};
> +	};
>  };
>  
>  &avb {
> @@ -67,9 +78,46 @@
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>;

It looks like the Eagle-V3M expansion board also has an ADV7511 chip on it.

That brings it into the same category as the Wheat board, and because of a fault
on the ADV7511 reset - *both* chips will have to specify alternate custom I2C
registers. (Alternatively, the expansion board could override the reg and
reg-names of this device node to handle this as an overlay style fix up).

Not an issue with this patch - or a blocker - but something to be aware of.

--
Kieran


> +		interrupt-parent = <&gpio1>;
> +		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +
> +		adi,input-depth = <8>;
> +		adi,input-colorspace = "rgb";
> +		adi,input-clock = "1x";
> +		adi,input-style = <1>;
> +		adi,input-justification = "evenly";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &pfc {
> +	du_pins: du {
> +		groups = "du_rgb666", "du_sync", "du_oddf", "du_clk_out";
> +		function = "du";
> +	};
> +
>  	i2c0_pins: i2c0 {
>  		groups = "i2c0";
>  		function = "i2c0";
> @@ -92,3 +140,21 @@
>  
>  	status = "okay";
>  };
> +
> +&du {
> +	pinctrl-0 = <&du_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&adv7511_in>;
> +			};
> +		};
> +	};
> +};
> 

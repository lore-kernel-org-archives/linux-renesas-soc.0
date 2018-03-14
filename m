Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ebe90ad4-60f4-4ac1-c337-df840b754d53@samsung.com>
Date: Wed, 14 Mar 2018 09:15:42 +0100
MIME-Version: 1.0
In-Reply-To: <1520951425-13843-2-git-send-email-jacopo+renesas@jmondi.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <1520951425-13843-1-git-send-email-jacopo+renesas@jmondi.org>
        <CGME20180313143056epcas4p28ad52892b943d0800c6f77337a40f5f0@epcas4p2.samsung.com>
        <1520951425-13843-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13.03.2018 15:30, Jacopo Mondi wrote:
> Document Thine THC63LVD1024 LVDS decoder device tree bindings.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> new file mode 100644
> index 0000000..5b5afcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> @@ -0,0 +1,63 @@
> +Thine Electronics THC63LVD1024 LVDS decoder
> +-------------------------------------------
> +
> +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS streams
> +to parallel data outputs. The chip supports single/dual input/output modes,
> +handling up to two two input LVDS stream and up to two digital CMOS/TTL outputs.
> +
> +Required properties:
> +- compatible: Shall be "thine,thc63lvd1024",
> +
> +Optional properties:
> +- vcc-supply: Power supply for TTL output and digital circuitry
> +- cvcc-supply: Power supply for TTL CLOCKOUT signal
> +- lvcc-supply: Power supply for LVDS inputs
> +- pvcc-supply: Power supply for PLL circuitry

I wonder if it wouldn't be better to make them required (at least VCC) -
it is closer to reality.

> +- pwnd-gpios: Power down GPIO signal. Active low.

As I said before, specs[1] says about "/PDWN" pin. Is it your typo, or
different docs?
Moreover there are already bindings for THC63LVDM83D with the same
dichotomy [2].

Out of curiosity I have googled for "pwnd pin" and it looks like some
vendors use this form.
For me both forms are quite misleading: power down signal, active low,
why they couldn't call it just 'enable, active high'.

[1]: http://www.thine.co.jp/files/topics/179_ext_12_0.pdf
[2]:
https://elixir.bootlin.com/linux/v4.16-rc5/source/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt

> +- oe-gpios: Output enable GPIO signal. Active high.
> +
> +The THC63LVD1024 video port connections are modeled according
> +to OF graph bindings specified by Documentation/devicetree/bindings/graph.txt
> +
> +Required video port nodes:
> +- Port@0: First LVDS input port
> +- Port@2: First digital CMOS/TTL parallel output
> +
> +Optional video port nodes:
> +- Port@1: Second LVDS input port
> +- Port@3: Second digital CMOS/TTL parallel output
> +
> +Example:
> +--------
> +
> +	thc63lvd1024: lvds-decoder {
> +		compatible = "thine,thc63lvd1024";
> +
> +		vcc-supply = <&reg_lvds_vcc>;
> +		lvcc-supply = <&reg_lvds_lvcc>;
> +
> +		pwdn-gpio = <&gpio4 15 GPIO_ACTIVE_LOW>;
And here another variation :), should be pdwn-gpios.

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lvds_dec_in_0: endpoint {
> +					remote-endpoint = <&lvds_out>;
> +				};
> +			};
> +
> +			port@2{
> +				reg = <2>;
> +
> +				lvds_dec_out_2: endpoint {
> +					remote-endpoint = <&adv7511_in>;
> +				};
> +
> +			};
> +
> +		};
> +	};



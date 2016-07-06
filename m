Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: blanche: add Ethernet pins
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
References: <2793535.9X0Tq7I1Mq@wasted.cogentembedded.com>
 <3279336.lifIduxqUW@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <106a5c67-94d2-07ff-723d-4cf8cb4978a5@cogentembedded.com>
Date: Wed, 6 Jul 2016 22:12:20 +0300
MIME-Version: 1.0
In-Reply-To: <3279336.lifIduxqUW@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2016 11:55 PM, Sergei Shtylyov wrote:

> Add the (previously omitted) pin data for the SMSC LAN89218 Ethernet chip
> to the Blanche board's device tree: the chip's IRQ output is connected to
> the SoC's IRQ0 pin and its nCS input is connected to the SoC's EX_CS0# pin.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  arch/arm/boot/dts/r8a7792-blanche.dts |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
[...]
> @@ -67,6 +70,18 @@
>  		groups = "scif3_data";
>  		function = "scif3";
>  	};
> +
> +	lan89218_pins: lan89218 {
> +		intc {
> +			groups = "intc_irq0";
> +			function = "intc";
> +		};
> +		lbsc {
> +			groups = "lbsc_ex_cs0";
> +			function = "lbsc";
> +		};
> +	};
> +

    Oops, stray newline... will fix!

>  };
>
>  &scif0 {

MBR, Sergei


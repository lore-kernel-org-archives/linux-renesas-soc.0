Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33652 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbeLECEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 21:04:31 -0500
Subject: Re: [PATCH v2 2/2] dt-binding: spi: Document Renesas R-Car Gen3 RPC
 controller bindings
To: Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        boris.brezillon@bootlin.com, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw>
 <1543828720-18345-3-git-send-email-masonccyang@mxic.com.tw>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2e719883-4cfd-b456-b894-853e99515092@gmail.com>
Date: Tue, 4 Dec 2018 19:19:48 +0100
MIME-Version: 1.0
In-Reply-To: <1543828720-18345-3-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/03/2018 10:18 AM, Mason Yang wrote:
> Document the bindings used by the Renesas R-Car Gen3 RPC SPI controller.

RPC is SPI and HF controller, it is not a pure SPI controller.

How does this deal with the HF part ? Keep in mind the bindings are ABI
and it will be difficult to redo them later.

> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> new file mode 100644
> index 0000000..c6c6d9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> @@ -0,0 +1,35 @@
> +Renesas R-Car Gen3 RPC controller Device Tree Bindings
> +------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "renesas,r8a77995-rpc"
> +- #address-cells: should be 1
> +- #size-cells: should be 0
> +- reg: should contain 2 entries, one for the registers and one for the direct
> +       mapping area
> +- reg-names: should contain "rpc_regs" and "dirmap"
> +- interrupts: interrupt line connected to the RPC SPI controller

Not a SPI controller.

> +- clock-names: should contain "clk_rpc"
> +- clocks: should contain 1 entries for the module's clock
> +
> +Example:
> +
> +	rpc: spi@ee200000 {
> +		compatible = "renesas,r8a77995-rpc";
> +		reg = <0 0xee200000 0 0x8100>, <0 0x08000000 0 0x4000000>;
> +		reg-names = "rpc_regs", "dirmap";
> +		clocks = <&cpg CPG_MOD 917>;
> +		power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +		resets = <&cpg 917>;
> +		clock-names = "clk_rpc";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		flash@0 {
> +			compatible = "jedec,spi-nor";
> +			reg = <0>;
> +			spi-max-frequency = <40000000>;
> +			spi-tx-bus-width = <1>;
> +			spi-rx-bus-width = <1>;
> +		};
> +	};
> 


-- 
Best regards,
Marek Vasut

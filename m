Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 22 Feb 2018 14:37:19 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Message-ID: <20180222133719.GA6373@bigcity.dyn.berto.se>
References: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180222131336.7712-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180222131336.7712-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-02-22 15:13:33 +0200, Laurent Pinchart wrote:
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1:
> 
> - Move the SoC name before the IP name in compatible strings
> - Rename parallel input to parallel RGB input
> - Fixed "renesas,r8a7743-lvds" description
> - Document the resets property
> - Fixed typo
> ---
>  .../bindings/display/bridge/renesas,lvds.txt       | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> new file mode 100644
> index 000000000000..2b19ce51ec07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,56 @@
> +Renesas R-Car LVDS Encoder
> +==========================
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> +Gen2, R-Car Gen3 and RZ/G SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> +  - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
> +  - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +  - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS encoders

Small typo here s/R8A7791/R8A7793/, with that fixed 

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>


> +  - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
> +  - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
> +
> +- reg: Base address and length for the memory-mapped registers
> +- clocks: A phandle + clock-specifier pair for the functional clock
> +- resets: A phandle + reset specifier for the module reset
> +
> +Required nodes:
> +
> +The LVDS encoder has two video ports. Their connections are modelled using the
> +OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +
> +- Video port 0 corresponds to the parallel RGB input
> +- Video port 1 corresponds to the LVDS output
> +
> +Each port shall have a single endpoint.
> +
> +
> +Example:
> +
> +	lvds0: lvds@feb90000 {
> +		compatible = "renesas,r8a7790-lvds";
> +		reg = <0 0xfeb90000 0 0x1c>;
> +		clocks = <&cpg CPG_MOD 726>;
> +		resets = <&cpg 726>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_in: endpoint {
> +					remote-endpoint = <&du_out_lvds0>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				lvds0_out: endpoint {
> +				};
> +			};
> +		};
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2afba909724c..13c8ec11135a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4744,6 +4744,7 @@ F:	drivers/gpu/drm/rcar-du/
>  F:	drivers/gpu/drm/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
>  F:	Documentation/devicetree/bindings/display/renesas,du.txt
>  
>  DRM DRIVERS FOR ROCKCHIP
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund

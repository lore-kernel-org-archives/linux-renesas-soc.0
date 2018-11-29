Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40392 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbeK2Xsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:48:33 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Convert live DT patches to sugar syntax
Date: Thu, 29 Nov 2018 14:43:43 +0200
Message-ID: <1754701.jL1l6Xu3AY@avalon>
In-Reply-To: <20181129105850.10953-1-geert+renesas@glider.be>
References: <20181129105850.10953-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday, 29 November 2018 12:58:50 EET Geert Uytterhoeven wrote:
> Using overlay sugar syntax makes the DTS files easier to read (and
> write).
> 
> Overlay syntactic sugar for generating target-path fragments is
> supported by the version of dtc supplied with the kernel since commit
> 50aafd60898a8b3e ("scripts/dtc: Update to upstream version
> v1.4.6-21-g84e414b0b5bc").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The generated dtbs before/after are identical.

I was going to ask whether you had tested the patch, but this should be good 
enough :-)

The result is nicer to read, thanks.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7790.dts   | 93 +++++++++----------
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7791.dts   | 53 +++++------
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7793.dts   | 53 +++++------
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7795.dts   | 53 +++++------
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7796.dts   | 53 +++++------
>  5 files changed, 135 insertions(+), 170 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts index
> 579753e04f3b3712..8bee4e787a0ab4eb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> @@ -7,70 +7,63 @@
> 
>  /dts-v1/;
>  /plugin/;
> -/ {
> -	fragment@0 {
> -		target-path = "/";
> -		__overlay__ {
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> 
> -			lvds@feb90000 {
> -				compatible = "renesas,r8a7790-lvds";
> -				reg = <0 0xfeb90000 0 0x1c>;
> +&{/} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> 
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +	lvds@feb90000 {
> +		compatible = "renesas,r8a7790-lvds";
> +		reg = <0 0xfeb90000 0 0x1c>;
> 
> -					port@0 {
> -						reg = <0>;
> -						lvds0_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds0_out: endpoint {
> -						};
> -					};
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_input: endpoint {
>  				};
>  			};
> -
> -			lvds@feb94000 {
> -				compatible = "renesas,r8a7790-lvds";
> -				reg = <0 0xfeb94000 0 0x1c>;
> -
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					port@0 {
> -						reg = <0>;
> -						lvds1_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds1_out: endpoint {
> -						};
> -					};
> +			port@1 {
> +				reg = <1>;
> +				lvds0_out: endpoint {
>  				};
>  			};
>  		};
>  	};
> 
> -	fragment@1 {
> -		target-path = "/display@feb00000/ports";
> -		__overlay__ {
> -			port@1 {
> -				endpoint {
> -					remote-endpoint = <&lvds0_input>;
> +	lvds@feb94000 {
> +		compatible = "renesas,r8a7790-lvds";
> +		reg = <0 0xfeb94000 0 0x1c>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds1_input: endpoint {
>  				};
>  			};
> -			port@2 {
> -				endpoint {
> -					remote-endpoint = <&lvds1_input>;
> +			port@1 {
> +				reg = <1>;
> +				lvds1_out: endpoint {
>  				};
>  			};
>  		};
>  	};
>  };
> +
> +&{/display@feb00000/ports} {
> +	port@1 {
> +		endpoint {
> +			remote-endpoint = <&lvds0_input>;
> +		};
> +	};
> +	port@2 {
> +		endpoint {
> +			remote-endpoint = <&lvds1_input>;
> +		};
> +	};
> +};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts index
> cb9da1f3942b5b30..92c0509971ec3df5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> @@ -7,44 +7,37 @@
> 
>  /dts-v1/;
>  /plugin/;
> -/ {
> -	fragment@0 {
> -		target-path = "/";
> -		__overlay__ {
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> 
> -			lvds@feb90000 {
> -				compatible = "renesas,r8a7791-lvds";
> -				reg = <0 0xfeb90000 0 0x1c>;
> +&{/} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> 
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +	lvds@feb90000 {
> +		compatible = "renesas,r8a7791-lvds";
> +		reg = <0 0xfeb90000 0 0x1c>;
> 
> -					port@0 {
> -						reg = <0>;
> -						lvds0_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds0_out: endpoint {
> -						};
> -					};
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_input: endpoint {
>  				};
>  			};
> -		};
> -	};
> -
> -	fragment@1 {
> -		target-path = "/display@feb00000/ports";
> -		__overlay__ {
>  			port@1 {
> -				endpoint {
> -					remote-endpoint = <&lvds0_input>;
> +				reg = <1>;
> +				lvds0_out: endpoint {
>  				};
>  			};
>  		};
>  	};
>  };
> +
> +&{/display@feb00000/ports} {
> +	port@1 {
> +		endpoint {
> +			remote-endpoint = <&lvds0_input>;
> +		};
> +	};
> +};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts index
> e7b8804dc3c1a1c5..c8b93f21de0fbb8e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> @@ -7,44 +7,37 @@
> 
>  /dts-v1/;
>  /plugin/;
> -/ {
> -	fragment@0 {
> -		target-path = "/";
> -		__overlay__ {
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> 
> -			lvds@feb90000 {
> -				compatible = "renesas,r8a7793-lvds";
> -				reg = <0 0xfeb90000 0 0x1c>;
> +&{/} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> 
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +	lvds@feb90000 {
> +		compatible = "renesas,r8a7793-lvds";
> +		reg = <0 0xfeb90000 0 0x1c>;
> 
> -					port@0 {
> -						reg = <0>;
> -						lvds0_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds0_out: endpoint {
> -						};
> -					};
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_input: endpoint {
>  				};
>  			};
> -		};
> -	};
> -
> -	fragment@1 {
> -		target-path = "/display@feb00000/ports";
> -		__overlay__ {
>  			port@1 {
> -				endpoint {
> -					remote-endpoint = <&lvds0_input>;
> +				reg = <1>;
> +				lvds0_out: endpoint {
>  				};
>  			};
>  		};
>  	};
>  };
> +
> +&{/display@feb00000/ports} {
> +	port@1 {
> +		endpoint {
> +			remote-endpoint = <&lvds0_input>;
> +		};
> +	};
> +};
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts index
> a1327443e6fa4d31..16c2d03cb016c470 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> @@ -7,44 +7,37 @@
> 
>  /dts-v1/;
>  /plugin/;
> -/ {
> -	fragment@0 {
> -		target-path = "/soc";
> -		__overlay__ {
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> 
> -			lvds@feb90000 {
> -				compatible = "renesas,r8a7795-lvds";
> -				reg = <0 0xfeb90000 0 0x14>;
> +&{/soc} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> 
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +	lvds@feb90000 {
> +		compatible = "renesas,r8a7795-lvds";
> +		reg = <0 0xfeb90000 0 0x14>;
> 
> -					port@0 {
> -						reg = <0>;
> -						lvds0_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds0_out: endpoint {
> -						};
> -					};
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_input: endpoint {
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				lvds0_out: endpoint {
>  				};
>  			};
>  		};
>  	};
> +};
> 
> -	fragment@1 {
> -		target-path = "/soc/display@feb00000/ports";
> -		__overlay__ {
> -			port@3 {
> -				endpoint {
> -					remote-endpoint = <&lvds0_input>;
> -				};
> -			};
> +&{/soc/display@feb00000/ports} {
> +	port@3 {
> +		endpoint {
> +			remote-endpoint = <&lvds0_input>;
>  		};
>  	};
>  };
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts index
> b23d6466c4152b6f..680e923ac036c932 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> @@ -7,44 +7,37 @@
> 
>  /dts-v1/;
>  /plugin/;
> -/ {
> -	fragment@0 {
> -		target-path = "/soc";
> -		__overlay__ {
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> 
> -			lvds@feb90000 {
> -				compatible = "renesas,r8a7796-lvds";
> -				reg = <0 0xfeb90000 0 0x14>;
> +&{/soc} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> 
> -				ports {
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> +	lvds@feb90000 {
> +		compatible = "renesas,r8a7796-lvds";
> +		reg = <0 0xfeb90000 0 0x14>;
> 
> -					port@0 {
> -						reg = <0>;
> -						lvds0_input: endpoint {
> -						};
> -					};
> -					port@1 {
> -						reg = <1>;
> -						lvds0_out: endpoint {
> -						};
> -					};
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_input: endpoint {
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				lvds0_out: endpoint {
>  				};
>  			};
>  		};
>  	};
> +};
> 
> -	fragment@1 {
> -		target-path = "/soc/display@feb00000/ports";
> -		__overlay__ {
> -			port@3 {
> -				endpoint {
> -					remote-endpoint = <&lvds0_input>;
> -				};
> -			};
> +&{/soc/display@feb00000/ports} {
> +	port@3 {
> +		endpoint {
> +			remote-endpoint = <&lvds0_input>;
>  		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart

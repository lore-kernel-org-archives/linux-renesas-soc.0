Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:45290 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932491AbeBVNkW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Feb 2018 08:40:22 -0500
Received: by mail-lf0-f68.google.com with SMTP id x196so7430764lfd.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2018 05:40:21 -0800 (PST)
Date: Thu, 22 Feb 2018 14:40:19 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Message-ID: <20180222134019.GB6373@bigcity.dyn.berto.se>
References: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180222131336.7712-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180222131336.7712-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch.

On 2018-02-22 15:13:34 +0200, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Remove the LVDS reg range from the example
> - Remove the reg-names property
> ---
>  .../devicetree/bindings/display/renesas,du.txt     | 31 ++++++++--------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index cd48aba3bc8c..e79cf9b0ad38 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -14,12 +14,7 @@ Required Properties:
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
>  
> -  - reg: A list of base address and length of each memory resource, one for
> -    each entry in the reg-names property.
> -  - reg-names: Name of the memory resources. The DU requires one memory
> -    resource for the DU core (named "du") and one memory resource for each
> -    LVDS encoder (named "lvds.x" with "x" being the LVDS controller numerical
> -    index).
> +  - reg: the memory-mapped I/O registers base address and length
>  
>    - interrupt-parent: phandle of the parent interrupt controller.
>    - interrupts: Interrupt specifiers for the DU interrupts.
> @@ -29,14 +24,13 @@ Required Properties:
>    - clock-names: Name of the clocks. This property is model-dependent.
>      - R8A7779 uses a single functional clock. The clock doesn't need to be
>        named.
> -    - All other DU instances use one functional clock per channel and one
> -      clock per LVDS encoder (if available). The functional clocks must be
> -      named "du.x" with "x" being the channel numerical index. The LVDS clocks
> -      must be named "lvds.x" with "x" being the LVDS encoder numerical index.
> -    - In addition to the functional and encoder clocks, all DU versions also
> -      support externally supplied pixel clocks. Those clocks are optional.
> -      When supplied they must be named "dclkin.x" with "x" being the input
> -      clock numerical index.
> +    - All other DU instances use one functional clock per channel The
> +      functional clocks must be named "du.x" with "x" being the channel
> +      numerical index.
> +    - In addition to the functional clocks, all DU versions also support
> +      externally supplied pixel clocks. Those clocks are optional. When
> +      supplied they must be named "dclkin.x" with "x" being the input clock
> +      numerical index.
>  
>    - vsps: A list of phandle and channel index tuples to the VSPs that handle
>      the memory interfaces for the DU channels. The phandle identifies the VSP
> @@ -69,9 +63,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  
>  	du: display@feb00000 {
>  		compatible = "renesas,du-r8a7795";
> -		reg = <0 0xfeb00000 0 0x80000>,
> -		      <0 0xfeb90000 0 0x14>;
> -		reg-names = "du", "lvds.0";
> +		reg = <0 0xfeb00000 0 0x80000>;
>  		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> @@ -79,9 +71,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  		clocks = <&cpg CPG_MOD 724>,
>  			 <&cpg CPG_MOD 723>,
>  			 <&cpg CPG_MOD 722>,
> -			 <&cpg CPG_MOD 721>,
> -			 <&cpg CPG_MOD 727>;
> -		clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
> +			 <&cpg CPG_MOD 721>;
> +		clock-names = "du.0", "du.1", "du.2", "du.3";
>  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>  
>  		ports {
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund

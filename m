Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:47648 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754350AbeALJzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 04:55:17 -0500
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
CC: <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <devicetree@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <c5d423c8-2546-a0a7-2cb1-502cecb25958@mentor.com>
Date: Fri, 12 Jan 2018 11:54:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 01/12/2018 02:58 AM, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/renesas,du.txt     | 26 +++++++++-------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index cd48aba3bc8c..8f6e0e118e3e 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -17,9 +17,7 @@ Required Properties:
>    - reg: A list of base address and length of each memory resource, one for
>      each entry in the reg-names property.
>    - reg-names: Name of the memory resources. The DU requires one memory
> -    resource for the DU core (named "du") and one memory resource for each
> -    LVDS encoder (named "lvds.x" with "x" being the LVDS controller numerical
> -    index).
> +    resource for the DU core (named "du").
>  
>    - interrupt-parent: phandle of the parent interrupt controller.
>    - interrupts: Interrupt specifiers for the DU interrupts.
> @@ -29,14 +27,13 @@ Required Properties:
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
> @@ -71,7 +68,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  		compatible = "renesas,du-r8a7795";
>  		reg = <0 0xfeb00000 0 0x80000>,
>  		      <0 0xfeb90000 0 0x14>;
> -		reg-names = "du", "lvds.0";
> +		reg-names = "du";

Since "reg-names" list is changed, I believe you'd like to update
the "reg" property value as well.

>  		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
> @@ -79,9 +76,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
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
> 

--
With best wishes,
Vladimir

Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 4 Mar 2016 22:27:57 -0600
From: Rob Herring <robh@kernel.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] phy: rcar-gen2: add fallback binding
Message-ID: <20160305042757.GP13525@rob-hp-laptop>
References: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
 <1456965518-13615-2-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456965518-13615-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 03, 2016 at 09:38:37AM +0900, Simon Horman wrote:
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
> relationship between IP blocks might be. For example, I believe that
> r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
> descendant of the former or vice versa.
> 
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
> 
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * Use renesas,rcar-gen2-usb-phy rather than renesas,usb-phy-gen2 as
>   the new compatibility string to fit in with the preferred scheme
>   for new compatibility string names.
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 8 +++++++-
>  drivers/phy/phy-rcar-gen2.c                             | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> index d564ba4f1cf6..feb1c3c102c2 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -7,6 +7,12 @@ Required properties:
>  - compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>  	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>  	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> +	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible device.
> +
> +	      When compatible with the generic version, nodes must list the
> +	      SoC-specific version corresponding to the platform first
> +	      followed by the generic version.
> +
>  - reg: offset and length of the register block.
>  - #address-cells: number of address cells for the USB channel subnodes, must
>  		  be <1>.
> @@ -34,7 +40,7 @@ the USB channel; see the selector meanings below:
>  Example (Lager board):
>  
>  	usb-phy@e6590100 {
> -		compatible = "renesas,usb-phy-r8a7790";
> +		compatible = "renesas,usb-phy-r8a7790","renesas,rcar-gen2-usb-phy";
Space here                                             ^

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

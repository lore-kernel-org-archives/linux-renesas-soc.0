Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 6 Oct 2017 11:14:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: rcar-gen3-usb2: add binding for r8a77995
Message-ID: <20171006091440.GC7734@verge.net.au>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504233685-17947-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 01, 2017 at 11:41:25AM +0900, Yoshihiro Shimoda wrote:
> This patch adds binding for r8a77995 (R-Car D3). Since r8a77995 doesn't
> have dedicated pins (ID, VBUS), this will match against the generic
> fallback on R-Car D3.
> 
> For now, this driver doesn't support usb role swap for r8a77995.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index ace9cce..99b651b 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -8,6 +8,8 @@ Required properties:
>  	      SoC.
>  	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
>  	      SoC.
> +	      "renesas,usb2-phy-r8a77995" if the device is a part of an
> +	      R8A77995 SoC.
>  	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 compatible device.
>  
>  	      When compatible with the generic version, nodes must list the
> -- 
> 1.9.1
> 

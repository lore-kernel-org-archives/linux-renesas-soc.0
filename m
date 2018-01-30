Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 30 Jan 2018 10:18:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, wsa@the-dreams.de,
        magnus.damm@gmail.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] i2c: rcar: document R8A77995 bindings
Message-ID: <20180130091848.quk2refdntpxohsx@verge.net.au>
References: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1517240748-14780-5-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517240748-14780-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 29, 2018 at 04:45:47PM +0100, Ulrich Hecht wrote:
> R-Car D3 (R8A77995) SoC has a R-Car Gen3-compatible I2C controller.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> index a777477..e91dbaf 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> @@ -14,6 +14,7 @@ Required properties:
>  	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
>  	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
>  	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
> +	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
>  	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
>  	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
>  				device.
> -- 
> 2.7.4
> 

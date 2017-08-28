Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54046 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754707AbdH1IRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2017 04:17:12 -0400
Date: Mon, 28 Aug 2017 10:16:52 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 1/3] dt-bindings: i2c: i2c-gpio: Add support for
 named gpios
Message-ID: <20170828081651.GF22421@verge.net.au>
References: <1503566474-5335-1-git-send-email-geert+renesas@glider.be>
 <1503566474-5335-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503566474-5335-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 24, 2017 at 11:21:12AM +0200, Geert Uytterhoeven wrote:
> The current i2c-gpio DT bindings use a single unnamed "gpios" property
> to refer to the SDA and SCL signal lines by index.  This is error-prone
> for the casual DT writer and reviewer, as one has to look up the order
> in the DT bindings.
> 
> Fix this by amending the DT bindings to use two separate named gpios
> properties, and deprecate the old unnamed variant.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-gpio.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-gpio.txt
> index 4f8ec947c6bd9cad..61033f73577dd70e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-gpio.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.txt
> @@ -2,8 +2,9 @@ Device-Tree bindings for i2c gpio driver
>  
>  Required properties:
>  	- compatible = "i2c-gpio";
> -	- gpios: sda and scl gpio
> -
> +	- sda-gpios: gpio used for the sda signal
> +	- scl-gpios: gpio used for the scl signal
> +	- gpios: sda and scl gpio, alternative for {sda,scl}-gpios (deprecated)
>  
>  Optional properties:
>  	- i2c-gpio,sda-open-drain: sda as open drain

Maybe it would be best to update the example too?

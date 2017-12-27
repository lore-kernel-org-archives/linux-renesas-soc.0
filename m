Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38626 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbdL0Hsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Dec 2017 02:48:43 -0500
Received: by mail-lf0-f68.google.com with SMTP id w196so23578735lff.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Dec 2017 23:48:43 -0800 (PST)
Date: Wed, 27 Dec 2017 08:48:39 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH V2] gpio: of: make example syntactically correct
Message-ID: <20171227074839.GC15612@bigcity.dyn.berto.se>
References: <20171223200641.3709-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171223200641.3709-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch.

On 2017-12-23 21:06:41 +0100, Wolfram Sang wrote:
> The ';' was missing. And cosmetic: there was a space too much.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Changes since V1:
> * removed extra spaces (Thanks Sergei!)
> 
>  Documentation/devicetree/bindings/gpio/gpio.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 802402f6cc5d89..bc5fe95d33fff0 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,12 +33,12 @@ The following example could be used to describe GPIO pins used as device enable
>  and bit-banged data signals:
>  
>  	gpio1: gpio1 {
> -		gpio-controller
> -		 #gpio-cells = <2>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
>  	};
>  	gpio2: gpio2 {
> -		gpio-controller
> -		 #gpio-cells = <1>;
> +		gpio-controller;
> +		#gpio-cells = <1>;
>  	};
>  	[...]
>  
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund

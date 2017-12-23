Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38018 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbdLWKGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Dec 2017 05:06:50 -0500
Received: by mail-lf0-f68.google.com with SMTP id w196so15892286lff.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Dec 2017 02:06:49 -0800 (PST)
Subject: Re: [PATCH] gpio: of: make example syntactically correct
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a3e5175c-5a93-21e3-21e6-4df360bdc390@cogentembedded.com>
Date: Sat, 23 Dec 2017 13:06:47 +0300
MIME-Version: 1.0
In-Reply-To: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/22/2017 11:08 PM, Wolfram Sang wrote:

> The ';' was missing.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 802402f6cc5d89..53e0a0e01a4ee0 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -33,11 +33,11 @@ The following example could be used to describe GPIO pins used as device enable
>   and bit-banged data signals:
>   
>   	gpio1: gpio1 {
> -		gpio-controller
> +		gpio-controller;
>   		 #gpio-cells = <2>;

    Could as well remove extra space on this line...

>   	};
>   	gpio2: gpio2 {
> -		gpio-controller
> +		gpio-controller;
>   		 #gpio-cells = <1>;

    ... and this.

[...]

MBR, Sergei

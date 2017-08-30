Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54304 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750762AbdH3GrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 02:47:05 -0400
Date: Wed, 30 Aug 2017 08:46:56 +0200
From: jmondi <jacopo@jmondi.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: The RZ/A1 pin controller driver will be broken for 4.13
Message-ID: <20170830064656.GA5584@w540>
References: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,
   thanks for bisecting this down to the problem

On Tue, Aug 29, 2017 at 06:56:53PM +0000, Chris Brandt wrote:
> Just FYI,
>
> After pulling Geert's new renesas-drivers-2017-08-29-v4.13-rc7, I tried
> testing RZ/A1 and it hangs during boot.
>
> Basically...
>
> [  110.329579] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6 pins
> [  112.970056] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-1-1 with 16 pins
> (hangs here forever)
>
>
> After some debug, I found that this commit broke the new
> drivers/pinctrl/pinctrl-rza1.c driver.
>
>  108d23e322a2 ("gpiolib: request the gpio before querying its direction")
>
> Looks like it was added for -rc5.
>
> If I revert that one patch, RZ/A1 boots fine.
>
> Since we're at -rc7, I probably won't have time to fix it before the
> release.

I tried -rc1 on a Peach, not -rc5 :(

I will have a look into that and see how bad this is

>
> Poor RZ/A1 pinctrl driver...it took so long to get into mainline, and
> then it only worked for 1 release.
>

Yeah, that's definitely bad karma for this platform

Thanks
   j

> :(
>
>
> Chris
>

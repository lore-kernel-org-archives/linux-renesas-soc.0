Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897A1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 20:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54535218C3
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 20:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="SmQOLdvZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733203AbfBPUaF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 15:30:05 -0500
Received: from h1.radempa.de ([176.9.142.194]:53818 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730653AbfBPUaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 15:30:05 -0500
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Feb 2019 15:30:03 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id 65CFB9027D0;
        Sat, 16 Feb 2019 21:21:03 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y5AO9iv0OsAP; Sat, 16 Feb 2019 21:21:02 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (213162072206.public.t-mobile.at [213.162.72.206])
        by mail.cosmopool.net (Postfix) with ESMTPSA id 4ECD79004DD;
        Sat, 16 Feb 2019 21:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1550348462; bh=14J+qXizWNuGEQfYQVcCBTBx8FYTnT9GhZFUMIsWU4U=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=SmQOLdvZoWXXshseWLgvJK/WYeYBdLEN8iVTjzQDXcGRObBvQUohWkrqdYt2FWiiQ
         OH9BFxk2Bbb9Gp0ZZjlc+Zlr60ahReO0GJeT9xy/wfRIt6cNj1dN4O4/VgDKFh2MVr
         NbgxDzCZsVTQftgafdl8Ihvplumji0dTDS94RzfM=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1gv6SG-0000Jv-KB; Sat, 16 Feb 2019 21:20:56 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     marek.vasut@gmail.com
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <20190216174859.15738-1-marek.vasut@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
Comments: In-reply-to marek.vasut@gmail.com
   message dated "Sat, 16 Feb 2019 18:48:59 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1233.1550348456.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date:   Sat, 16 Feb 2019 21:20:56 +0100
Message-Id: <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

marek.vasut@gmail.com writes:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> =

> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
> =

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.
> ---
>  .../bindings/regulator/gpio-regulator.txt     | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.=
txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> index 1f496159e2bb..acca13c1eaf3 100644
> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> @@ -4,16 +4,25 @@ Required properties:
>  - compatible		: Must be "regulator-gpio".
>  - regulator-name	: Defined in regulator.txt as optional, but required
>  			  here.
> -- states		: Selection of available voltages and GPIO configs.
> -                          if there are no states, then use a fixed regu=
lator
> +- states		: Selection of available voltages/currents provided by
> +			  this regulator and matching GPIO configurations to
> +			  achieve them. If there are no states in the "states"
> +			  array, use a fixed regulator instead.
>  =

>  Optional properties:
> -- enable-gpio		: GPIO to use to enable/disable the regulator.
> -- gpios			: GPIO group used to control voltage.
> -- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
> -			  defualt is LOW if nothing is specified.
> +- enable-gpio		: GPIO used to enable/disable the regulator.
> +			  Warning, the GPIO phandle flags are ignored and the
> +			  GPIO polarity is controlled solely by the presence
> +			  of "enable-active-high" DT property. This is due to
> +			  compatibility with old DTs.
> +- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
> +			  Default is active LOW.
> +- gpios			: Array of one or more GPIO pins used to select the

I think this must be a required property.

> +			  regulator voltage/current listed in "states".
> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
> +			  0: LOW, 1: HIGH.
> +			  Default is LOW if nothing else is specified.

This is not very clear. Maybe add an example below or explain it better.

I guess we can't change it now anymore anyway, but it's not clear to
me, why we have this in the first place: A regulator should only be
active when it has a consumer or is "always-on". IIRC the regulator
core automatically selects the lowest voltage/current compatible with
all consumers. It seems the only usecase is to specify an initial
state that is different from all states in the "states" property, before
the regulator is turned on for the first time. However it also is not
an off-state, because it won't be set again on turning the regulator off.

>  - startup-delay-us	: Startup time in microseconds.

Not relevant for your patch, but I wonder why this is not in the
generic regulator binding.

> -- enable-active-high	: Polarity of GPIO is active high (default is low)=
.
>  - regulator-type	: Specifies what is being regulated, must be either
>  			  "voltage" or "current", defaults to voltage.

HTH,
Harald

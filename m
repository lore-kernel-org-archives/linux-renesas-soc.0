Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DAEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 21:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E453020675
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 21:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="V4T/nwqC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfCEVgr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 16:36:47 -0500
Received: from h1.radempa.de ([176.9.142.194]:35868 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbfCEVgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 16:36:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id 5D0FE902D08;
        Tue,  5 Mar 2019 22:36:41 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eoO5Z3Qyo5O5; Tue,  5 Mar 2019 22:36:38 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (212095008175.public.telering.at [212.95.8.175])
        by mail.cosmopool.net (Postfix) with ESMTPSA id 4DB5C901C91;
        Tue,  5 Mar 2019 22:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1551821798; bh=Ls5x0Kfrup1NkBVWD+KbMZimRcigX7sQLL2JQYvG/T0=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=V4T/nwqCzxG85scdC0DrDScQNLO8lIhL8lez/+4729B47t9GXZRiG7V1sInthNtEv
         ciwxhpe9yp7yEy1KbUxbNGz6a4U938ge1N/AY8LW8271Dn5XgDWZPnzqX6vXA0OkF+
         m8nxAgFw4/5l/V1bolA8nq3fnUA9bs74FQWeGLyg=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1h1Hjl-0000Nv-Ri; Tue, 05 Mar 2019 22:36:33 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     Marek Vasut <marek.vasut@gmail.com>
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
In-reply-to: <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
References: <20190304194023.10926-1-marek.vasut@gmail.com> <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at> <834f8576-73a4-be0f-e322-91601bed5388@gmail.com> <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at> <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
Comments: In-reply-to Marek Vasut <marek.vasut@gmail.com>
   message dated "Tue, 05 Mar 2019 20:01:41 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1481.1551821793.1@stardust.g4.wien.funkfeuer.at>
Date:   Tue, 05 Mar 2019 22:36:33 +0100
Message-Id: <E1h1Hjl-0000Nv-Ri@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Marek Vasut writes:
> On 3/5/19 5:10 PM, Harald Geyer wrote:
> > Marek Vasut writes:
> >> On 3/5/19 11:07 AM, Harald Geyer wrote:
> >>> marek.vasut@gmail.com writes:
> >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>
> >>>> Reword the binding document to make it clear how the propeties work
> >>>> and which properties affect which other properties.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> Cc: Harald Geyer <harald@ccbib.org>
> >>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>> Cc: Mark Brown <broonie@kernel.org>
> >>>> Cc: Rob Herring <robh@kernel.org>
> >>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>> To: devicetree@vger.kernel.org
> >>>> ---
> >>>> V2: - Make "gpios" a mandatory property
> >>>>     - Reword "gpio-states" property description
> >>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> >>>> Note: The recent gpio-regulator rework caused breakage. While the
> >>>>       changes in the gpio-regulator code were according to the DT
> >>>>       binding document, they stopped working with older DTs. Make
> >>>>       the binding document clearer to prevent such breakage in the
> >>>>       future.
> >>>
> >>> Thanks for the update. I think it addresses all my concerns except for
> >>> one:
> >>>
> >>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
> >>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
> >>>> +			  Default is LOW if nothing else is specified.
> >>>
> >>> I still believe this not true: There is no guarantee that the regulator
> >>> core won't change the state of GPIO pins before the first consumer comes
> >>> up.
> >>
> >> Why would it do that ?
> > 
> > Because the regulator core doesn't know about this driver specific
> > property at all. And without any constraints placed by consumers, the
> > core is free to choose any state whatsoever at any point in time.
> 
> But git grep seems to disagree, see drivers/regulator/gpio-regulator.c:
>                     ret = of_property_read_u32_index(np, "gpios-states", i,
> 
> The core sets the pins to such a value until the consumer takes over.

I think we have a misunderstanding of terminology. When I write "regulator
core", I mean the driver independent regulator code. The line you quote
above is part of the gpio-regulator driver and thus not part of what
I call the "regulator core".

AFAICS the data from the property is only stored in a driver specific
data structure (and not used at all outside of probe) but never passed
to what I call the regulator core.

Why do you believe there is a guarantee that the value set during
probeing is preserved until a consumer takes over?

Harald

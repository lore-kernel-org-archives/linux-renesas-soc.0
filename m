Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34903C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 08:17:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F264C20661
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 08:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="VygqOYZh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfCFIRk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 03:17:40 -0500
Received: from h1.radempa.de ([176.9.142.194]:45900 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727106AbfCFIRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 03:17:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id C85F0902D08;
        Wed,  6 Mar 2019 09:17:34 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vhjuRg8RI-WT; Wed,  6 Mar 2019 09:17:33 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (178.113.180.10.wireless.dyn.drei.com [178.113.180.10])
        by mail.cosmopool.net (Postfix) with ESMTPSA id E01A4901054;
        Wed,  6 Mar 2019 09:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1551860253; bh=dURgji5XgiHn4/c67yvHVe6tx6K1Q3agRyetB9h799o=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=VygqOYZhiVCd9xsWGLLdJP373JIxrJRGPls+VU5mcuKTtzazcm9/i+ReX7lFZk+ma
         ZOLPUxqZJvhRZoCdESoqQkTjjuOf9jN8OHvRxsYUEHX1ceDazxqgvKope1wLQGgKDR
         4NwZAWiG4Fi+dwyNV3KHplLsHTAOyW/jChjoi4+s=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1h1Rk2-0000NG-Jp; Wed, 06 Mar 2019 09:17:30 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     Marek Vasut <marek.vasut@gmail.com>
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
In-reply-to: <89743562-bb2a-de3f-a57b-331f43bf8982@gmail.com>
References: <20190304194023.10926-1-marek.vasut@gmail.com> <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at> <834f8576-73a4-be0f-e322-91601bed5388@gmail.com> <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at> <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com> <E1h1Hjl-0000Nv-Ri@stardust.g4.wien.funkfeuer.at> <89743562-bb2a-de3f-a57b-331f43bf8982@gmail.com>
Comments: In-reply-to Marek Vasut <marek.vasut@gmail.com>
   message dated "Tue, 05 Mar 2019 23:23:38 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1440.1551860250.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 06 Mar 2019 09:17:30 +0100
Message-Id: <E1h1Rk2-0000NG-Jp@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Marek Vasut writes:
> On 3/5/19 10:36 PM, Harald Geyer wrote:
> > Marek Vasut writes:
> >> On 3/5/19 5:10 PM, Harald Geyer wrote:
> >>> Marek Vasut writes:
> >>>> On 3/5/19 11:07 AM, Harald Geyer wrote:
> >>>>> marek.vasut@gmail.com writes:
> >>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>>
> >>>>>> Reword the binding document to make it clear how the propeties wo=
rk
> >>>>>> and which properties affect which other properties.
> >>>>>>
> >>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>>> Cc: Harald Geyer <harald@ccbib.org>
> >>>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>>>> Cc: Mark Brown <broonie@kernel.org>
> >>>>>> Cc: Rob Herring <robh@kernel.org>
> >>>>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>>>> To: devicetree@vger.kernel.org
> >>>>>> ---
> >>>>>> V2: - Make "gpios" a mandatory property
> >>>>>>     - Reword "gpio-states" property description
> >>>>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT r=
ules
> >>>>>> Note: The recent gpio-regulator rework caused breakage. While the
> >>>>>>       changes in the gpio-regulator code were according to the DT
> >>>>>>       binding document, they stopped working with older DTs. Make
> >>>>>>       the binding document clearer to prevent such breakage in th=
e
> >>>>>>       future.
> >>>>>
> >>>>> Thanks for the update. I think it addresses all my concerns except=
 for
> >>>>> one:
> >>>>>
> >>>>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set=
 until
> >>>>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
> >>>>>> +			  Default is LOW if nothing else is specified.
> >>>>>
> >>>>> I still believe this not true: There is no guarantee that the regu=
lator
> >>>>> core won't change the state of GPIO pins before the first consumer=
 comes
> >>>>> up.
> >>>>
> >>>> Why would it do that ?
> >>>
> >>> Because the regulator core doesn't know about this driver specific
> >>> property at all. And without any constraints placed by consumers, th=
e
> >>> core is free to choose any state whatsoever at any point in time.
> >>
> >> But git grep seems to disagree, see drivers/regulator/gpio-regulator.=
c:
> >>                     ret =3D of_property_read_u32_index(np, "gpios-sta=
tes", i,
> >>
> >> The core sets the pins to such a value until the consumer takes over.
> > =

> > I think we have a misunderstanding of terminology. When I write "regul=
ator
> > core", I mean the driver independent regulator code. The line you quot=
e
> > above is part of the gpio-regulator driver and thus not part of what
> > I call the "regulator core".
> > =

> > AFAICS the data from the property is only stored in a driver specific
> > data structure (and not used at all outside of probe) but never passed
> > to what I call the regulator core.
> > =

> > Why do you believe there is a guarantee that the value set during
> > probeing is preserved until a consumer takes over?
> =

> It is the only sensible behavior and the behavior I see people expect
> from this property. I presume it solidified in this sort of semi-defined
> state, so we're stuck with assuming it behaves this way to maintain
> compatibility.

Maybe the behaviour you want would be more sensible, but AFAIK it just
isn't true in general (it might work that way by chance in many cases).
If people expect this behaviour, it is a misunderstanding of the old wordi=
ng.
I'd prefer we don't have to add a quirk to the regulator subsystem to
cater for a misunderstanding.

I think, if you really want to go forward with making this behaviour
officially maintained, then we should first add the code to linux and
only then add the promise to the binding document. This isn't the scope
of this patch, so I guess we would need to keep the ambiguous wording as
it is for now. I believe it is more important for a binding document
to be correct than to be sensible.

However I don't think we actually need to go to such extremes: In linux
we currently have (arm/boot/dts and arm64/boot/dts) 38 uses of this
property in 29 DTs. All the examples, that I studied in some detail,
seem to either don't need this property at all or have a usecase that is
supported by my proposed wording. I don't expect any problems if we just
document the status quo clearly.

Harald

Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9604C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 16:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81C6B206DD
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 16:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="K37LiJoK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfCCQHk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 11:07:40 -0500
Received: from h1.radempa.de ([176.9.142.194]:36278 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfCCQHk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 11:07:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id CA640901A18;
        Sun,  3 Mar 2019 17:07:36 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2RyHwjmyJ3Jo; Sun,  3 Mar 2019 17:07:36 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (77.117.188.200.wireless.dyn.drei.com [77.117.188.200])
        by mail.cosmopool.net (Postfix) with ESMTPSA id B0B36901A13;
        Sun,  3 Mar 2019 17:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1551629256; bh=jPbbGOpOGyF+fLZmvR+z3vQ9FewFtolunZE69gxPJiw=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=K37LiJoK08wFNFdvXO7dyIWqYMTnhCAl5uXLUawUEjGBePlgMUrIhcF+GXlDQnz3+
         gM8s73src6eZIHoGkbuLvEjWeLRnZQKc8wZThxt0Ofjs61js5MJO1+Lgn73vyY1xyx
         IrcfnXUFY1cGh3xA9H/LWfVWt1f9cditic6VHBFM=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1h0TeF-0000Iw-72; Sun, 03 Mar 2019 17:07:31 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     Marek Vasut <marek.vasut@gmail.com>
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <fc83b1ce-52e5-b197-4679-69b576233726@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com> <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at> <75846117-242c-6861-ace5-dccf88711208@gmail.com> <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at> <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com> <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at> <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com> <E1gvrEx-0000K7-Ks@stardust.g4.wien.funkfeuer.at> <72363317-8259-eda2-4cd8-4f336f0c155f@gmail.com> <E1gw2Ll-0000MN-40@stardust.g4.wien.funkfeuer.at> <fc83b1ce-52e5-b197-4679-69b576233726@gmail.com>
Comments: In-reply-to Marek Vasut <marek.vasut@gmail.com>
   message dated "Sat, 02 Mar 2019 15:55:53 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1172.1551629250.1@stardust.g4.wien.funkfeuer.at>
Content-Transfer-Encoding: quoted-printable
Date:   Sun, 03 Mar 2019 17:07:30 +0100
Message-Id: <E1h0TeF-0000Iw-72@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Marek Vasut writes:
> On 2/19/19 11:10 AM, Harald Geyer wrote:
> > Marek Vasut writes:
> >> On 2/18/19 11:18 PM, Harald Geyer wrote:
> >>> From the explanations provided by Mark it is clear that this propert=
y
> >>> is an artifact of the implementation in linux. I think we should doc=
ument
> >>> is as such. How about:
> >>>
> >>> gpios-states : On operating systems, that don't support reading back=
 gpio
> >>> 	       values in output mode (most notably linux), this array
> >>> 	       provides the state of GPIO pins set when requesting them
> >>> 	       from the gpio controller.
> >>
> >> That's good.
> >>
> >>> Systems, that are capable of
> >>> 	       preserving state when requesting the lines, are free to
> >>> 	       ignore this property.
> >>
> >> Are they ?
> > =

> > I think so. Also this seems to be what Mark wrote yesterday:
> > =

> > | With the GPIO API as it stands it is unfortunately not possible to
> > | preserve the state, if the API were fixed we'd preserve state.
> > =

> >> I think there are systems which depend on preconfiguring the
> >> GPIO according to this property.
> > =

> > These systems need to preconfigure the GPIOs in firmware anyway, so
> > they should be fine so long as the driver preserves state.
> > =

> > Since the original wording doesn't give any guarantees, I think the
> > new wording doesn't change anything. It just makes it clearer, that
> > there are no guarantees and that some drivers will happily overwrite
> > state when this property is absent.
> =

> OK, so how can we move forward with this ? We discussed a lot, but I
> don't know what we should do about the patch.

Yes, we discussed a lot. I guess most people lost track of where we
stand. I'd suggest you send a V2 of the patch, picking up all the proposed
changes. If you feel the part about `gpios-states' property is too
controversial, then maybe split it in two patches: The first containing
the non-controversial changes and the second improving `gpios-states'
description, so that maintainers can ACK them independently.

best regards,
Harald

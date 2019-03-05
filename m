Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17E5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 10:07:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77FD4206DD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 10:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ccbib.org header.i=@ccbib.org header.b="BN9MuQPG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfCEKHX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 05:07:23 -0500
Received: from h1.radempa.de ([176.9.142.194]:50109 "EHLO mail.cosmopool.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbfCEKHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 05:07:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.cosmopool.net (Postfix) with ESMTP id 1BDB590104F;
        Tue,  5 Mar 2019 11:07:19 +0100 (CET)
Received: from mail.cosmopool.net ([127.0.0.1])
        by localhost (mail.b.radempa.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QNA6ybUzC1pU; Tue,  5 Mar 2019 11:07:18 +0100 (CET)
Received: from stardust.g4.wien.funkfeuer.at (77.116.137.221.wireless.dyn.drei.com [77.116.137.221])
        by mail.cosmopool.net (Postfix) with ESMTPSA id E1B1F9007B2;
        Tue,  5 Mar 2019 11:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ccbib.org; s=201902;
        t=1551780438; bh=7Klhx1hwWvDuhT29d0w/GBoKxHqhnygk2bHVPKqmx6E=;
        h=From:To:cc:Subject:In-reply-to:References:Date:From;
        b=BN9MuQPGtpvSWptWhT+xDGzzrJ2zUtDkduqkigyPjWWQhZa6chHM/rPX5XiyZ5s5s
         KJvDCn7WTjsma+uQ2H4oukt0izHXqickYq+n0pcqae+41ilWi1tV+Y7LJjfVe3zmsg
         ouBWIteY2QmjXm0MAoYPFsC0qjK6EmgW3tdvXa1A=
Received: from lambda by stardust.g4.wien.funkfeuer.at with local (Exim 4.89)
        (envelope-from <harald@ccbib.org>)
        id 1h16yh-0000OM-5J; Tue, 05 Mar 2019 11:07:15 +0100
From:   Harald Geyer <harald@ccbib.org>
To:     marek.vasut@gmail.com
cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
In-reply-to: <20190304194023.10926-1-marek.vasut@gmail.com>
References: <20190304194023.10926-1-marek.vasut@gmail.com>
Comments: In-reply-to marek.vasut@gmail.com
   message dated "Mon, 04 Mar 2019 20:40:23 +0100."
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1508.1551780434.1@stardust.g4.wien.funkfeuer.at>
Date:   Tue, 05 Mar 2019 11:07:14 +0100
Message-Id: <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

marek.vasut@gmail.com writes:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Make "gpios" a mandatory property
>     - Reword "gpio-states" property description
>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Thanks for the update. I think it addresses all my concerns except for
one:

> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
> +			  changed by the first consumer. 0: LOW, 1: HIGH.
> +			  Default is LOW if nothing else is specified.

I still believe this not true: There is no guarantee that the regulator
core won't change the state of GPIO pins before the first consumer comes
up.

I still think my proposal describes the property more acurately:
gpios-states : On operating systems, that don't support reading back gpio
               values in output mode (most notably linux), this array
               provides the state of GPIO pins set when requesting them
               from the gpio controller. Systems, that are capable of
               preserving state when requesting the lines, are free to
               ignore this property. 0: LOW, 1: HIGH. Default is LOW if
               nothing else is specified.

Since we had this discussion already in the V1 thread and you clearly don't
agree with me, the maintainers will need to decide. You can add 
Reviewed-by: Harald Geyer <harald@ccbib.org>
once Rob and/or Mark have addressed this issue.

Thanks for your work!
Harald

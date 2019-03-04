Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC9DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 22:22:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABAD620663
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 22:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q87YY63B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfCDWWM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 17:22:12 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46399 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfCDWWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 17:22:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id v16so5727753ljg.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2019 14:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QDGEY2aOlHXpUEdIMKl0rQXcFMDI8l1OeliI4/4nBPI=;
        b=Q87YY63Bn7QzMJYWFoNg8jnf2ggLTseCf50Wsc9+Bz90qG/dFFZtLHSFr9T23AIXvl
         uGd++/8GPKD/ScLFKQa6KiWMWJmL2rdeolpioguhmOZqmMmDmHh+EPtguIbRr7LsQaaN
         RNMROgez9IwXr5E2gADRiGF/1gRxXJpHQKtFH/I1LYTn642+zwEscGsE7zLOiGbMeKlQ
         KEtGXoAzLCy7gpSTH2w88PxO48vEhZWzOGCGPFA0nT5K/r9quhzfgRLdv0lK6gv31WPZ
         Oj96x1n67XdFlrgq6bI6o5s4tMN77yDLnfdzuJXIdNzd8TOVJ9mDE7qRlBv4O2sz0WCt
         C5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QDGEY2aOlHXpUEdIMKl0rQXcFMDI8l1OeliI4/4nBPI=;
        b=eGqCFW+V3UFMoezzdVEz+ywHPPdEAyinXMrT6rNWBUaInwVWufvpGque1tz0BUEZIV
         dd8JkshlQ/6jUIBuNMDme9LaktxAh71pkwAvfvP+EQkCxEYx+mkbecC3GNsFP0sc4e0X
         aCm4dRN4r3a+46yKQcnGAwgmI0X3WczSt4RK4xapJkwmvmtoNL6MFpoTcDDG4gq+/dUU
         VOGrV9gXklxnJz6N/wwDXbKlQ9lng7ml13SwTg/zHNbesn6j8pn6qcfRXOJm2AZSnn3u
         J7eUWP68ABZ5XcSR0aOkMXiCeQZH2gA3O8c5qbp0/s05nK1COzBCifc4wsGF0TcstwC6
         uVCQ==
X-Gm-Message-State: APjAAAVtCbuonbKkB1jRyj7DzRrFVj3BQHOCaPVOdhqPPRLMRnFbAZTm
        Oa9mgJie8lCeLzGwC6C0ytvibf3BchL37b8RNdxMcA==
X-Google-Smtp-Source: APXvYqwrsxB8to3V5v+WR2uuk1vzh1E9LvO+5F87V1zUGxnoKUvksszTjhTFDhNMBqFpsZzaSpwx/xb/tlVz6fsXBUs=
X-Received: by 2002:a2e:9217:: with SMTP id k23mr1919482ljg.159.1551738129752;
 Mon, 04 Mar 2019 14:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20190304194023.10926-1-marek.vasut@gmail.com>
In-Reply-To: <20190304194023.10926-1-marek.vasut@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Mar 2019 23:20:39 +0100
Message-ID: <CACRpkdbQyT6X=_nrtmuU7q40dgY26dxeMRKNjUd9uP6XDMpmwg@mail.gmail.com>
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
To:     Mark Vasut <marek.vasut@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 4, 2019 at 8:40 PM <marek.vasut@gmail.com> wrote:

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

Excellent work!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B757DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 08:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80D682081B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 08:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+Nn/DLo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfCHIYv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 03:24:51 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40792 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfCHIYv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 03:24:51 -0500
Received: by mail-lf1-f66.google.com with SMTP id a8so13705641lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Mar 2019 00:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Au5Odvr18Aleb7TW2DRmRmfiWTRoXUyloWuUa41tem4=;
        b=K+Nn/DLoyMzwlUm4I5cC1iDnxDXOLVo6IP9orle07DqoJdgbIjMxGe5nd09hIDbdbr
         iFRC1HUINiVZyJs/oUefwl/TXd6VdtWHYBla4gkqKhU5SS6lQjlRhlCdSv0CEKdbFb14
         652MguoTqrj/6gixp9y56fqEpqizBl92YXnbGVzIPq+X4ZdD6jOURbbW7T+FYi6/XIM/
         x4PkyWLaaXtT9nIzbYgN1Nu3BA0DFDZIkpbopEWPEoGRRmjYtJz7GbUQQRoY0pAy1zmd
         Y2XoOx+7QUwYq9idIfxYKcL67a4kqUalnxO4ClMqvXS2Ydb+W2Hux5kbjW1NOCBxi59r
         egcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Au5Odvr18Aleb7TW2DRmRmfiWTRoXUyloWuUa41tem4=;
        b=Z/IY7dBS2gzMzbgZ9u1iQXBrX4ewq2kem59weg5MQ26P0IQlgu6bUjBwfmfhCm5TMF
         LHpR+25VrrBCVl73JK/9OSOWHJSVb1l3gtUzeR9aYc8gkAN+KzZHM2ej2wWnXhffjmQw
         Dm2yMAHjixA1xC3F8eOGzvv9wBinWjkEhQR3Mmnaj9QFRg+aOe93KY/SqK+yZnjR+plV
         IkApDNk0Ao90ycqkpYiWyyc0A7qthbBMLKK7L2eMcQl2IPM5IL/iTmvQP8VEju1P3xfQ
         dIM8+HCyVQo6FfIcAh9wrB1Td7xp2j9KEsxbQ0LbItP/aou6rDsVQ779zEpTPNwIFwAX
         PAAw==
X-Gm-Message-State: APjAAAW5clpKiCUmSdjvMYemk5OzmdYU/BAy+VPvE8cZNqqDh3cfwqAL
        CyUaYWnLHQM0peXwd9PVrkcIY7pd+eg+5EgBzTA6QA==
X-Google-Smtp-Source: APXvYqxK3VHVclXOadAhAJOWUjnzUibbvahW+a7ej2aXt1emcav9lfv1X7IjKVYpvHCgyn0bCxLtVWdC262uq03pfEU=
X-Received: by 2002:ac2:4343:: with SMTP id o3mr8574168lfl.129.1552033489621;
 Fri, 08 Mar 2019 00:24:49 -0800 (PST)
MIME-Version: 1.0
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdbf+MpB24etuXUGypOwHUW_w4ECu-iFFT3aEB10wG0Huw@mail.gmail.com>
 <TY1PR01MB177090970EE98AC699E22E3CC0A90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUxcxRJv_H+_25pavjeJOKoEihrjBQTxjWR-fe9x5rBNw@mail.gmail.com>
In-Reply-To: <CAMuHMdUxcxRJv_H+_25pavjeJOKoEihrjBQTxjWR-fe9x5rBNw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 8 Mar 2019 09:24:37 +0100
Message-ID: <CACRpkdbtB9cxA=MhWQSVmGRW64X9jYT8ZQsEfps4B=vY+U1knA@mail.gmail.com>
Subject: Re: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 2:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> /me gives v3 a try on Koelsch, Salvator-XS, and Ebisu-4D:
>
>     BUG: sleeping function called from invalid context
>
> for mmc, adv7511, gpio-keys, and Ethernet PHY.

This is the usual problem when you call back from any of the
irqchip callbacks: almost all of them except request/release
resources are called under a spinlock.

The problem is creeping up in a lot of places, and I can't
really solve that from the GPIO side. See for example this
regression that I have no idea what to do with:
https://marc.info/?l=linux-kernel&m=154349829407463&w=2

Yours,
Linus Walleij

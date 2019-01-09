Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7B4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E31420821
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfAIIfn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:35:43 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37460 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbfAIIfm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:35:42 -0500
Received: by mail-ua1-f66.google.com with SMTP id u19so2153660uae.4;
        Wed, 09 Jan 2019 00:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=os8wNxguVFyLx/9HGlVYchfXdRdcj7q9GX0npMdrKYo=;
        b=k5Zys/vMf6Y9H3D49xlarScRDC9d+Pi5utKX2Lp6XWxeySLwzXJXotPntKoNPsKOcV
         Fg1HRezOup52whXJCEAECSu9hW3intlURfIhC5Dg7k3rR2/8TP3YmFlsKSmV8CQJg2LG
         B8I8QOxQ0o/4qmG1B7O9gfOn0H+0QrEgJt8714oIxLh/cA1+C4R70fo0Pp+Q6Ii8fP7k
         TyyTr1J9BWGItgaZ3LgmKJ46CveXUhn33jEb402tditW16fZoM7779rRUAEEX2gzoEVE
         llyE4RvIO0Dfry0qIJPElMC2lyMveWE7F0ER59JFTSZYbdZTnl8z2oj/Kw4k5SdE7+9R
         JVHA==
X-Gm-Message-State: AJcUukcXjKr9I2ig06VTeWntmCh8qs9zmIvhuK6SiQIcVouqK6LQyAj7
        bX5E18pco/vHwz7GJS40HiGFV/I9TdckUyasWSLhlZdqsuM=
X-Google-Smtp-Source: ALg8bN6n61DSroJDnaAij6IAreHVQb5WHMa5pNeqMdMfKSL3sAXUKX6D0l+zOsuz5ebRGghA1xz7QOY1MDTgTBQXExI=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr1870824ual.20.1547022941686;
 Wed, 09 Jan 2019 00:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20190107221320.14930-1-wsa+renesas@sang-engineering.com> <20190107221320.14930-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190107221320.14930-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jan 2019 09:35:29 +0100
Message-ID: <CAMuHMdUFGgoKAf6-YROUCY3mYwwMWizZkB9KYxxjVYNpsNitMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL
 register for ES1.0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 7, 2019 at 11:13 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Documentation for ES1.0 says that some bits in TDSEL must be set (ch
> 5.3.35 in R-Car E2 v0.5). However, the reset value of the register is 0,

Hardware User Manual Rev.1.10 says the values must be 00, so I assume
that manual applies to later ES versions.

> so software has to do it. Add this to the kernel driver to ensure this
> is really done independent of firmware versions and use whitelisting for
> ES versions known to need this.
>
> This is needed for some SD cards supporting SDR104 transfer mode.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

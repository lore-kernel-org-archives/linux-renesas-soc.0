Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87500C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Aug 2021 12:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 653DA61008
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 11 Aug 2021 12:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhHKMnL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:43:11 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:46947 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhHKMnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 08:43:10 -0400
Received: by mail-vs1-f54.google.com with SMTP id h7so1373423vso.13;
        Wed, 11 Aug 2021 05:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjzJOEmvy4W9hsVCbeGcn4BsIIic06xJU42PI5KoTB8=;
        b=q8cAb8jUcJzdTWNa9KCybU/UX3PncmCVS0I054iHsgk9bJW1UAMVCe7r6OlcExVlfZ
         v4sLW/VPIoND9Dah7vEyuKPTVOnZFCDkRobxjsEd/LlC37v61ZqjQAgyl3ssZQ0pD6s4
         lbbZuxvjSvYD6FvB6lj3IzpKGVHut3d8I0rs+aDuLTeL4pQZ4efd2InhNajYSe3gwq+U
         SyNPwoJfruDgNb07maagoeCVUOxTt3FTRbgW193mbgXbnoG+F0s89VrRrCjQrjTYfSuE
         9rTujM4CwMEDH9rHCSRNvt6dC9ZWfjQ462wqMiacuoFLvs5OsLKFez/cTFosOgtmwIEI
         UxZg==
X-Gm-Message-State: AOAM533c0EhM+cK2C6RAfip0KXX69rpA2182J6TocQThoS+65Gd2SXwo
        AplfTvxr5u6WQGkujwsjiQxwOCCaX0oRAsTW3PWOJlfbsCo=
X-Google-Smtp-Source: ABdhPJy5ia6JkgjqgcAUzInrcMlMcgMSED4qwCRYRgwwnSSCnIWIhoTcGxfpHKxE8T0Rx8cpPrHxFtD7d5hk7z5sebw=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr18227125vsk.40.1628685766802;
 Wed, 11 Aug 2021 05:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <9c212711-a0d7-39cd-7840-ff7abf938da1@omp.ru>
In-Reply-To: <9c212711-a0d7-39cd-7840-ff7abf938da1@omp.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 14:42:35 +0200
Message-ID: <CAMuHMdWsbJZdrh+Jz4VG1uBa6okxU_GnQWERZgZGkJmR5x8vpQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: switch to my OMP email for Renesas Ethernet drivers
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Tue, Aug 10, 2021 at 10:26 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> I'm still going to continue looking after the Renesas Ethernet drivers and
> device tree bindings. Now my new employer, Open Mobile Platform (OMP), will
> pay for all my upstream work. Let's switch to my OMP email for the reviews.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Thanks for your continued dedication!

> --- net.orig/MAINTAINERS
> +++ net/MAINTAINERS
> @@ -15803,7 +15803,7 @@ F:      Documentation/devicetree/bindings/i2c
>  F:     drivers/i2c/busses/i2c-emev2.c
>
>  RENESAS ETHERNET DRIVERS
> -R:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
> +R:     Sergey Shtylyov <s.shtylyov@omp.ru>
>  L:     netdev@vger.kernel.org
>  L:     linux-renesas-soc@vger.kernel.org
>  F:     Documentation/devicetree/bindings/net/renesas,*.yaml

You may also want to update your email address in the various DT
binding files.
And perhaps get rid of your obsolete cogent address in a few drivers? ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D020C433E6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Jan 2021 08:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E0ED20706
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Jan 2021 08:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbhAOIBG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Jan 2021 03:01:06 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:36310 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728688AbhAOIBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 03:01:05 -0500
Received: by mail-oo1-f41.google.com with SMTP id j8so2006194oon.3;
        Fri, 15 Jan 2021 00:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9kXUvk5r5wmoJiypHdN3S2Vu6BTC52Np6aUDp7nDGvI=;
        b=WWHQwWewVVrtx66YgyFkuXcP2QVPH9xnNG99gOhDs3ygkoQpRjScz/tiGuQXHlahsN
         x/DIVmOojSruLpuXZcLkicaAeIBNlPDGrIX0zB6pfGlfEZNTZhxWK3dxH1mTbNKOusOC
         jqsetTUdKfHjLsmw+QmErSL2u4MXp+kIhH4GolTJ2Vm3+9VxRyEnkuGiDDuwd2mGHdPw
         ZalVcb3n/TCrkuH1jS7T5PhzEExXb0owN7hVy2hKzvLF2dVKdIK5UkQdSd+CkoanCfGM
         yodkfyoSBRdgj9uRN1wKeQza6hIGqafLXdtx7OLZselC9SYN5+KtRN6xgS9e6HEV+yze
         s+jg==
X-Gm-Message-State: AOAM530nTA23Cs0oUntyAKKjDXl/Nudn1FaYPyUhm4bBdfQESe4H18eG
        +1F9/UKYfTBSUNNH7CCxafQAt1370t3KUvtJZdo=
X-Google-Smtp-Source: ABdhPJz7EssXixQz7eMJk3rSBT5mLf+NEM4oOC5TdqDezkvy/1R9ZzkkV/X9kqdd4/+a705Ud73QQdv6k0cmjIdNepc=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr7438191oop.1.1610697624607;
 Fri, 15 Jan 2021 00:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-2-wsa+renesas@sang-engineering.com> <CAMuHMdUDPaaaHsDP11qZJzWzd+tss97iZXXATCHdVQZE1vLHSg@mail.gmail.com>
 <20210114205756.GB16693@kunai>
In-Reply-To: <20210114205756.GB16693@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Jan 2021 09:00:13 +0100
Message-ID: <CAMuHMdU4=_ZdwmpNchNC58z-4OfWV9Za2apnAhDfzUM8pQD9Qw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a779a0: add & update SCIF nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 14, 2021 at 9:57 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +               scif3: serial@e6c50000 {
> >
> > Please move scif3 before scif4.
>
> I thought we are sorting by reg value?

Yeah, but we group nodes of the same type, and sort them by
label within the group.

We really need a script to take care of the sorting...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

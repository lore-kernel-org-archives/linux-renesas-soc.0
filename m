Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1632C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 552DE23D50
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406034AbgLKMx5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Dec 2020 07:53:57 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40494 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406018AbgLKMx2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:53:28 -0500
Received: by mail-ot1-f66.google.com with SMTP id j12so8076791ota.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjPBDmLBnW2EdVbOVxCumiC6Yl5fj1WU0j28EAzGuLA=;
        b=bclg1pVv64tDXrGPHI5jiyyytw3un+Vu3O+UkOVg8fpzyn7iEgbS3m98w/uYUxJO2b
         EFr4M4pJsBTeMOZFLvk+utkPjftVZt18tVMGB8NwTrOPN3mt676hpdY6BRNXZPC9HGBS
         mMmyykn38YS0kVc8Spjzup8jf5X+q/Ko+hhIiKYX7fdzHlV0bsFW0futv6Oc7QTmPAI6
         67jTnpJRwdSKvgyRwrV8lfbNDZV+JgbbBtkam7ro876K6YS8qE55+UxQkrfaE9pU85rT
         FPIgCHlt+4sZIpiZlHHdKqvMNjydtuTzAPT0pmbfWT/B4XZWxefSwR+jXlJRHFQDD+Go
         3C4w==
X-Gm-Message-State: AOAM531fm5jvD8NNBQm3oTOxpuXZpuuqi2XUpjtRMaecmiN+/7fwkQD3
        2bYxtXNXzAQF7eakgUJ97E+CkW00xGbC9YHuMZo=
X-Google-Smtp-Source: ABdhPJyVa/8/sqho+kmVOmifKgdKr8TycmVv8ums+2Ab+tkCYtY+J1SFyos5jMSeH8QHSbrjC11NkzwUxxXN95axk4U=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr9696126oth.250.1607691165605;
 Fri, 11 Dec 2020 04:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
In-Reply-To: <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:52:34 +0100
Message-ID: <CAMuHMdVhVViA4zyiHNMdc_Y1NR7GXp=-wYtWvy1pTbFhFNkfZg@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Thu, Dec 10, 2020 at 4:17 PM Julien Massot <julien.massot@iot.bzh> wrote:
> On 12/10/20 3:57 PM, Biju Das wrote:
> >> Subject: [PATCH 0/5] clk: renesas: Add MFIS clock
> >>
> >> This series adds the missing MFIS clocks for most Reneas R-Car Gen3 SoCs.
> >> I have tested this series on E3, M3, and H3 based boards, I don't have
> >> access to D3 nor V3 boards.
> >
> > Just a question, Can you explain what test have you done with MFIS module?
> A basic usage I did is to store and read a byte into one of the
> communication register MFISARIICR / MFISAREMBR, a more complex usage is
> to trigger interrupts between Linux and the realtime processor, using a
> mailbox driver, that I didn't post yet.

Thanks for your series!

Is it OK if I postpone applying this (possibly squashed into a single commit)
until you have posted an MFIS driver?
Thanks, and have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373AFC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11ECA218A2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfAXKQK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 05:16:10 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43139 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfAXKQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 05:16:10 -0500
Received: by mail-ua1-f67.google.com with SMTP id z11so1782486uaa.10;
        Thu, 24 Jan 2019 02:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C4paYuBJ2OG+OxXYW5rxTKM7oGPWJ4L+zKRjbAStoCw=;
        b=QajwyoO3qa99JO/G2HI16DmsfSqZea/yP3r4qHzux0pxxhHdgilUBQeUZrEFxuEX++
         /tS0C6baGqC7dp4ew/Kmgns8tOWsLZrsORy8hwlSycG66kzv9NtdKgMzd7aDr/1fIwcn
         +yBfk/MYpNWuuJy5mV40L/I9Mrw6+kdFGngojvUivSSrdNnRTQpRehJVrp0uYuqHkhsf
         wb0UGFQ+nsG/U+myAiiqn88/R1k5vJ+T5ulOdSDkCmvIdeEO7BCIDmQ8qxcMUHm45wTN
         cAZ9pc5ubYslLBBxvVd1bqxF2VNz5roxljMj85twQH0FgCeP10jb8AqU1ks/yup9/fwc
         rz9w==
X-Gm-Message-State: AJcUukeqAq0cC04ooYLlGGYgO3C7HZzgtg0rJwhRnBYfSiadPvJDzvZb
        NGDx4sbXy84EtyMnIReA3dKjSTEAwh/4/0Fzoos=
X-Google-Smtp-Source: ALg8bN7Hs9tk8aG2awFFZdMHAM96XxTr6lQqtZ++da10slo9wHrzQEq/BKyzStPwnuoGVvfCvk7TDzuzYJQW81W36fw=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr2522935uap.0.1548324969198;
 Thu, 24 Jan 2019 02:16:09 -0800 (PST)
MIME-Version: 1.0
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Jan 2019 11:15:56 +0100
Message-ID: <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Oct 26, 2018 at 10:32 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
>
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> are working fine.The clocksource_switch asynchronous test is failing due
> to inconsistency-check failure on "arch_sys_counter".
>
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
>
> Has any one noticed this issue?

clockevents/next now has commit 7cd6dca3600d8d71
("clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer
instability").  Perhaps this is related, and the same test program may
indicate similar issues?

See also https://lore.kernel.org/lkml/20190113021719.46457-2-samuel@sholland.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

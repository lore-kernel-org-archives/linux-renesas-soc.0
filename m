Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42553C282D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10DAD21872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbfBANaA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:30:00 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:45458 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfBANaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 08:30:00 -0500
Received: by mail-ua1-f67.google.com with SMTP id e16so2164557uam.12;
        Fri, 01 Feb 2019 05:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLSj2LNJ82BZhZC0zTsSGyfBVIypDsd+R8488Rqc0xI=;
        b=pKjdEAw98bNniOVpQvEVJ/PDsrsIe+XYk585QltJSM8G5rvI/yuPpUixCH6B5Ub2HN
         Tgdyg/mLEv35DLasAttncl1dmF+01cQXH/arpDE8VQrL/6mSfwT+w7xGThZO+p9KqZTI
         +FWVF65kFe7w86W4xaQ57nRpqWnaci5fmsyZTtnFUb7T4gjz0SSPHRGpO8IcAiWzZyWl
         TcRjMM2od0fWzuQ7T6hFjP+eg7X8aK3t4eBYSDWkVUHgxlhv1MqHco2+WZwqs8bMTp+S
         Vl9cQzO0BdjVWUUCD95I7u6DtTsGjBrLqitVFkpTIYs3PxC/rTQC0pTzkIAqFqlO6PvF
         zYbQ==
X-Gm-Message-State: AJcUukedyteoW5Uyv1RbdbvVNoaO0KXrWgM9QyrhB9W9qTou7xYLwvlo
        SCd7lD6ulrJVt/HCc9ojv9i3q73Vb2hDI7pl2uU=
X-Google-Smtp-Source: ALg8bN4+6TcpMz88gFp9vmH0EmCMyrJiWi6zXqvxoqB/D3akA4t/o6gvDFa2C8Gt4umfI4tMsRdTRyA9MR41fx6uDNw=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr16763828uap.0.1549027798934;
 Fri, 01 Feb 2019 05:29:58 -0800 (PST)
MIME-Version: 1.0
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com> <1549015841-33536-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 14:29:47 +0100
Message-ID: <CAMuHMdWw40xX1BtAZvCMQxZkF6K828sOjKsRKrJ6YOUB2_xYmg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: timer: renesas, cmt: Document r8a774c0
 CMT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 1, 2019 at 11:15 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document SoC specific bindings for RZ/G2E (r8a774c0) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

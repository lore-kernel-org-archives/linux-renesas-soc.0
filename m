Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72633C2B9F4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jun 2021 12:46:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E6F2610A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jun 2021 12:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhFNMsL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Jun 2021 08:48:11 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:35705 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhFNMsK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:48:10 -0400
Received: by mail-vs1-f48.google.com with SMTP id j15so7709618vsf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 05:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lriEkWNwrPz9xBBAfaFT4OLEV0+3dhmbqWwnjLFtNY=;
        b=eNHVPqzk3nHa4PipIQcEJK4lShQW1Y/F3ZeS1oMBGTSAt1OB/eYbK9lFbpWNEIYlQC
         xwW9W9kWuL98tuSLzg/XZy3NyQDbNGTrYdssj9VX1fbFAH5RYbIb4qEiniAQ/NqOKi2G
         d667rehoGEVxfPj06aRAijTs8LF3mf1buQvGbXq31rzf4gtfpTO0uDpRn2httsSjd09g
         l2AyWoC1V8v5lTa0YgpWipXrkV8QMj+1L+Y5JteGSxDC0U00T9WKEYsaflhFZGYoi95C
         8AmTRj4Zquply6JjMg2kPHFG1GfBtxw/cyJSZX3EkPqX4zwiKJIp4Zb+nz3HZyHg7tp2
         OF8w==
X-Gm-Message-State: AOAM53273RTLMSFXtRWKTdplQYkxduYtQYVOiiDBJiNnvSs81ggcocfJ
        PKCwOg55YD3nV6fdBMDp8SMVS01vcFt3CRo5mXk=
X-Google-Smtp-Source: ABdhPJxBw5E14ClVwu9xmUAfbLJ409TkOGfLenVBKtWEQGos5uuZwu6/3daFXOKuVbMv5ITwaejBGVbb8N3W5jykbe4=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr17861266vsp.3.1623674767819;
 Mon, 14 Jun 2021 05:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com> <20210611165624.30749-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611165624.30749-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:45:56 +0200
Message-ID: <CAMuHMdV5FE24t__Xa0d5uTA2FPTitn69tDPFqQhpRGz3uvrckg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable RIIC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable RIIC driver support for Renesas RZ/G2L based platforms.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61A9C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88FC622AAC
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgLVKVT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Dec 2020 05:21:19 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:45787 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgLVKVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:21:18 -0500
Received: by mail-oi1-f176.google.com with SMTP id f132so14202501oib.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k/0cVKqpIJW+MdBT4b5pTrOBv/zs8wjbuz8Ob1ZRcxs=;
        b=tdvMjkUi2ORoDI0nBOXhOPRiKjBa1YGcWC9jzW7TfV6zn5p9eOZNUbRIR/7TccicfX
         bFI+TZLfl6tKp/PzZsmuH6xOYk6iNwUu7ouwTA8ejljlnTGWInnV6mit/JY0SqTT2/O0
         zPBOzp3fQ+9swR1/FUc+4Vb32Jd2eFPU9joEvhxO4/FRltmBsByNAp4unuNmqx0nOf2A
         1X1DX9k5XWaqpk/2q2hlwhvCujQAKJB9AKF5L0Tl1q8qir3sRoqywx47e0SFCbOd0E2g
         8yz4HnR2L3bSwyKft+rfaEPn61PcKekXG/WXriGroqN0Az22d/ZXsKrcvWcrnxV3mAhy
         kMTA==
X-Gm-Message-State: AOAM533UBg7cH39YFdwnQRtPIGvfFbuz86/FSTaWiJPa9lQp6hZESUN5
        KYa7oV1A6lzlmutOPHf3QLkq26fBPVYMTm4oEpU=
X-Google-Smtp-Source: ABdhPJwmc7m6swV5j5+yUA+K1/YNcKSqRTPlBQ0h0VqE/iqkSigt8X6z/KQNZE8Q472KEN7wV05ybPwXNSqEDWNgx88=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12537377oia.54.1608632438310;
 Tue, 22 Dec 2020 02:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20201221165541.27679-1-uli+renesas@fpond.eu> <20201221165541.27679-12-uli+renesas@fpond.eu>
In-Reply-To: <20201221165541.27679-12-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:20:27 +0100
Message-ID: <CAMuHMdVfv0-_Y9VpbZkrwJcEW_=xb_pc20B4TrXfF4Xq_VkvRQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] pinctrl: renesas: r8a779a0: Add TMU pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds TMU TCLK1-4 pins, groups and functions to the R8A779A0
> (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

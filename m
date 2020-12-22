Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE6C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E053229CA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Dec 2020 10:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLVKGM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Dec 2020 05:06:12 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:43335 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgLVKGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:06:11 -0500
Received: by mail-ot1-f42.google.com with SMTP id q25so11422846otn.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACUnJcJ0gK1X/7WstQaIJpwDsdb1zz6fqn9gZlQD7Co=;
        b=bSk7LNzsPM1djQF5FqVSQDgm/15jpntUcbtH3waV5iaYcFjXYsXGqj9ZG18uhe8yx+
         vsGtNP2BT2uXAwbFRHKRDJHkVWf7585rEZRKyZlKxE/Xsu6/vnGuGMv/ty+7aIPUPnbg
         kGngOYSKIBx8rEl9BaF7xvANJkrw4lhmFJ2II15w37hIF/YF9UUGz3rN4P/whgZvnA5Z
         jd2qE0eoEOtZBMWxv9OCtNQtjlBppL+KMCXZUL61tXxQ9cvn36fTZBcYkG22nkLUtqZN
         3wMPW3Ny3dFWAEcSNYj4YIey4T43DNrPqDB/prBsMPK2fEkD7SDnUli/xkXZ6zhDjfZg
         m+OA==
X-Gm-Message-State: AOAM531fW0Ch7teM1T7wudmuzCkT3oEvyKYquRY5VIM3ua6TRojNAz+W
        KWNApDjsdQhsz9OKPiyF0IV94l/jY8mGpEDq38g=
X-Google-Smtp-Source: ABdhPJwahiNrjyEgK4xKRHkg1SLh44v9QmrDDbsz90irb942j9M3jelbVB/qUplD0QG7sh+TkgufSUAP4m/MG8YjdZ0=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr15192527otc.145.1608631531200;
 Tue, 22 Dec 2020 02:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20201221165541.27679-1-uli+renesas@fpond.eu> <20201221165541.27679-4-uli+renesas@fpond.eu>
In-Reply-To: <20201221165541.27679-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:05:20 +0100
Message-ID: <CAMuHMdVH8xvfQfDteFyUaFKixES3-g2cz5cZ0zxg88GOPc82Tg@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] pinctrl: renesas: r8a779a0: Add CANFD pins,
 groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds CANFD 0-7 and CANFD clock pinmux support for the
> R8A779A0 (V3U) SoC.
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

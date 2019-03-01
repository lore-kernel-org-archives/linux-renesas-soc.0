Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4DEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78C192087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfCAKPw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:15:52 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34731 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCAKPw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 05:15:52 -0500
Received: by mail-ua1-f67.google.com with SMTP id a42so21944817uad.1;
        Fri, 01 Mar 2019 02:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4yRDNJxd7rzcRCWdXiouYJk+pIuvwKusxOT7BNrKLo=;
        b=kNJRJDNwTPPuqsLPbME632iFdw54kazenSGlMQJuKRLyLdheZoWUtqPTYSXDmZPYcs
         oKrzKjbk+5F7yZIevd0js0u+4sGzxFgJd2CShm+YPUYOLli2l8H28hAY6+bHAoo0IWw7
         /MJyuMkso56XA0iJ266HiSsCU4GwkdcqIN0iL2YeRifqIlTxHbd75v0u8annfXMuXLvv
         x66Kl49PgixrjGI8HpImzTrAv8c0Ej9aikOETkbJ/6JT9YpFqFfR8zoJPH+A0UBi+naM
         SO/dn/pazELNjNCOJrq/skxUIEnvlUYTjdRNbhhcnbJ7YRiU7BxgodzHKjnzkCDxDb7e
         HP/w==
X-Gm-Message-State: APjAAAU25sYq1x4FL1V2s9zhqfbvmD3m5jmZA5RqUgKOmMGyY3IzHrec
        DcLraQRacl2IaPWyTB2NzkwmvNBUpLBLzOyAtOA=
X-Google-Smtp-Source: APXvYqwwL7fOLzMKvIPDjKCK99TCtXWn/VLGY4yWXtaIJg47f7G/V8TPYibYq1pdC/Mrz8DjOhK9i46QJq447yy9b5Q=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr2196062vsc.152.1551435350881;
 Fri, 01 Mar 2019 02:15:50 -0800 (PST)
MIME-Version: 1.0
References: <1550679018-1380-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550679018-1380-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 11:15:38 +0100
Message-ID: <CAMuHMdU3UiNDKMiXJ5Y6HMw=YE5XRwiB6qKF=rxePz-ywM--+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: move CANFD pin groups and functions
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 20, 2019 at 5:10 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> CANFD is found also on the R8A774C0, therefore move CANFD pin
> groups and functions to "common".
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

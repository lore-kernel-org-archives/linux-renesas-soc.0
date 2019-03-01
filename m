Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B6AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E74F20851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732517AbfCAKfV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:35:21 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40658 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCAKfV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 05:35:21 -0500
Received: by mail-ua1-f66.google.com with SMTP id c5so21992719uaq.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2019 02:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7JBDuMgNYCB+MZfR1eDIh4bfl+B18COi17SFtWTvo8=;
        b=QnZ2XODePINMk2VbjTOlnJMkkF5TNTnuciRRTJ6S6zg0PgIJ18JWoYJR/1ZjEe2ReY
         raD98TxqoUQmqaFxCKAO1WNXWX7vh9szJ1tPj7MDLNMNUdPl/FjahRi3D1LvCuJsIflf
         IGsVnvqFVUyYkbwnTJ/ljRTmqZWDLCy+z50hoj1ygpXyKexHZXlYKqqmXG/tbG0S7Xp+
         B4KeEmVotcFUtD+53idBS1Cg/PLf1nTn5lSZiLnhPDjJFVo4WUbBEwzbOUKQ6Gj2hY4t
         PqAGKAmlqFQcLxLFeFddC37fN83dbnAfCKFzkadxk7J+7huESlwXZd3SMuk7lc9MU91b
         /BMg==
X-Gm-Message-State: APjAAAUy6U+ltI9WG2o+7MM4relxwHAQLbMATbxafk9G3Sv+45kGoNKj
        picxi5/rfKQZNTAjKGMwC0ydJr8et25y1jaQJ3I=
X-Google-Smtp-Source: APXvYqynxlBT4E06kiytyL+cosePm22gr695rKFnzc7h1t5svZNHCJaoSaQ4jWrJuQM2yUfbe4i96NP+3F2rcrcuQVU=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr2220545uab.75.1551436520687;
 Fri, 01 Mar 2019 02:35:20 -0800 (PST)
MIME-Version: 1.0
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com> <1550742048-28068-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1550742048-28068-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 11:35:08 +0100
Message-ID: <CAMuHMdVfaHXPWpTHJNMkNX1hEXBbM_zdbkoTj9NPf4cBNfpiWA@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: defconfig: enable RX-8581 config option
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Andy Gross <andy.gross@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 10:46 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable support for RX-8571/RX-8581 RTC by turning on
> CONFIG_RTC_DRV_RX8581 as module.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Probably you want to enable this in (local) renesas_defconfig, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

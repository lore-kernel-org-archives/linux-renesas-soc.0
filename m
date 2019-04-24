Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41231C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FECD20835
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfDXHMQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 03:12:16 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38314 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfDXHMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 03:12:16 -0400
Received: by mail-ua1-f65.google.com with SMTP id t15so5678415uao.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2019 00:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RNXVWKP4Y3Ud1CrJ6NSdef8yQWCAnsi1TqiSR3HOMyY=;
        b=orslYH0M0dPlTVxVANjBLUEaFbi7HGP40gccxWrVEUypp+BaxZQzZloNWh38C4aXIV
         3K6mD/jMAQv8meUG0bA49Op8fphQkA/TVOr49LqrF3EW2UKWsJxLLRcCwvfrA5KWHdqo
         gWdeaUSDWLS13fGXHfig9r2EPTEw0/Q3Nx4Z0QpAVpRSQV6knAgDnO6HzTgTLrILByXk
         PXc0LIyPvQpUC3NrLgkoVehS2eZp3AZGvdBQ+zFFG/5rKdRM1VNfX6OONyzPFp+DBmSV
         Bto6bakH914DhgkXQl2cbdAOMStfRx2D3UgERNF7XIr+gOuFF2D2vuKRKzvQCkTOvKeZ
         FL6A==
X-Gm-Message-State: APjAAAUzBDj8uoqKQKpmtblag0BWflpuT7VoDmpD26i8J/HRgfBcVWDL
        IH6d+7SFLvrgF7Wghsez0J63c7ljHGcIIF5VW/4=
X-Google-Smtp-Source: APXvYqxR1SmZ7kGmLTB7tgFe1OJkTNIQlGZYPTTVWF+5wOH6graPqiQY/iNe7wrmMzdzK1P72HtO8k54u6AbSaWJ6Ec=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr1888926uar.28.1556089935482;
 Wed, 24 Apr 2019 00:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Apr 2019 09:12:04 +0200
Message-ID: <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 23, 2019 at 3:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Remove the GENERIC_PHY config option from shmobile_defconfig, as it is
> selected by PHY_RCAR_GEN3_USB2.
>
> PHY_RCAR_GEN3_USB2 is enabled by the commit 0cd4f4f10245d1d9616e00245
> ("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig").
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

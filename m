Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD0EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 968F620850
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbfCANOr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:14:47 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34014 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfCANOr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:14:47 -0500
Received: by mail-ua1-f65.google.com with SMTP id a42so22381408uad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2019 05:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfs1b1X1rA3jPPIwUKw1FT6fQa3bi+oinIoiqf5AkMU=;
        b=cEwqxss8BbCMCsqlkNpTNUlGCtvZwGq1wJLHpeDNscRhd4fgJf4aOqIFmwWfj5EMU5
         8Ok/nTW0zXJfo9i/1Pw73AvSYZtFvDTbOz6ux0ktd0/p77QHAIKSkH5Z6TrYrGwoBVgd
         vVgQc7HBEkqEddYNtHjhAl+HZr1BqcK/q/nMIq4ISMlzFmVRdcF87GkH8zVxPzgOnPAF
         LAO2c8Cov9H5hVWSWEzqaN+OFfgTU1lKCYTYy/JDAsXqQdBfDPGUuKiKZQdlxTIRLxwy
         Sb3MzUENtDn4Lplrw5SLrL04W0yycZtZbiC/baCT0R+uP1DHU5pttnsstVp5juzrdUNZ
         P1yg==
X-Gm-Message-State: APjAAAX7Ao3GR/yH1+vLotg61osuDERrTO9/1Md8KWTWJ+SusZQ5fm60
        5MgnEEWo/vnjPHpT0MvvD4lk9Ua/iEjwHW4aOp8=
X-Google-Smtp-Source: APXvYqzTc36sDjq+EJSLFtQ1GGMtTDz639u6tK/GosEQ2OPC4O/DKg2jUcD8aocAORcghutVzR1s4jFPY1ibRaSyZ/A=
X-Received: by 2002:a67:7dd1:: with SMTP id y200mr2317085vsc.96.1551446086117;
 Fri, 01 Mar 2019 05:14:46 -0800 (PST)
MIME-Version: 1.0
References: <1551444976-48763-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551444976-48763-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 14:14:34 +0100
Message-ID: <CAMuHMdWX4107EcCA0UMW=Cbj5DTFkame_FR9UVwMEd+5GzouAg@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable RX-8581 config option
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 2:02 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Enable support for RX-8571/RX-8581 RTC, which is used by
> RZ/G2E (r8a774c0) based Silicon Linux CAT874 board.
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

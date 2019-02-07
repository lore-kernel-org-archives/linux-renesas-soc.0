Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DCFC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C094821901
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfBGKNS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:13:18 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43033 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbfBGKNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:13:17 -0500
Received: by mail-vs1-f68.google.com with SMTP id x1so6315317vsc.10;
        Thu, 07 Feb 2019 02:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vuM6EgZRbtoyjQ3bbY/QQiiQ44SHvwUVPG2pPi5lpFw=;
        b=KG2NXDqaBTQBxcYKiJvsF+NTtcDSHDT2oj1aXYgOelkN6iPHlU+yvueLQh23SchnmI
         7pA3odNmm87ejDFYV28fPYl0voxT4gTo9bFrYBP9z7igNeEtH0NTTWHF4QQtZ+QeX9Fw
         7/YEaTqy+vDD3uYlLDG7DBVhbdWPylmTS/DQQGmp9U52u1XBLx24uqrMMG2dBzDLUdR7
         5irYac/aT37b45lg7yxbQ3sqQ+YNjgEZZC1Z2t1S9Cmt2H4qqweJ1lNrh0Su/+MWC8Ti
         8LpZPBEGhdT4qNhvzT9IMKLph1OnMPly/AyTr9ntcqpAN/jxLgPP7rpNew2NnYJ2Q8Xi
         guyw==
X-Gm-Message-State: AHQUAuZQVZ5aonP5rWUU04xGDNyCegssfK312mRicBCcqs267CF+Lsb2
        WAhkOFj/YN2Hc8AppEk9dbBy4izJft4zBjEZWKs=
X-Google-Smtp-Source: AHgI3Ib7xAAkqXxfPsj75Gu/BuMnWydhVvYg7YuqELiKhXtJ4PX586bnkXD3MqM7zNnC0c2WejEOcfchaYRuDjOTbTY=
X-Received: by 2002:a67:f43:: with SMTP id 64mr6399048vsp.166.1549534396266;
 Thu, 07 Feb 2019 02:13:16 -0800 (PST)
MIME-Version: 1.0
References: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Feb 2019 11:13:03 +0100
Message-ID: <CAMuHMdVeVV9d4Sf=iPQ2UCrGqrnsh2Y9QCWaupwKc7QmRhCebw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add pciec0 support
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
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 7, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Silicon Linux CAT 874 board has 2GB DDR memory. Update the dma-ranges
> mapping for pciec0 node. Also declare pcie bus clock, since it is
> generated on the CAT874 main board.
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

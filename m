Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D54C4151A
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7BCF20833
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbfBANsv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:48:51 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41458 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfBANsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 08:48:50 -0500
Received: by mail-vs1-f66.google.com with SMTP id t17so4190413vsc.8;
        Fri, 01 Feb 2019 05:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJE28mm2UwaYCnA+qcfly9TamPAmKUrbWEp/68ghBNY=;
        b=E41JJUupDfPcUbkqxnJGcm1cQkLmOWjxyZtnQemsIXlbc8vFqtoyb/0S8RdUIJQQca
         90lXWDDL6/PgOdcolSVczWhBdVw63Z+0DjTRe7v0tpbd+zetf988kEsNkMCdl1XQ5pUP
         ly9o79EkW+yLc3Uv7xRtwb+NSAlbTNzQE5B649OvMxUMWxMvMDNBTXQgcJB6xHP9pcxx
         Pj38tlyel1M7ZQOT3sIpniTvhVqJTZ0QgtXvEdMOcLPnC3VN8u563v1UcvNp9CUvYBfG
         WUXan6R7llmIcU0nXhwIUc5SHQ7E8xjAfF9100IbwStQLtTRasLXVTybHtGGOP5aGECT
         Q3dA==
X-Gm-Message-State: AJcUukcFML6n/0OwQ1fDjPD83JfGOTPl+zhC/FjxyuZTHnZtD5lh9sxD
        mU74/dWoPbIm/50VJPim8n+CxM6WVP2woP4z24k=
X-Google-Smtp-Source: ALg8bN7kaDXCSUs+f5EBfTTYvEBDZfhXWZYEq8o08Pnx3nC4t3jsCHPzXhBQKxiaHkm8J59I8anLi5NS2h5+LA/qFz0=
X-Received: by 2002:a67:f43:: with SMTP id 64mr16753007vsp.166.1549028929705;
 Fri, 01 Feb 2019 05:48:49 -0800 (PST)
MIME-Version: 1.0
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com> <1549015841-33536-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-6-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 14:48:38 +0100
Message-ID: <CAMuHMdX8FiXL8LRfS6++X=GHo-BXTafRrwv6g5RjHLGxxCtwyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a774c0: Add TMU device nodes
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

On Fri, Feb 1, 2019 at 11:16 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds TMU{0|1|2|3|4} device nodes for r8a774c0 SoC.
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

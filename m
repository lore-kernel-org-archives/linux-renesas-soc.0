Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F37C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:13:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C50C320675
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbeLQQN2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:13:28 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42528 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbeLQQN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:13:28 -0500
Received: by mail-ua1-f65.google.com with SMTP id d21so4610526uap.9;
        Mon, 17 Dec 2018 08:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PeZ7k7MPzV4nuNPypx9buuVGTgYQKP1806LfaBuAfS8=;
        b=peSbew9sqH5fAeFhsQm5qh022tewukSqzePX+BjifOx/6KyAfRuFD0RlqAOhxyvULT
         pDGS31LDqcOHTzHEgO+e76Bz9xPv8GoLFaTl19Ashj1AKMhKCmzC8wRBfgz7l3QqVIiH
         IUNbKnje/Bw+VDSyqMMxsrku9aSjXM12G7KL068Kuzo1nQDfj8XRtNB98c+pA6G/izUz
         gka8RAOjBG6WCPSm5jiukxCiUhrHGvIDrdkAdlOlkavdwhoLLeb32XEjsnsGpi1nL6jW
         V+rBjxhDMxSQlKAZs/WydOZeUpQiGvSCzqPPC9HUUGocI9l2sLzjLJPiRWyIT6gXeyvw
         GA1g==
X-Gm-Message-State: AA+aEWZAdU48FsdzHwQlc1ZYJwxuRbod7Xkiw1Hh5+m33nHqpF8NHNvs
        4mkNscQcJq5V0jdz10Cr5tjxBEw7rMO4qYHOYLE=
X-Google-Smtp-Source: AFSGD/Wa6rybBD13absSbSCP3sVx9JYHp3HNe4EcrspmG7FMfPLA+SztYgdiYhV5Sux2TTKH6auMTX4SfFWRwD4FEvs=
X-Received: by 2002:ab0:465:: with SMTP id 92mr6516420uav.28.1545063207208;
 Mon, 17 Dec 2018 08:13:27 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-5-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:13:14 +0100
Message-ID: <CAMuHMdV2O-Sh8ER3LwxQFoV38L4ZFHUwtM8fQ1oaMy_bcrET0A@mail.gmail.com>
Subject: Re: [PATCH 04/17] arm64: dts: renesas: r8a774c0: Add CAN nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 10:37 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add the device nodes for both RZ/G2E CAN channels.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

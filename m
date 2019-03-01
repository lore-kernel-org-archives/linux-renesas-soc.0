Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429A7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 098C12084D
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfCANcy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:32:54 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46719 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfCANcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:32:54 -0500
Received: by mail-ua1-f67.google.com with SMTP id j8so22390494uae.13;
        Fri, 01 Mar 2019 05:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HijkjE5ji6PvnJpxSWAxAvl5HiI6FCmEih/e76Ppe9s=;
        b=sebx1d2Y8/or/Vi63x70Tdbi3wh9K6rE4g1VVg1pPWhOxc0DsoOH4HNKHGIrs7zvlZ
         ifz6W2XkpmJN492J9esyFiYoU7xJGFUo43yTbYn673JoF7NX+Pozck/ERGhJO4wyEGDB
         +KisKIaK9si2M9hXSYI9NIjMWLLZT3GZJZl8xuXHn69CNqRChuvZVWWWaK46GGQX/8kx
         Kwc+/L/tBzctmeOa8RSCvT8Cq0bkKZQsq/7iUl74eHap9BYEm3YpDxItljSGBAjpUpuu
         7kO8xgQc+Ft42GzI0fgPjnZv+Ei9DQgV/U3uUg7zzGoRB4I1TW4QpqjitGvzqTdK+GIl
         7rmw==
X-Gm-Message-State: APjAAAUROUuNTiRcA2K4nF5SJYEH+BS8TaNqmYuLqY56QEfImJtaLbKj
        7rew9sOn2Xg4AAEFYF/jJLnF1BbdoaG9ADbI7qA=
X-Google-Smtp-Source: APXvYqzxeA+tkL7z5dAuGSidlnTno6cFbRHgw9Q6q5hjEKzTorejRpaTp88yDVRX8EnlG2xdBBlrNHE8A9HNOmqvnvs=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr2604169vsc.152.1551447173371;
 Fri, 01 Mar 2019 05:32:53 -0800 (PST)
MIME-Version: 1.0
References: <1551438212-22013-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438212-22013-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 14:32:41 +0100
Message-ID: <CAMuHMdU60gp+pnCuCv07y30d3Y8ggem8UK7PhPdr-DqQGzwK1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add LEDs support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 12:03 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds LEDs support to the CAT874 board specific
> device tree.
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

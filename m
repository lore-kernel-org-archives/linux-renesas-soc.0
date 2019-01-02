Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3081DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05CE82171F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 10:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfABKnC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 05:43:02 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46382 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfABKnC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 05:43:02 -0500
Received: by mail-ua1-f66.google.com with SMTP id v24so9743012uap.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Jan 2019 02:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qp5NIjPuXYM5zF4tW9maOxFQs2ov1UDqEnJa/fK1I4Q=;
        b=IE1zCiwMpAmptPtx/xkQ2XTL46uXkxdOOZzIN7B+scvn7nUZUKoKYM51dFcxRV0RtF
         yqocBYeH6jVt/vkvKxGU/xr9KIMT28FFHpdit+mqexpkNJE85nJkxp/oTsfJpGWvD9J/
         o8snECB3r7TSVzJTHOJuUNSNdDXr7NYh3MsJXa2rSY4U4NYELz4l7A3EjvnD5ErJ8BjN
         lhuf+qF8VVAAeLS3n3Cu2UmAlbkb4QZh0MixLUQPz4bNF2Uorx13lb5v60vPA0eMAZ0w
         1KYVTBPEtnzRYxZUGj4++4sM7S1siD68rL8yYu4xEuglRY6wloAhCFBPwEOcLRup1Z3L
         EOZQ==
X-Gm-Message-State: AJcUukcKa/HHyvPFg7WLTk/fPjHPUObWS3kHSiswLILXO/5ebROyoLFV
        yR3sbRectS/CEfgSObGo8ryqE9keRT+hWViyMjI=
X-Google-Smtp-Source: ALg8bN5HNxZukQ43XwKMSRXqCwwInGZ5TOvFD5kyjhHQQLtx1N4wOOqEMaDouwGy5R8V9oap1ffbm7VKDeVyK1H5ABI=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr16141522ual.20.1546425780537;
 Wed, 02 Jan 2019 02:43:00 -0800 (PST)
MIME-Version: 1.0
References: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Jan 2019 11:42:48 +0100
Message-ID: <CAMuHMdXhLJpvFOjr42v13sAJVja-ivG+6vnoUjWvAWSQML_0=Q@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B}
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

On Wed, Dec 12, 2018 at 1:25 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
> RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
> domains were still initialized and powered in the wrong order, causing
> 3DG operation to fail.
>
> Fix this by changing the order in the table at runtime, when running on
> an affected SoC.
>
> This work is based on the work done by Geert for R-Car E3.
>
> Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")
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

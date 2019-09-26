Return-Path: <SRS0=zpkm=XV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63D6C4360C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Sep 2019 12:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82B76207FF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 26 Sep 2019 12:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfIZMcs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 26 Sep 2019 08:32:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:47031 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfIZMcs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 08:32:48 -0400
Received: by mail-oi1-f196.google.com with SMTP id k25so1869854oiw.13;
        Thu, 26 Sep 2019 05:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3/F54ORvGt97+MVaQvojy5npEbiPmHF087tgurHI6I=;
        b=DZx5th6+HsLmJ0txcfFGKZEQIzjDs7eOaTTw8DMR7l0EzitRGAhG3dicTqCAS1DWLr
         7S5j/D1vWOCnKHBfoWWTuZmUkywt6WYqolHGUudYNC+b8GwHjlgZBLC9L2ZeLxVhADUj
         ziU26QGq6nEGvaVqqy4n/ZSUYnZ+5FtfmMHx6qy5wyecNkrzi76OjYfoDt9RWGbxnsrO
         BzWCPh4AZG5tXADxZRt2E7mD+LjrXENjjqPm0yCH9GDatGDGgfrKq0NFHyC4jCl60pGk
         qDiFYENbZl7IR4PxEUMgC2RyfZHKZXyynRrEiO8K85ptPAU/eKhNcDtV4rTA59JGu+3i
         076g==
X-Gm-Message-State: APjAAAXerhb2sG8/tnuJVYPfFULHbjQ6mD+Rt0oqvRwGXBuLIS+4Y5py
        gOZit3W31GqYaUGPnz85AubMCZ3Vx6igpesvNpvJ3gvr
X-Google-Smtp-Source: APXvYqyVlANqEkhoBoGyL0evymrpuGymIMJkMYY+2wZQlMct05w4drgpjYkxUJS7FOg8sdwbem3++7jDEHi0ed87IbE=
X-Received: by 2002:aca:f305:: with SMTP id r5mr2289696oih.131.1569501166984;
 Thu, 26 Sep 2019 05:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:32:35 +0200
Message-ID: <CAMuHMdUa7A8s28Wfut-kEXBXnpHe0=ZYjkQqp93EdcM=YEka0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 4:28 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
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

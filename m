Return-Path: <SRS0=rwh1=XE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DE1C4740C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Sep 2019 12:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 420C9218AF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 Sep 2019 12:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfIIMz3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 Sep 2019 08:55:29 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39824 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfIIMz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 08:55:29 -0400
Received: by mail-ot1-f66.google.com with SMTP id n7so12291804otk.6;
        Mon, 09 Sep 2019 05:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1s9yncQV1p0Ej/p8/RlpXXfw+fqwOfmAJUE921girM=;
        b=kxwe/f34PmmsMMB/VP9MjxksMACeow87KrqDnhKEdqRKz5DWW8stATjW5x+ZH5ms7W
         0WRCo0/yWIWd+OKIor9lGV3WbbOVblJiI0np/xNOJIBgfprCe3RibTdh3Q0vIKFsdCPC
         41oysvKqTrq2p957LJ5P8EMdLBaYCYrMPJsp1zyUSEMwwhEwqik9q2e2jRH4vITMxxUw
         6ea2h/lh4v1EoeJ5/nyHfki1wCeZZRJ44oUwO1JHEeTUtIggt6uzj1aFWHlFqj7HTKAY
         Zgpy1IFAUsuRxcUUACRUyA71e4SJFErBeLEFIAmdtiRkVRibyE+P4M70Ypci3paL/55q
         +daw==
X-Gm-Message-State: APjAAAVctXQkgfkiVGArnuqmLTyBvoYDJRnnvI0J/mjaBw8+YAkGV8m3
        B9FLoX9sdjpCGsyQNhzY3liBljXa5TS15RRd8H5YWA==
X-Google-Smtp-Source: APXvYqzxLkTozBDFxrQD3zlajB7PyqgW0gE+RR4TG1Xb9zZXOpLh3ba1EqmGC8dSI+C14QdXYajVlZvwBkJvsdPjkdQ=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr18438778oth.250.1568033727127;
 Mon, 09 Sep 2019 05:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <1567666326-27373-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567666326-27373-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 14:55:15 +0200
Message-ID: <CAMuHMdUeMZ5MOfgS7k+PTV8GO1u_gBWTffEuZA96djX=sF0EBw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add r8a774b1 SYSC power domain definitions
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 8:58 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds power domain indices for RZ/G2N(a.k.a r8a774b1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5, on a branch to be shared by the
SYSC driver and DTS user.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

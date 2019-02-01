Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24DC282D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52FFE218AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 13:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbfBANbT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 08:31:19 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37581 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfBANbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 08:31:19 -0500
Received: by mail-vs1-f68.google.com with SMTP id n13so4184087vsk.4;
        Fri, 01 Feb 2019 05:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=js2wI8q5td10a38/dZsw5X2ejaBL6SMLUYFiz0g2yXA=;
        b=IFIrR+OWk1juENBJB90MS/DAPqqgaM7JuDqDNVIP8A9S0KDX0S1CmWL3Add8N9gfJu
         SNWYks6BWgtPmMlinuzvUGCpBBDs6GgzxbP2BoxkEt5f6LCMKrthXaseFwXJ9E18sS51
         eWytfXgdXNvhPxNHP4+s61yB7qPf1wlSYMUMx/YbbET68K41u7MXigdFoAXuGde5WAT2
         SS4dZj+WNcMeiZdYE2fHj7HcnIaRy9YqPp/D8TnLCZHvGK2GOJNi/1TnP0ALiJ9mBBD9
         nkfxtBtk3OU2/ND64zm8H3MYW8d03UNjAkmFPvT+jurMstzB+wni1GpG1Bfzsl3mOx7H
         WFzg==
X-Gm-Message-State: AJcUukdTxUqsCHwqj9VJTcnaoyruPbZxwQUHu1Z74nf1/Rf0A7jF1CLU
        LxrvOq5hsBrqgREf3CCITFMJzYOfJ2IE5k3gC3k=
X-Google-Smtp-Source: ALg8bN6ievi/Kx1o+YMqs+y8Bc4/H7KtYbKYvv8MkMwjWrq/mPlYCDdBw8Q0jSwWLdNa7YixszHk0Ak9iMS6Npzq/AY=
X-Received: by 2002:a67:3885:: with SMTP id n5mr14363436vsi.96.1549027878400;
 Fri, 01 Feb 2019 05:31:18 -0800 (PST)
MIME-Version: 1.0
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com> <1549015841-33536-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549015841-33536-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 14:31:06 +0100
Message-ID: <CAMuHMdUGtjL5Br9w8S4K=pYo9L6xnMHt_-iJ10utD1QeasS_zQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: timer: renesas: tmu: Document r8a774c0 bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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

On Fri, Feb 1, 2019 at 11:16 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2E (R8A774C0) SoC in the Renesas TMU bindings.
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

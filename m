Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B12C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 13:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13C3A21479
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 13:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730324AbfACNr6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 08:47:58 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42123 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfACNr6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 08:47:58 -0500
Received: by mail-vs1-f68.google.com with SMTP id b74so20755892vsd.9;
        Thu, 03 Jan 2019 05:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otw8g8K26ORJl3mAdHu6CUURfpFrXnQlSdvOgf3Rqow=;
        b=quNG6VBX8BABbZZDjUBJhZTFyN2mXaaQ6TtcTkzI5NjvJDk6RptrYc7tWviTnsMPgk
         VUkJQX5UAbdtYE+0mVoe1sGnO/vj9/73sKZNq0EtBXV7cDWL/R9dgmsnFXxWjN9Ue/qb
         7FJkL8XSqD6R0KjbgjPg9OfH1U/OUKZHzvMR1oOVhaOr1/txlD6Em9qcIYdoO5/k2p6Q
         huz1bOCwJQP/psTTl7F00nDc7eg92cF4CEsSCbQimfh4S0ASrZ2ISIDm9cOqDXX8Snun
         w4ZW6mcWHBA7wbDGtNCqDeuQ+P3SfVQznCpcj/990WbfWoNAVu9FYMZ8pSU3lcGiXUsD
         pz/w==
X-Gm-Message-State: AA+aEWYrPgKuiPcqPTRmcwuWnnvFvcTN5YV/pivJGDy5JRJcoiWa3GGI
        JZCLbesDAfB68dy/2hbswzK7ddYMjPIw2cks85A=
X-Google-Smtp-Source: AFSGD/V4ESlmS2nzXGEmaAGDCxIO354C/mIE2tsOgVK4xTnp28rJBAaF/5I8pzKFBDD35PVXGzyePTyWAEnzwdCUiow=
X-Received: by 2002:a67:c202:: with SMTP id i2mr17226150vsj.11.1546523277482;
 Thu, 03 Jan 2019 05:47:57 -0800 (PST)
MIME-Version: 1.0
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com> <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Jan 2019 14:47:45 +0100
Message-ID: <CAMuHMdX-haM7YwUXRo7JtEZ4dt6MxbHv5VeTGTAgP-2+4iN8mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> ---
> V1-->V2
>         * Removed LVDS encoder definition from DU node.

Shouldn't you add a new node for the LVDS encoder?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

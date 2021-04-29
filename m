Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F76CC433B4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Apr 2021 13:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D96A76144B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Apr 2021 13:49:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhD2Nun (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 29 Apr 2021 09:50:43 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:38691 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhD2Nun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 09:50:43 -0400
Received: by mail-vs1-f45.google.com with SMTP id w24so9768197vsq.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 06:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5RyT9SM9xtug2i+DPDmw58hz4ntUFysUwLjY7iQxNNw=;
        b=PU6O0r1il+TgPq9v6IGV06+mPVJPQzuPJtFtuOYMTcd8sHA8hGsqEuXSCCXIrgl2CY
         tgZ6qCQz+CVqiuRbtTJYme0NRlLaB4/gIqrXaZb7/K+nebdUXy6714F8pT0dPtofp1lD
         q3k4iYRC0yIlRPK5hdVNDboV9g0UTyOECNFJ7Irma3O657Tn1xOfQ2s4K1BemgY7eH6z
         hAL4f147jAo8+BkpCzLHUvaJ3PildiVTQSWBykW4Lhp5mOb5HZBbRO3sukUCZNNO5uk+
         IxLFM9NiWJlkw48HOL8UaiELbCpU/eQAW/8cscw75CUeaEdrT721t3xF/2+UJ+1xy0/o
         5pdw==
X-Gm-Message-State: AOAM530/EnR6+aZg+KS7NVfxITCDpFNf8pRY1ZRCmmmm3g6qKMVT63qY
        TbOtFwIMFygEUSuK0tUVIVUiz7UQl+cxSU/fvo2S1RB/
X-Google-Smtp-Source: ABdhPJzOUEblktvbgiZ5J+MgWNiDo0cxspF9XASxa/XUjmtd25/1HPPv2EmeAGTlRKgiM6WzAJULFm2tbBDUz4GEUxk=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr30701443vsq.40.1619704195117;
 Thu, 29 Apr 2021 06:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
 <20210429133258.GA6746@ninjato>
In-Reply-To: <20210429133258.GA6746@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Apr 2021 15:49:43 +0200
Message-ID: <CAMuHMdVqm=mD08xec5RGzzqwfWmxELg7fiEej+C_73qMzGPQNg@mail.gmail.com>
Subject: Re: [PATCH renesas-drivers] dt-bindings: misc: Fix logic analyzer bindings
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Apr 29, 2021 at 3:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Fix this by correcting the indentation of the "required" block, and
> > adding the missing include.
>
> Thank you! But this file is going to be removed in v2. I agree with
> LinusW and the GPIO crowd that bindings for debugging do not need to be
> "official".

I understand.

I fixed it because it was bugging people working on Renesas DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

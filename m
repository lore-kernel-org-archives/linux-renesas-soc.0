Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2F4C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Sep 2021 17:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C047C61090
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 21 Sep 2021 17:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhIUR1x (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:27:53 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:46077 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhIUR1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 13:27:51 -0400
Received: by mail-vk1-f173.google.com with SMTP id y74so3877779vky.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 10:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTofcWqKok0wSBMYsVIXU48eonB+XSXx+E/zsIpLvXk=;
        b=DriGCUce7c0hOc8eIrJD964XvKSZEU0U+ccMKIwEWKdyRVZKywKLcJ0ncrZ0vN/gTI
         gyy15odabtxyaIj75yv5kFmKNd4a1+OqOXowurObN7Ihu4S2LfCtDngFCFSZQ0Sqlx0s
         0GrjUvi5oFeETtjz/e7JsPm70H+CoflCjtJ5W852WAUC7HbCKRA0/ME1zr6KIdM/ZlUT
         U21A7gKTFIhjBDAc4C8ttjcmn6nP++EgbfSsmJAqeqarmvl18EW+MNaJGJURBUk/ckcT
         mYgT1vs4tUwKzJYzRPPSEWJFIMldG1k6ApUZyfutej6u3xqUbvOoO+JGDaqaMoH8xt2E
         eMbQ==
X-Gm-Message-State: AOAM532QufdfsoR9Dne91l0MC+LbJjU7gWCxSAw/GoCS3Jahu38gnbQc
        amMLYU4zOn5phIJYYY4AlDxEokjENUgY+a9K9gyhs18jaT4=
X-Google-Smtp-Source: ABdhPJyQcKoNkSaczKzl4O/1SzMWQPpbN/AzC279p9qlhFs+fWn2pMcAJloZswlqDD1L3ODAdez8czNIYxs4mbIl6Rk=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr8671785vka.19.1632245182815;
 Tue, 21 Sep 2021 10:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210915153143.25184-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210915153143.25184-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 19:26:11 +0200
Message-ID: <CAMuHMdUMyLbHsRXoXxgDn3+8VECa7=iBEvA5aosbk6Qn2FerAA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: add Renesas TPU as module
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 15, 2021 at 5:32 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For better build and test coverage.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

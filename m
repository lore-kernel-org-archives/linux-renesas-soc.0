Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F54C4361B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D46B23EF3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405984AbgLKMvv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Dec 2020 07:51:51 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44400 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406006AbgLKMvo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:51:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id f16so8054534otl.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XODk7vx/kezVA+uqz3mqm8tv6+XzVcvTimopyR1Prng=;
        b=ULeSb6jkMOwAqxK/ZkZrW2e/pJO9YUaycxW/FDR/wbEBS1Yyw6Chd+xcO+fbUI83Ft
         pOShyqF6glcc4jzUDeKusiqCv8ZFim4ClqqVnPplYoItRQztfVgnXIgSXcsFkoSHyVaq
         INLrkxey16DdC7DOkWK5QecxVRYmg+551fTKTRL1vXnekbS8vAoxpXrb8dnLJuQ6L2Jp
         reIDT6+77XMoU02MD+WV94cxf0qtYy2bfT79hL56IR3u1ctPgv3/tHdccEbMQ0M1mfhd
         aMgw6V6L0X+nMRJwfkqDvIl9ajBV9keLied2bSoqEl8c2B3XMeLkaFk4f0IBcugmmKOC
         O1+Q==
X-Gm-Message-State: AOAM533h+CD5xFjh0C28mVgW0H883HpEGaevwDFkujvi18olTNxfHkKg
        mvPE44p8YBABij1EItzzrIxEaeMWTRMFB0qzKRfUMyVpX5M=
X-Google-Smtp-Source: ABdhPJyiuHPeo0EKY9Ps+68JDs/Jitm0BFLxWjCHPN/MdsLXCcpxlS5FxCGQY6IaMUIUzMvSsmPnwDPlcJtgprusuxI=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr9649601otc.145.1607691063616;
 Fri, 11 Dec 2020 04:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh> <20201210142021.163182-6-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-6-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:50:52 +0100
Message-ID: <CAMuHMdXEnhn4N54NPvNSaMzzkwBs=F3ae1oEAS0HXxmWB6zkwQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: r8a77995: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 3:55 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5838DC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 08:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3272320652
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 08:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfDZIj7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 04:39:59 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41523 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfDZIj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 04:39:59 -0400
Received: by mail-vs1-f68.google.com with SMTP id g187so1472783vsc.8;
        Fri, 26 Apr 2019 01:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBixqNqIMPsXeXSXPpIgfFAQ+IDVCbwmODsqttAA+Lw=;
        b=jqQLvc1FA1vHohgFRbqLREG2W4WltARReiRl42E8uD/J+P2nAkCJogytPxaNvxQBE2
         3ORxfOXdSEMOspG8fUhLnwGhLj5uGYyIq3HKEKHob88fleQq7KJht8JXoW/FlWrD/ZVV
         CqxjCJWVOYoOGkC+/kthFw/cmKqk4WLi6Do97GhTgugs+UzPv5cen5ipYqazSUTIEEMB
         uZqa4JT1l0GacTEf5GX9UZh82asLDcF5sDuUlwcUwvZwGkmYjt5cGp8MKCZ09L5AdF54
         vHaQPJMZJrxQNbNvIvHKKmqCpUkolDHaGyuShIYEV9Ihrqf9A1rNoNyv50XL1vBTzX7B
         Niqw==
X-Gm-Message-State: APjAAAU9zRMnGD5ottb2K7OCzM++HKheWYx6vHuzzOKOMgiuWt3DydYJ
        c9m7uq4PKY7GO2lGvCX3zYPo0Qxg45mu5r8xmNs=
X-Google-Smtp-Source: APXvYqyXHpjA4o7pdz0LIFHNsp3g5hL9vOxJttd6M1jwdF2iW4Oa6Gx1XBgwAoMFFUKkOcsUckCyydmBsy5qucPdm0s=
X-Received: by 2002:a67:8e03:: with SMTP id q3mr13117767vsd.152.1556267998292;
 Fri, 26 Apr 2019 01:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp> <1556155517-5054-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-2-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Apr 2019 10:39:46 +0200
Message-ID: <CAMuHMdW2Y6ZcE5hDpKgm3K67oNJ8vrbERBCn6Ua+vT2eBWTT3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: r8a779{5|6|65}: Add TPU clock
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 3:25 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This patch adds TPU clock to R-car r8a7795/r8a7796/r8a77965 Socs.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

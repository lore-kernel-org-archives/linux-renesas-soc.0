Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB63C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D3762083B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbfBENNe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:13:34 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41369 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfBENNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:13:34 -0500
Received: by mail-vk1-f196.google.com with SMTP id t127so760405vke.8;
        Tue, 05 Feb 2019 05:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGqZxHLUFnK7EV5Doe2PJbgBzyIT2Ll/KvMOlrXQ+gY=;
        b=nGyEwWoLfcFyybztKKnuJbBvXVvzy1+AJsLqr5LO2zzshbZBXCwt19GGjKlafp2Xx/
         Qhmj5QPoHx4NZoFGdAoNGgm/Yt0CeQ/edkreuxdwZx90b7vN7bx0VTpIhk4fA0afVMBy
         fjjS+SVpMiMLkT2tS45P1P95KYzbvfgS/t5NaPWWGXQLfMVXsvzd7WxzAWotcPmA+lJT
         b2Q7klG/1tuH0ujyzoB2dUdHzt+pYgf6sNybM7cCbnytrIZCGwvH4hAo5CtnTy7IBe8a
         UHU87t3Kr5SwF7eZAJWE7fZMdEzMzTrumU/u+WolbQMthInLsqVpx7Kmui3Pyj3ZQDeQ
         O4RA==
X-Gm-Message-State: AHQUAub3/igGVOCA0tiRZ4dOq06YYAO0suedIFgmAFl3Po1GA/bUpXeA
        D5SVLaA5BqwiSEX1JEwvewgEqvKgLE2gZkfUyjc=
X-Google-Smtp-Source: AHgI3IZTZRaJU5fZEnb0d7UhKrQEW4AfC/w5iqamemRBnsLO5M66DawYcnMUw9sYMYDzmqnZ4cH40TpIkuuRfexfovw=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr1989610vkh.65.1549372413876;
 Tue, 05 Feb 2019 05:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20190205125841.12445-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190205125841.12445-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 14:13:22 +0100
Message-ID: <CAMuHMdVBG7P2McwpozuwYmjbEnQy__t4q-FXTWDTjoS3+5Hvew@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: gpio: merge two very similar comments
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 5, 2019 at 2:11 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I think it is clear enough if we have the explanation once and make it
> clear it is applicable for both SCL and SDA. Reword it a little with
> the help of Simon's native language skills :)
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

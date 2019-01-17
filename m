Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AF0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FAE42054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfAQKab (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:30:31 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:36522 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfAQKaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:30:30 -0500
Received: by mail-ua1-f47.google.com with SMTP id j3so3283401uap.3;
        Thu, 17 Jan 2019 02:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnLwTSUpL59eskMT7nzSGW/Ctws+B0IDG8So5BSFbNU=;
        b=Co6SQIxHKqHyOjuISGexY8qyV6Y7PYK6HtnEaoMB3JKIJo7ITOseRwpm5rYiZoDha/
         AFVWxY2y6L85bF0IifFhqpVUVh6MD+D5m5n0E8mEuUMtc/pAEXT3s40zbYX/rtKDyQ7a
         J0ATGIB9qn9TmfCuK+4Ti7MF5AbHZSe7xpgueOSH2b0zS/Tcys61lHKeSeHlVldFrSZ6
         aPbtjv0Ltfzxfx5jt0HDMwKx3e31pgHDaGx2B7IhwkhVH4J/39n2piY9RW7k7zSBkgtp
         Mtp4JT+M/fnvUprU1vS82KvnmSiYs6v8t/ZEqpu5LQb7zpVpHUpGzGzUtGtCxnRaNTnH
         9VBg==
X-Gm-Message-State: AJcUukfXQYNm2vbTIAPG6zgSaK78hc5W68FLRdFCqkOg0iiZUxesoSAD
        tl8VuWQNoE/Z3Lp3Pqg7XAdQ3uZADzXdbz6AdvBRvOj1
X-Google-Smtp-Source: ALg8bN7VyykRSys1AIohtseXRaaQ7BZoNHWnjUqc1a8zwbIjFpej6oqII8QgdE4dyCLcLpXaFywRQlhFQ+8n4iK8XkE=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr5650497uap.0.1547721029738;
 Thu, 17 Jan 2019 02:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:30:18 +0100
Message-ID: <CAMuHMdV8VfRZMEyrGjcdDCAHqpOErGziXMi7acRf8=FR-eC+HQ@mail.gmail.com>
Subject: Re: [RFC/RFT 3/7] i2c: sh_mobile: drop 'data' argument from i2c_op function
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 1:35 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It is clear that we always send the address in TX_FIRST and data in TX.
> No need to pass it from the caller.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

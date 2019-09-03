Return-Path: <SRS0=+A3t=W6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B24AC3A5A5
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  3 Sep 2019 18:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E91AF2168B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  3 Sep 2019 18:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfICSkT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 3 Sep 2019 14:40:19 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44700 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfICSkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 14:40:19 -0400
Received: by mail-oi1-f194.google.com with SMTP id w6so1071054oie.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2019 11:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwW/ZaCzW4JXze/ZSCYCQTqum4OOdWq6wZhwD4U7IbU=;
        b=YBOKP8GTiqeZUf+jmYxheD0rNsfP8ZXfncwPwSkjrWn1s5HtjtDRcW7m5ipfBnWa5e
         +oO7Z3S3mC0ANrckJa2C4zMRtrr8hcyRq5+6xTFH+Cy97EEQ9pwQEZxG7QryDanhcmsY
         ed+0pGrt7iz2hsPCHv5Pvqe25xMb8qFaQzddF6BFTlMLvsUwvp+SDvKAZLJll9Tb+5Lx
         UDoSfu1yLFBSxW5LcaFHNVZTbERabQT8q3DHvkqevcg84J7VNCIcOODgd/AY8fp3u2rS
         JdJp7b4TROPPE6yMPguXuqgxhNTh3liwnr8wYAEq2Aie/9c+7OE5JodzEc2Pn/RzhuAC
         ye5A==
X-Gm-Message-State: APjAAAUceiAbU6NmcI/Uo3SsItvYIX8iGPDEf7WFYXKVbZpWJZECeuCX
        8LLbEVuaH9DGxfC8slzg5+O7Pe+gH2naCaXOxsI=
X-Google-Smtp-Source: APXvYqyGvUJQaiykPAO6kJHLzsK+/i0wzkg8waebEBs5LoAq4nq8eBgl/rwnf8jyCYHqE83yAYLHkkaiXusXBEsgjDk=
X-Received: by 2002:aca:f305:: with SMTP id r5mr495480oih.131.1567536018191;
 Tue, 03 Sep 2019 11:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190802120355.1430-1-geert+renesas@glider.be>
 <20190802120355.1430-3-geert+renesas@glider.be> <CAK8P3a0S3axohc7iq_vx_5i+KGiC0fX=rctvY8uXdhwz6Z9YCQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0S3axohc7iq_vx_5i+KGiC0fX=rctvY8uXdhwz6Z9YCQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Sep 2019 20:40:07 +0200
Message-ID: <CAMuHMdWifJ9V=Zzs5wk2wnhEXdJ3LXJGO7bcinC45g6a-tpK-g@mail.gmail.com>
Subject: Re: [PULL 2/3] Renesas driver updates for v5.4
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Sep 3, 2019 at 8:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 2, 2019 at 2:04 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Renesas driver updates for v5.4
> >
> >   - Fix a flexible array member definition in the R-Car SYSC driver.
> >
> I see I merged this earlier but forgot to reply.

No worries, my git notices.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

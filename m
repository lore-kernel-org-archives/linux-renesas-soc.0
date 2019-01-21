Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F156C676FF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 10:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F20E120663
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 10:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfAUKD6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 05:03:58 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42383 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbfAUKD5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 05:03:57 -0500
Received: by mail-vk1-f196.google.com with SMTP id y14so4443041vky.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 02:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+PQxHb5c2eejUcIebzPvF/0R8AJVOMBpQQfKCgYbtQ=;
        b=QIPUOtRlEJH0UUE9kQQNaCe0IPYTY8kHqARvo6BfzAzVOLbIMWhui0P+p91Qt06trw
         Y6XGgOTbY77qGu1r6I8zYdT4J8wMBZCuoMG1NSzAk8FkHZa3rGZsNNx4F7H56KuVXGG7
         npJ0ueBAJwtXKAfZDqb6kUxCAOABHuNLvoALeDEWQFmICTm3SdJXUckOtX9HR04TJPoZ
         rjN7TlDAirSzapd+u9cYn0irbYUw+ba8Q9MHL6E+VOc9yTUPGjHMJVR0kVVI7w5GmLjE
         7abxzcxJ0vV9y7wG7vKhbOLYbWgjFnVxgTLDis2f6hV+lQxQhJ4vDRoz7UhpJyOEgAUv
         QgaA==
X-Gm-Message-State: AJcUukcIjARedsICNChaUzpNCH1B+tbK3i6/d5S3SDJcMQi4AeYsxhs0
        jeObMSDvYtF8CUFgeBJ5gW+klFSmv/7/+Hug2do=
X-Google-Smtp-Source: ALg8bN6PyM/YkIfjAyfvelTqlQntHuUlacj5ywy1OOh3eo5wfkPT0zdX+KEf7RtUyGDZlpiM4w7U8oLR7/9ntyayWUg=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr11457486vke.83.1548065036233;
 Mon, 21 Jan 2019 02:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20190118162258.14592-1-geert+renesas@glider.be> <20190121093506.GQ3271@phenom.ffwll.local>
In-Reply-To: <20190121093506.GQ3271@phenom.ffwll.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 11:03:44 +0100
Message-ID: <CAMuHMdUzhPg_sR93J2jADS-x-NFofPJR=d6a6qpt50mhyhU-xQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] drm: Remove unused Renesas SH Mobile DRM driver
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Mon, Jan 21, 2019 at 10:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jan 18, 2019 at 05:22:58PM +0100, Geert Uytterhoeven wrote:
> > Since its incarnation in v3.7 almost 7 years ago, no users of the SH
> > Mobile DRM driver have appeared.
> >
> > Hence remove the driver.  It can be resurrected from git history,
> > if/when needed.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I'd prefer removing the fbdev variant tbh ...

I understand ;-)

But sh_mobile_lcdc_fb is used on 5 legacy SuperH platforms, and 1 ARM
platform. At least the latter is working fine.

> Not sure why exactly the switch never happened.

Me neither.  I^HGoogle can't even find posted patches of board integration.

Note that both drivers lack DT support, which would be very desirable on
ARM, as graphics is the single remaining working driver on the Atmark
Techno Armadillo 800 EVA board not using DT.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D1FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 08:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ED61217FB
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 08:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbeLPI1t (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 03:27:49 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38284 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbeLPI1s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 03:27:48 -0500
Received: by mail-vk1-f194.google.com with SMTP id w72so2208709vkd.5;
        Sun, 16 Dec 2018 00:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvuIv9Opu347ee3NKs/sIe6eepTUwvgoq9wLeC/bT4c=;
        b=NFG734I6H2ZtTtUP3Nkbuz38FWadZp1WApk2gEQsdwOCgIgd9mKiZFND7QLyWmXiIg
         J7YlXrZfaCZVtIvFW8cx4Y1QJq+xFASfagDwWA5QOrGs8hmHie7Kd6oHuedd0z8kI5K8
         I5Gfigb3/FyvJbF4xeeacJGHxEyxUUC9jFynAmZoNYxn3MgcThAiTvMB37Lk4+Kx4gl6
         EwsKewNoBnD93qwF3gFJ+OtformVXf565dfJrhjuZglT+GR7OHp37O/PVcw083I8sOV2
         eDwvx/8IkTjEaT9Qr8rN4Tg6wkpoMu+yTn3zVYqA8egDjQL3enqL+DdQdr8wtrUbyMH2
         EQyQ==
X-Gm-Message-State: AA+aEWYGVtnaDn9kvf+PVoLZGQPgkerMVGpI1Gb8WqinMV8rq12OdXBL
        UdTR2ykMz6HnpprR4fuOd33JaO2y3/uVCg3qrl8ZYg==
X-Google-Smtp-Source: AFSGD/XBG2oDTwWa9HBR4PMi2mLC0HNlFvsZtcuS3Mf/mRe6MwdyAlXkSURPdmb5zRv0LdMG5FUJzWGcYpRYtwLCF9g=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr1890843vkp.40.1544948867389;
 Sun, 16 Dec 2018 00:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20181213184444.21904-1-geert+renesas@glider.be> <c6dd8a4a-234c-ff1e-0d22-7af61dcec427@landley.net>
In-Reply-To: <c6dd8a4a-234c-ff1e-0d22-7af61dcec427@landley.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 16 Dec 2018 09:27:34 +0100
Message-ID: <CAMuHMdWd6N1w0-gb744xEJOh8zGiBoru8yZCdNT1O69fbdQ__Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] serial: sh-sci: Fix fallback to PIO on DMA failure
To:     Rob Landley <rob@landley.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, uli+renesas@fpond.eu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Sun, Dec 16, 2018 at 3:22 AM Rob Landley <rob@landley.net> wrote:
> On 12/13/18 12:44 PM, Geert Uytterhoeven wrote:
> > When submitting a DMA request fails, the sh-sci driver is supposed to
> > fall back to PIO.  However, this never really worked due to various
> > reasons (sh-sci driver issues and dmaengine framework limitations).
>
> Is it possible to test this under qemu-system-sh4? (Does that emulate the DMA
> controller?)

No, the sh-sci emulation in QEMU is very limited, and does not include DMA.

My patch series does not affect PIO mode, only errors paths in DMA code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

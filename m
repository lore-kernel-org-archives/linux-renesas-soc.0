Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C46C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D44820656
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbeLQNmr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:42:47 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38525 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727661AbeLQNmr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:42:47 -0500
Received: by mail-vs1-f66.google.com with SMTP id x64so7704854vsa.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 05:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0TDtzKeI0cmhgL6IHVxQ5Q1H5y1YQiW1QYLz/5nb9E=;
        b=OHKl62u2vZtCDNF8UoSvZ5MtzMU4/HnIWorAtU/Wmj4mCUzeWtEXI9Jcc3O2xjPhiV
         Le1gpzGPt7/QI0uCsCXAx4ZP1N316bhjo1O/m+R+5GUoKVOr/uc5n/1rMBITUarNogF6
         0dQB3nU3ZTDkfld2wG4fj6Xe17IZ25d/eC01Swxxsy2hIZx8KjQqOdq11aFzOipfKguZ
         SwpGbBNcLkXQ4q6z8qQBmwo9OFxCvwuOrOhCE7AS+ninBR3R9bg4JQ7eKXP1O6hvG86l
         aDVUae3qMLEwB5z9UksiiXGYBfb5iuKebPA9NW6N2ya8z3GfAe5U55ae8H198UDS8fGR
         J1rQ==
X-Gm-Message-State: AA+aEWajUoBZ3C71PdShu69qYeeTJktl70j+SfE9QqeHVuSGWcfcNLF9
        Atb6eTl2WPMjkkD7IGu4Uf4MsSyySysrSkIucLnPQMDF
X-Google-Smtp-Source: AFSGD/XctZRGmAuO+TS5QlYY1k5nK5OTujdAeD4UatzFVp0Mv2F66SGIElyPeZmJ7ByUAeOZqtqztvjAHbWBP4qlsXo=
X-Received: by 2002:a67:d119:: with SMTP id u25mr5987951vsi.63.1545054166071;
 Mon, 17 Dec 2018 05:42:46 -0800 (PST)
MIME-Version: 1.0
References: <4714815.IyZ5WZzCdP@avalon>
In-Reply-To: <4714815.IyZ5WZzCdP@avalon>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 14:42:34 +0100
Message-ID: <CAMuHMdXXxrem0XDjO-tRLLz8Mn-NHtNJkMQ0ZD5VsXRG0sz6YA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] DU -next branch
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Dec 16, 2018 at 6:11 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 272c1a9b493986a95219dce674c49877d98cf90f:
>
>   Merge tag 'exynos-drm-next-for-v4.21-v2' of git://git.kernel.org/pub/scm/
> linux/kernel/git/daeinki/drm-exynos into drm-next (2018-12-14 11:27:24 +0100)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/pinchartl/media.git drm/du/next
>
> for you to fetch changes up to e4b271f20598eb17c60a508dcba1e35a4f9d2a8c:
>
>   drm: rcar-du: Disable unused DPAD outputs (2018-12-16 13:55:03 +0200)
>
> They contain all the pending DU patches, scheduled for v4.22, on top of Dave's
> latest drm-next branch.

Thank you, this merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

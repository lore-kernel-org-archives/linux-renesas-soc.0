Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01959C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 09:04:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCDC520828
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 09:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfCSJEP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 05:04:15 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40647 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCSJEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 05:04:15 -0400
Received: by mail-ua1-f66.google.com with SMTP id b8so4568783uaq.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 02:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CbOfvSeotBWDiOpvxgVaaqeppwD2m2l+HOElIf3ZSWk=;
        b=RrxcytBt16hisDMnN4GHYyD5CKLUejvYFPP7srZEhnIH6l4Gb5wsDPp7vOsuJF+pfz
         m0d+IOuQ3yB7/SAefl6RczyFo4N0cWyQLDCxbI+p24HsT0Q7WxjJTLHAs2yivLw1YMfp
         096ykSK2xkSvnf62QOogznPHq3GEzcKAkfJu30N28NAv1QI4yFwoIWpfsx6R1XNLClgy
         Kr0Q5s+/gf4WRV0Y3NbWsiZQAu1P99auygwoEhckYVGV3bQfR+Bw/doKwlaTcmgBfnY7
         SgogRhYQT1m3wW28cvHu75uYr5yE76jn7Q58cHV7m9qW88p/6yGEAQZ2UWjUhr044kFT
         PKog==
X-Gm-Message-State: APjAAAWYSF3qLIRxOxl6pEXAWCKF+mvemEiRVnBdzkGCbiFxvihrwji2
        d5YgGJ5RzeYIQswJievB8TOIoAO3+sagXxedkPHucEH8
X-Google-Smtp-Source: APXvYqyBBN4OrWZIYvyi8OPHwJ+Z1v5ajZEjSUlDKAJ9gr+uaT9UM1P+gPNorWwWkYsoT11w8FYfaJKfRnXK+9A7Nv4=
X-Received: by 2002:ab0:6193:: with SMTP id h19mr550044uan.47.1552986254206;
 Tue, 19 Mar 2019 02:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com> <CAMuHMdUKk=kU-kGBPg6jHkgd2ba1tiCzVLjwvfxfhMWq8GqWWg@mail.gmail.com>
In-Reply-To: <CAMuHMdUKk=kU-kGBPg6jHkgd2ba1tiCzVLjwvfxfhMWq8GqWWg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 10:04:02 +0100
Message-ID: <CAMuHMdVFR3G394exJAgXmPxndsNNeRkfQF5GQdbwFMjk2Kbrfg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] du/for-renesas-drivers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Mar 18, 2019 at 9:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Mar 17, 2019 at 9:09 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > Please consider including this release in renesas-drivers.
>
> Thanks for your pull request!
>
> > The following changes since commit 0f1d37e65a59e9db33ab85f6e2c9784768ef80f4:
> >
> >   Merge branch 'drm-next-5.1' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-03-14 12:15:02 +1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/for-renesas-drivers
> >
> > for you to fetch changes up to 99deb47fa63bb9fc7bd691e358fea1c5bccc1da2:
> >
> >   drm: rcar-du: Add group hooks for atomic-commit (2019-03-17 19:29:37 +0000)
>
> This has a merge conflict in drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> with Laurent's pull request for
> git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link~2
>
> > Laurent Pinchart (1):
> >       drm: rcar-du: Support panels connected directly to the DPAD outputs
>
> Both branches contain the above commit, but with different commit IDs,
> and Laurent's "drm: rcar-du: Skip LVDS1 output on Gen3 when using
> dual-link LVDS mode" builds on top of that.

JFYI, I found a third copy in Laurent's drm/du/next branch.

> Nothing I can't handle, though.

Idem ditto.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

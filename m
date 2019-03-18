Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412FEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1905A20811
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfCRIPI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 04:15:08 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45375 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfCRIPI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 04:15:08 -0400
Received: by mail-vs1-f65.google.com with SMTP id n14so8881695vsp.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2019 01:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsPHwK+59+i93+v7IHAsObk/598lWTJuZi8x4cqDUXU=;
        b=s/FCUmnKlmoIYFMCIUbMIvtVXi/+gc7/8KQ+dFX0Hu2U6iHSyiDbtlaGyMhm0xrEoY
         6GVPm36gTn2SSRC1oJhfpVwMePV1sNAMWAx4Fei+liYmxBgi8d/jEhx65BxTJzdJRl+M
         4bOf8AJaFk0WjjCsNpn+qNm2WqiYLQ2AZasPN0zZ1/CvYB3ePA/bisxY7hOtygad+AYF
         dm//ZyhtoHMby4p88CJUwaM3wbmAoHo88cWSTby3Jx8CN2VI0a6emr60ePn1s47LaZYs
         IOzep9rQU6+KHaC7SU94uGG8a46FrIX0RsrUpXhKo4R8dxR+2LtILBJbgt62dYJu+bX+
         kCVQ==
X-Gm-Message-State: APjAAAXON7tTr852uwj1WTQksOK585uJyMsWcSIV9vekQNWNy4s2k2eR
        HldEZ7WEitTlcRQGQqdgvJTF4kReaksy7wzfZiunxK+8
X-Google-Smtp-Source: APXvYqwEnZ9pa6HiUzWq+HtbmyxB34OMiMI0xKpFK7SkYqMz7U5Gb+E7Krlp32b9oDBVOb/OKLwxnDjyCwdWYvUq8eo=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr8558268vsp.166.1552896907655;
 Mon, 18 Mar 2019 01:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20190317200953.16323-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Mar 2019 09:14:56 +0100
Message-ID: <CAMuHMdUKk=kU-kGBPg6jHkgd2ba1tiCzVLjwvfxfhMWq8GqWWg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] du/for-renesas-drivers
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran, Laurent,

On Sun, Mar 17, 2019 at 9:09 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider including this release in renesas-drivers.

Thanks for your pull request!

> The following changes since commit 0f1d37e65a59e9db33ab85f6e2c9784768ef80f4:
>
>   Merge branch 'drm-next-5.1' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-03-14 12:15:02 +1000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git du/for-renesas-drivers
>
> for you to fetch changes up to 99deb47fa63bb9fc7bd691e358fea1c5bccc1da2:
>
>   drm: rcar-du: Add group hooks for atomic-commit (2019-03-17 19:29:37 +0000)

This has a merge conflict in drivers/gpu/drm/rcar-du/rcar_du_encoder.c
with Laurent's pull request for
git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link~2

> Laurent Pinchart (1):
>       drm: rcar-du: Support panels connected directly to the DPAD outputs

Both branches contain the above commit, but with different commit IDs,
and Laurent's "drm: rcar-du: Skip LVDS1 output on Gen3 when using
dual-link LVDS mode" builds on top of that.

Nothing I can't handle, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

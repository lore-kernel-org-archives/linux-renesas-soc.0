Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76087C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2962B2145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388121AbeLQQUE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:20:04 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41713 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387807AbeLQQUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:20:04 -0500
Received: by mail-vs1-f65.google.com with SMTP id t17so8025623vsc.8;
        Mon, 17 Dec 2018 08:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBbzle7Pp+I6cO5tLfCZzU0Abo0e0jgZejfR6EdZ/Ig=;
        b=HyuQsnEimy24f4lvJvJ5YiXOXUi+5agqga/Oc1zCDu+CegN89mLvzoV11PtMfTvP1V
         aXwK4C5/D47Uq0AaSxTxr6OBIe3+5c5i2q36yqSw2Sf/VFZawgUu62he/JQnnxPbLkV8
         3p6v4Dwy6ZpKjULd2cnBBa1MQKnMs7ji5UPoxMyRPlgz70DhOwqeXj7mzREVVNiFynRt
         c870BMFIh4le7jZ80T/XNTiDQYaaw2AqfWUvhQCflRAIIQCcI32ZUEx2RyGr/m3CJSL6
         H0eoKpR87Tn+kSSp7gDOXOYOi/UN/N5B7YgWfWkZ0lSMzzIY74i2h3nAYjRWJLkF0pSF
         YjQQ==
X-Gm-Message-State: AA+aEWZXwZeUgwl6x7t5ZgZn3HX+AcUenkCD6XP3DK/804+P+b/tHOSd
        d06Wx6Lj3159LV9KqBJBsw0DNOoKuTbfgBBFEW0=
X-Google-Smtp-Source: AFSGD/XKlcH8dH22luUyDGVJQPooHXxEpvjWWEXidIjSsYl+f3buABMEQwhm8ZuMAF8kuknE8Vg8KRqNuf4x2nBNKzc=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr6764756vsm.152.1545063603444;
 Mon, 17 Dec 2018 08:20:03 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-16-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-16-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:19:50 +0100
Message-ID: <CAMuHMdUiptasxBTqg14cM4WzWXRQPWZ5zAV62OdBXZJoHog-jg@mail.gmail.com>
Subject: Re: [PATCH 15/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 Audio-DMAC to IPMMU
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Hook up the RZ/G2E Audio-DMAC device to IPMMU-MP as stated by the
> RZ/G2 User's manual.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

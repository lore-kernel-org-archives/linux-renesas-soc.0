Return-Path: <SRS0=kRYB=US=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADF9C31E49
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Jun 2019 12:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70905206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Jun 2019 12:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731653AbfFSMCu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Jun 2019 08:02:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40880 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSMCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:02:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id a21so2977623ljh.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2019 05:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sI3F9RN+utydt3P1LSuFV0W1bFTbyujq74r8k0N53Bo=;
        b=E5GiVCj00wocsLQiTaQwVF8rk//ZFUv9EP6molAHiTgP3rv7GfJoukt3KDpI3r+eTM
         6WrnyDSw/435ofGZHbVBybGJr1xfOaTNGBnn9InSJmMvbDtPWEoVfgLxuVWOcoSWmMOG
         0Zr1AM+tRQpektoSQnzGnksxAKGC/PWyX7PuNKKK/9AA0+opqHaEWT5NP6ZSPIeTikIP
         Yk4zQ/yC57obaUnInQdOth5FpjU0jpQivpuZw7ISwzwsH2Jrurf28pgxhXoF7lAB0FLc
         rF7bRRMye49gn2qjcW/61Iva+Uxm/Bsi1dem6qwz7nQNyp2Le4L6h7BaGXZy1akT7Vsb
         OTIA==
X-Gm-Message-State: APjAAAWV1VYjfbSrVHZxW6rZ2nzZXXu2iuI4H5c3+rgO/eEowahMYrt+
        dxt/I3+QPQwEzvG8mbQI4DQb+2MBThDyPBL2ynw=
X-Google-Smtp-Source: APXvYqy6u/HLvJliV4B/pGxFYiWCuIRt07JR3Iu4QdJytpDJtdf5/cp1fpwTMmkP8kIP0sh8+nsdN6o+2smqSTput+M=
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr28842793lji.139.1560945768007;
 Wed, 19 Jun 2019 05:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190618124714.15120-1-geert+renesas@glider.be> <20190619115141.wwze45px5qinll2j@verge.net.au>
In-Reply-To: <20190619115141.wwze45px5qinll2j@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jun 2019 14:02:35 +0200
Message-ID: <CAMuHMdVbGKxfVgkQ=CwqcBWj5u3CSR3j1E0Eso1eZTrdJUfPSQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.2-rc1
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Wed, Jun 19, 2019 at 1:51 PM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jun 18, 2019 at 02:47:14PM +0200, Geert Uytterhoeven wrote:
> > Update the defconfig for Renesas ARM boards:
> >   - Drop CONFIG_GENERIC_PHY=y (selected by PHY_RCAR_GEN3_USB2).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I believe this duplicates the following patch which is present
> in renesas-next.
>
> b995421faef5 ("ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig")

That commit doesn't seem to be part of your public repo.

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?id=b995421faef5

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

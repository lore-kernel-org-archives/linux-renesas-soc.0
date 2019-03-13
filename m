Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50749C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19EC32177E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 12:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfCMMRJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 08:17:09 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:42562 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfCMMRJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 08:17:09 -0400
Received: by mail-vk1-f194.google.com with SMTP id j195so406421vkj.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 05:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SSSkQogmiJmMsvyj281JnSAMjkeMM49df0nCzV9Ekm0=;
        b=W9yjwfkeYRvweCvbskrxqu6MlIIRP2iViOtUyFjwRV71T0OD6ic7V4DCZ3M/88kZ4k
         LP0jEucn0vV/PT8DRB749Kt5NVnixU9al8+Yw8eoEbM/v+dEqZm9S1CY5+qm5EaP071d
         x+AJgSyelsz14yW3KydChK0pFXJDFNWrxHkCYU1YYqPO74UdNTZEGkRyRDj15g3zzKXS
         jPdrhKM3NbYic1Qw5V78MO6e7+gtYW8wF4873UBIqejJ37zwnD17e+R+45MNwYyaL234
         FHVLa3ai6W6o+pf1UOmd3Ap/0lNUC7wM5I2dPgj5tyZJwH/tgi5tlVKi1KQmhmcDGRVc
         /TZQ==
X-Gm-Message-State: APjAAAX2rZXCdTNGdtDV0hZruUoSwvd9p78tCnUbCtpHISbwrRoE//3K
        F7pEo+KyGu5kKZwNEPgVu73VXqtI2x0+xy4JfnI=
X-Google-Smtp-Source: APXvYqxKoqUQz2D6S+fN7O4JS5ysQcXBYQm9siVzU4uRyv3+014VxPHmmBJwe2fnwujmGFQ9QEnIAAsoX1ivDp0sqsI=
X-Received: by 2002:a1f:be81:: with SMTP id o123mr23048098vkf.83.1552479428693;
 Wed, 13 Mar 2019 05:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190313105816.8592-1-horms+renesas@verge.net.au> <20190313105816.8592-2-horms+renesas@verge.net.au>
In-Reply-To: <20190313105816.8592-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Mar 2019 13:16:57 +0100
Message-ID: <CAMuHMdX_COrsrEJ8_dDuLK6yjhLjK7q2o0cz9c7zZsFXmhVa3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 11:59 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds the regulator definition required for operation of
> S2RAM.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

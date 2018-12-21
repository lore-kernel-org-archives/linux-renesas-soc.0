Return-Path: <SRS0=RdBT=O6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05546C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Dec 2018 13:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C718E21916
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Dec 2018 13:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9cRHNeL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390484AbeLUNZo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 21 Dec 2018 08:25:44 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34673 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387870AbeLUNZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Dec 2018 08:25:44 -0500
Received: by mail-lf1-f67.google.com with SMTP id p6so3926993lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Dec 2018 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jDIb4P4KV9Wi/mZB/UZJxkkk7CB/2NA1Isq9LVli35U=;
        b=Z9cRHNeLFqQMojWB0Amn+nzOR+/1zAowIEJWKqbIy3IFDLk3OFEtsH4AByySQiEdHv
         V4iKDbxC3TpdPtJKFmoD1X0Ree/t76NaojhvCp/NEACgaawZziIYFnMmOs75Lsbs3jg5
         Xe7Elpv2Bay3FdfM3mt02el/7M3pvUlLibIsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDIb4P4KV9Wi/mZB/UZJxkkk7CB/2NA1Isq9LVli35U=;
        b=QRw162goG3sCcRFQHzMK/KAJymrvAKQioK+KG3rGA1IsfyqG4MD2er4qzmKXtCTJwG
         rU31AcAYfWGlM4NsHiOzxQVHlqF/zoDxot3HCl5Uv01W/DhLWEeyiJTXvU2xIs3QXEUL
         m8fj6AOTWSg1HDg2dhoow+pX5s+mk/Uo6vVqMpkcDh8ZTuvhpWewXmLOYlemSRI2UbSA
         KQvojyzXwzyN8QSd8LnvW8CH6TDHtO7jQuqudIbZw4YU8pl/SFO87+Sb0BNrVfGPf+8A
         MY7HKis8hbOy3jZh+fGsi3UuXoatQyyn27NNEpSnZzvwPQ9zBPD5dOgVZb0CPDGoc7u0
         AihQ==
X-Gm-Message-State: AA+aEWbcQhW300GupUFXRHu+HDthBtz9eoZQk3o7sbw6soEMrfx9zQiQ
        4cvHinyymOfiAPTEmLK7hqD9We7H/XEKvPXeb9W0URK4YGQ=
X-Google-Smtp-Source: AFSGD/WXsmd2iglVFCpmlVp+jTwNfOvWKdY27l1jG5Gae50P8pjNffy3TbmppxBmWykdR7i/Q60ZEJIxx8v6SPzNkhY=
X-Received: by 2002:a19:789:: with SMTP id 131mr1516505lfh.11.1545398742094;
 Fri, 21 Dec 2018 05:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20181219190850.9437-1-geert+renesas@glider.be>
In-Reply-To: <20181219190850.9437-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Dec 2018 14:25:30 +0100
Message-ID: <CACRpkdb76GDdr1gGnXV0OgxO3mABwGuzr7=sA2ftiJjawRVBag@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Fixes for v4.21
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 19, 2018 at 8:10 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3f3327dbc5596076f94695d8d4cc66da3d5027fb:
>
>   pinctrl: rzn1: Fix of_get_child_count() error check (2018-12-04 10:33:49 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.21-tag3
>
> for you to fetch changes up to f83f97684a737f66c9a10437544c92e3436ca4e0:

Pulled into the pinctrl devel branch!

Thanks!

Yours,
Linus Walleij

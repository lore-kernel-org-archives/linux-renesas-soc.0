Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE40C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A446206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDhWELah"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbeLQO2F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:28:05 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44079 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731782AbeLQO2F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:28:05 -0500
Received: by mail-lj1-f196.google.com with SMTP id k19-v6so11123770lji.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HTtadXM7jJOBUndmYC+NTPqgQePrZAwshiRIROfxBGY=;
        b=dDhWELahccHU6DAPvQ5BoZu7qmneaRxEtPWYMfFmjesGBYuBzzacXw+O00gGxjWSC9
         Gt+1aYDtcbA/3nF/ppZDiD29QpoaPvluGD25TGa1c1kJodXoSJ3QDCcB+gnsVekiDF+X
         /zLWsTwjtFRcRuOZMTziH5/OIQISFBa1X3X8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTtadXM7jJOBUndmYC+NTPqgQePrZAwshiRIROfxBGY=;
        b=FChLJ96jFpOmaNab1ajYy2v3e1o/ZLM+0zdnUIjMt7JRazPD72Wzrr6hANkkDW2+Ly
         di9rsIy0cMBjLLe42WksMt80IsnmfMiT1g/XsWHAxBbH8u0cgU0Y75xoHIDACIGKSfZ3
         dUIKv1uBPS0b6LBabelpolfoGtR2ENjhu4vE8fCovBnjjgV6SfJM7X25YeSgotMjWLD2
         hBGQnAkLx5f0jby1QBQfFDgZ8iSSjJwpns3PoV/D6I8/pfRRVZYgMXBygn/CTVM+VBRK
         N2mP6z5V3/TgMavdJQcozlZfbd2FQIO5fr5NfT/oGyK+fWXHvWK10EU147o5q4wpPkdW
         YOPQ==
X-Gm-Message-State: AA+aEWaD4+R3P9ReEAH+XTyRgqBFg3QUYTP9H4nQYPWxI7Jakhv5//0S
        rDyWuk+lCdl/EUfODezZ7pBNmvw0Rm90IiXKV6iDcQ==
X-Google-Smtp-Source: AFSGD/ULuL9K0eFmu/pijY92wzspxBWlBq8FexW2BMsBbTWCzOxvllqFuRE/3o82sI8tyEzgb6Ixe7iaE0+O41hA0HU=
X-Received: by 2002:a2e:29d7:: with SMTP id p84-v6mr7579377ljp.12.1545056882606;
 Mon, 17 Dec 2018 06:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20181210142135.23960-1-vladimir_zapolskiy@mentor.com>
 <CACRpkdbpfxoSiXYskq7FS_Frb_q=TeZ2KNoiC5EPJDUB0tbegg@mail.gmail.com> <CAMuHMdU45DoMpuR3_yazRhWWTyyQkDpB05RsG_U9+Bc70fx_zg@mail.gmail.com>
In-Reply-To: <CAMuHMdU45DoMpuR3_yazRhWWTyyQkDpB05RsG_U9+Bc70fx_zg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Dec 2018 15:27:51 +0100
Message-ID: <CACRpkdYqvrxp0su8g+PEa-HWM44QyQNUvUGv+XVxAy=CuKh6Fg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: select General Output Register to set output states
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 16, 2018 at 11:04 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> > > Fixes: 119f5e448d32c ("gpio: Renesas R-Car GPIO driver V3")
> > > Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> >
> > Patch applied for devel as "non-urgent fix" as I can't see any
> > immediate regressions.
>
> Unfortunately the driver now writes unconditionally to a register that does
> not exist on R-Car Gen1. Hence please revert the patch.

Ooopsidaisy, I pulled it out!

Yours,
Linus Walleij

Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1343C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AF76217D8
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbeLRKDc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:03:32 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:35330 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbeLRKDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:03:31 -0500
Received: by mail-vk1-f195.google.com with SMTP id b18so3545664vke.2;
        Tue, 18 Dec 2018 02:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RHE45yES2uJ6otWgp3EzicatUXdJ+4/AkFxt3gAt1kw=;
        b=oHTT/0LA2Beu/UVNOsIjv0ri0PJww6KSJu1VRhTxAAKPNOawP7dqoqxZ3oss3KNiC+
         nF6BFFB5JAmDggxReHOCN4QVT07OvQHlfDc/f3xHm1atZlTiKsJg3jjKIX46Ugnb/+CK
         BaHfRSM2no4ILzhS2bwcQX7u0oIeSWyyzFjbOKL+z1mCDq9Lafh/iyhRCcmG8ihHZ8y1
         BUlt5I8cXhIrCUgI4pt+X7eTIBpvsylrQ0nDQ3p+UYb25ii60T1FPTQKd2F8DHpBJMUj
         E+Zki9eJufCNJGeIF6Gavf1LL1rBQoN32ESJdF5QrcZuTQIos3BFllfE4K/J966NjE3t
         XV1A==
X-Gm-Message-State: AA+aEWZsVa99F3BJ2Zrw1PvnrbY3ikvZ7vnVQN5WyiZuydhnWquZDivV
        MtzoiT35Ke19/ICkbSXll5Cqr/RLXzkmJipi85Y=
X-Google-Smtp-Source: AFSGD/UTSP/M3XaqjFVobXD37tpprBM22KqOSHzJr4kQSWjU+fRSmpFrjYdyiBgoF6lk672biXtSKbqie1RQ+JF14j8=
X-Received: by 2002:a1f:2ed7:: with SMTP id u206mr7285087vku.72.1545127409572;
 Tue, 18 Dec 2018 02:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20181207140343.5197-1-geert+renesas@glider.be>
In-Reply-To: <20181207140343.5197-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 11:03:17 +0100
Message-ID: <CAMuHMdXpbA+cMtN4xPzmLf98kb6ejyMbK5+MD6LdSQk2twAxmw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 7, 2018 at 3:03 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018) states
> that the USB30_OVC pin supports pull-up only.  It has a bit assigned in
> the pull-enable register (PUEN5), but not in the pull-up/down control
> register (PUD5).
>
> Add a check for this, to prevent configuring a prohibited setting.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: 83f6941a42a5e773 ("pinctrl: sh-pfc: r8a77990: Add bias pinconf support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v4.22.

Given I have more fixes, I'm queuing this in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

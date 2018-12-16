Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED23C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 19:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C95D621836
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 19:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7SGM0VJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbeLPTcs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 14:32:48 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41777 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730688AbeLPTcr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 14:32:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15-v6so9105842ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Dec 2018 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRFRuUFchj/vB409zTiO4h/kLy97UcR27OpTgY2OdTo=;
        b=c7SGM0VJyS7Pl6k8Nim5+2KN2mOv+m00VXCj4e42W1tJ1c1Lg516QxYHRgu/8nODHN
         C9QcRRCbGj5/FngnezSGoZoPxGdP2lWoFsmvz8STiyYuPW9ykqJOLdSneKjxv8/bo8sA
         JL99wYMxXaRg4oNZNdC2dPnwq7XoOzpm+N7nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRFRuUFchj/vB409zTiO4h/kLy97UcR27OpTgY2OdTo=;
        b=kwPlRBye4nt8i5UvNc+HZkltgIGKnYVKOdZ1p4gX3Rg2ak/PsBSB87JTKW+qhZLPDN
         4rNU/AnFDCm6xMMMTAipg5BCvvs75v85LPqU7JCPMPvk4WKJUiOJH2s0B/Bxob2p1OCJ
         cqBigwsBYrdhNA9AsMdxTeYeeeO9hsJx98YisTcu2wjsS2h0LfBIFjzBf4aeVGfd/Vel
         q5hI1ks0/L+KfqNoKGaIwkHTh27od2ddtVknQFoHVjCocqystO1srR1Hq5DQ7g+24SNn
         bWBph8JIfnWc0VYDqW7K7+4wwebkPur/1YKe2jOQHLy1Ym9CvDKTXeW6Px7uAdw89zzt
         bnwA==
X-Gm-Message-State: AA+aEWYvxG9TBiNeSiyVfVmucldwtg9AaIs32dLTAQVdPARc1L5GEKYi
        1L2ZG0uiQol7L4ZNYnNtpgPWX9TMk0Ra6FFu7u9VrQ==
X-Google-Smtp-Source: AFSGD/VOxhhYgDMz53yqtXey1gSnEpwqOw6nWkkPiN57j5dtgV5gRLiF/yoOnYAVoTUfZIcXLtOc6tI5JkA+9HCc6yg=
X-Received: by 2002:a2e:9e03:: with SMTP id e3-v6mr458340ljk.4.1544988765607;
 Sun, 16 Dec 2018 11:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20181216173858.4125-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181216173858.4125-1-marek.vasut+renesas@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Dec 2018 20:32:33 +0100
Message-ID: <CACRpkdbwSNGSEnBMfgFkuyWKswMjTXrG0mMe2meDoMGE+v9Y0Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add regmap dependency for PCA953x driver
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 16, 2018 at 6:39 PM Marek Vasut <marek.vasut@gmail.com> wrote:

> Select REGMAP_I2C in Kconfig, since the driver now depends on regmap
> and this was missing, thus breaking build on various systems.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied!

Yours,
Linus Walleij

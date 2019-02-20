Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ABFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9F1B2070B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 09:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k07RYVS1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfBTJby (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 04:31:54 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32861 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfBTJby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 04:31:54 -0500
Received: by mail-lf1-f66.google.com with SMTP id q12so17078747lfm.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 01:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9fycZ7J9tBvAeuGxWRe1as4bJBqFt7vlHEW8OtVDjg=;
        b=k07RYVS1lqXEg+zPQcPDF2tURc5k/mSlYGJ6+vrieu4JpTTVXEEBGKkcSrXXGrMbxd
         x0IRZNmYrLlkAYmOnrBBnkWdSg54RhaqjzjgoxTcJ9ULc46NB0tuvmlt+wC7R9lJT5pU
         3HrFgx+w4KGHf1LCyBX8Xh5DjCayaOoBTI+AX+5QmPReyMTZMr1OR0BeRL1di5/3zDk3
         rpNlfgutOLNb/rmkN2BESDqLHPsttnTGjOtfAO3BqdA2aEMxcnc3SZ9aiFCNu0XF6YpM
         uSo7xzJ5oUqR64foreOjrQgvjoVMwy80dciQ+p7dOWXyQNWhgDJa5a1gtJudCzXBwTjG
         QJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9fycZ7J9tBvAeuGxWRe1as4bJBqFt7vlHEW8OtVDjg=;
        b=RG6+WZa1Cqe6w6v6z7WnKtWF+OG6yk6W2GQbee1bXV6BdSjhR39lCe5oZ/tEwD3KWC
         Zd+Y9RuBDoPS8KB12UsMBWLTblQRrWtZuGBRmjC+4pJuVxgu2OBofl42O1ujmV3EuTP1
         ypDv3uwqHdUTMF/S4joqP+oZ/R3yOvDJIZ00IsogxbeMEXP/6A5zdxCkGIJIAp8Usguk
         CAemTaIvzxp/xlUjdkV5OuYa2suoHmKU17U37Z9gIhqZQYtCXnbFyXE3Ed9yEo2zfuWW
         A3VvqrbacMeuqXihR8xIQGXmrsn04ViOsBNJO8HkJZjOxqJb09TQR1MsZOgnnpviyi+F
         grzA==
X-Gm-Message-State: AHQUAuaCezAdk+3CZIjeAIrUUL1UdFinDG2LbrbdPZBFZHUk8esijAFa
        eSlcKUShXI/9kxcsRwMe73fSkG6TpeKuJvmZc+JVbA==
X-Google-Smtp-Source: AHgI3IbYpFfVREXEuRSwOtOmo1cR18Z4LsLh/jBf0utzvOKms47pOtisjCHikuXkYp2XGGnmJ258gUXnI5HMTo+ng0I=
X-Received: by 2002:ac2:4343:: with SMTP id o3mr17900809lfl.129.1550655112071;
 Wed, 20 Feb 2019 01:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20190213131503.26801-1-geert+renesas@glider.be>
In-Reply-To: <20190213131503.26801-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Feb 2019 10:31:40 +0100
Message-ID: <CACRpkdbt5hM++no16nDH=tWXf3C366XXQe+JWXYBxPRvzVGMjw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Add wake-up support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 13, 2019 at 2:15 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Implement the irq_set_wake() method in the (optional) irq_chip of the
> GPIO expander, and propagate wake-up settings to the upstream interrupt
> controller.  This allows GPIOs connected to a PCA953X GPIO expander to
> serve as wake-up sources.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested with a PCA9654 and gpio-keys on an R-Car Ebisu-4D board.
>
> v2:
>   - Just propagate irq_set_irq_wake().  As pca953x_irq_set_wake()
>     doesn't need to do anything else, there's no reason for making it
>     conditional.

Patch applied with Niklas' review tag.

Yours,
Linus Walleij

Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877EEC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A57D206DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgjgfCc+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfDDFTW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 01:19:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41246 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfDDFTW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 01:19:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id k8so865101lja.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 22:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBGOdPN2LVXGkXx2fWXDTd/okGlgSja0i0BaGGFRf3I=;
        b=zgjgfCc+c8PtGpFDpvtTq7Vhsu+fLYEZg3/6fBS8ATtgBPIeoCacg6noNCfeNQCXs+
         P3WAJhPnUpRA0MCrv5DJ1Ciy+mtR09I2m8wT4h8NkgPoJ6vwjD7lnTkSu9zf8OtPwQPX
         fYpaIsCs4MYgtIFbmeZ61u7nMGZtAZ7ahqDXFOl6Y8cgk6qfW6S491Xxl7MH4YyxkJSE
         TyVvAiroon7RfuPBSthzxWTLWSMxkxp4HV8Xn4Yp1IBmaI6CpKS8a3lgxlArdh5p5Wc4
         xk4IZcb9lQ0Bi/iNVKVgZZ3V89RYwxgVjG43iwIqR+VcMd0ZSugM3WYAB26xQ3GroniH
         0OlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBGOdPN2LVXGkXx2fWXDTd/okGlgSja0i0BaGGFRf3I=;
        b=HN52Wat6/nb/9Q9mbfnviPRa2lhZFZwc2qDVCruV+FnWULGNmUOgAU+qzcCLZpeSSy
         ce+v7IG4OJ6Ua+l6O4zrc2bvgYbvzPIA6z9vfTVOxm6WQJf56WaeJMAQkZBz5wL5J/5c
         jocUYtwmJPVVVn2T9uHpXY9dr5gM79+9J2/XbtUDDdAPgPcsVR9Hc8N1jV+og1/t8gJt
         nMCiAnFWIeMCrleXhtZFmYmz/c6Xf39udqc6sas4gVUmAVFlRTsHP7Q1ulMQS2Tnzjic
         qxc4irea0Hzg5iMIZePSxg7+psGNix3bJHA91PRLqPqHwKbIPx6tAw0bZXgBgVAmw3qH
         Ilow==
X-Gm-Message-State: APjAAAUH1Zavh9k+lHnJRwdgwsJzuzzjg29mRv4Ev/uUAeEUPf7fprXH
        +fXC6iCVt7EjWtKY13dCoFehk6/ojdab/zYADDnuiA==
X-Google-Smtp-Source: APXvYqx+MsqJ1o2vOZIOqRu682T3xnmJeICFRugvDWjTyzlN3wfIR4g0g2ZYl4ntMDTjaIsIr6KNRQ4UC/qJh3gfJss=
X-Received: by 2002:a2e:9a46:: with SMTP id k6mr2019114ljj.119.1554355160613;
 Wed, 03 Apr 2019 22:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be> <20190321092145.14896-3-geert+renesas@glider.be>
In-Reply-To: <20190321092145.14896-3-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 12:19:09 +0700
Message-ID: <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca953x: Add support for CAT9554
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 21, 2019 at 4:21 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split DT binding doc and driver update in separate patches.

Patch applied.

Yours,
Linus Walleij

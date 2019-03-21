Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EFFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 09:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B25C8218D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 09:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iyYxPKjQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfCUJEB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 05:04:01 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42017 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbfCUJEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 05:04:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id 103so4758991otd.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YoEjvW5c9R6COuagmqx40lh9DixwgjiMJBlEtzJAuTY=;
        b=iyYxPKjQOfdKB9/9PcWowUGXGfmht9kWAu9e/2/HsN9PpQlFwjGsMVitem7XC5e+Qa
         F0Gm7Egv5hB3i0WKcoGLpvv051a7So8BCwSxViBcrI51NUeR97Qq92B3Agr7U9Dkm2Cv
         rKlMcC8DTNG13BikQxXeXkWVfzi7M1yDYNWjNIh4+3YrXc349yHnxXBDRiLwoG466rJR
         uo87c2ZPiG+bWQndHfAcsPPzif8+snUp9jo44IvednDyOFa+GzBi+/eEHufSRX+2M4s5
         f8VcH10YaK/3sC0ipXr/mD1fSs1uNw4OWF1PcYLaSEVnragQmfE1ELOvPo9cVqYhxfdx
         kYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YoEjvW5c9R6COuagmqx40lh9DixwgjiMJBlEtzJAuTY=;
        b=YaBdO49Qa1LXL+dEwaY/RJXVV08jCvhM4dy5qf8nZrSIV7M2dJcFE3aNmbHfJCgPlY
         dEB1En7OC1RUJoxwWWHmv+uyU6idyNCS1hn/aIKGI9JvC58enUMS18q4utt26yYAlfBT
         Os8QSqA+wFRjxsldEGo7TLbzE1EhyjqTK/y8EOt7oajPU3I6nGNQ8DXxgSW6pPSSb3h6
         9usog72moHt3mjQcwGG3F0f+/8cGYsy+Sscgem2SeIdTGqrAteJ3GGuWA+03UydwAqIB
         x1nGLLxPWE7Gki5UpwKuTgMYgWByOIUpLFOHuIoWULFcMsLjmrtBrBXDskkK0wp1+UYQ
         rNNw==
X-Gm-Message-State: APjAAAXhwl0P3BCAv+sG2qWkPCQyUPBz4x+9tzvUiE+d+yAPUGjo84nr
        1CdwMvVqVA7/7BloutmkA6KgkbZnuA/8rLM7wOWREw==
X-Google-Smtp-Source: APXvYqx6Ip1Hv/QZOaw1GIgknMFkZfHdYLh9LyTG2kRmo1w20IMMkmzWGZ5AKQ40+TQdi951rqDToYhad0lRtZmO9K4=
X-Received: by 2002:a9d:6ad1:: with SMTP id m17mr1667267otq.108.1553159039643;
 Thu, 21 Mar 2019 02:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190320103600.20875-1-geert+renesas@glider.be>
In-Reply-To: <20190320103600.20875-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 21 Mar 2019 10:03:48 +0100
Message-ID: <CAMpxmJUSwR8FSkMAQsSvpRHYRDLiheJb02r7imkA=zOhoQFkJg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for CAT9554
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

=C5=9Br., 20 mar 2019 o 11:36 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  drivers/gpio/gpio-pca953x.c                             | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index fb144e2b65226601..8678df2a5713a9af 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -30,6 +30,7 @@ Required properties:
>         ti,tca6424
>         ti,tca9539
>         ti,tca9554
> +       onnn,cat9554
>         onnn,pca9654
>         exar,xra1202
>   - gpio-controller: if used as gpio expander.
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 7e76830b33682aa3..88c94d155e218535 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1167,6 +1167,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>         { .compatible =3D "ti,tca6416", .data =3D OF_953X(16, PCA_INT), }=
,
>         { .compatible =3D "ti,tca6424", .data =3D OF_953X(24, PCA_INT), }=
,
>
> +       { .compatible =3D "onnn,cat9554", .data =3D OF_953X( 8, PCA_INT),=
 },
>         { .compatible =3D "onnn,pca9654", .data =3D OF_953X( 8, PCA_INT),=
 },
>
>         { .compatible =3D "exar,xra1202", .data =3D OF_953X( 8, 0), },
> --
> 2.17.1
>

Hi Geert,

I'm seeing that historically we always would split the patches adding
the new compatible to the DT bindings and the actual support
implementation into separate commits. Could you do the same here?

Thanks,
Bart

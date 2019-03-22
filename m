Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814FAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 15:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F2BF2183E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 15:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q/+UKf7u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfCVPrE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 11:47:04 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39119 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727840AbfCVPrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 11:47:04 -0400
Received: by mail-oi1-f196.google.com with SMTP id b4so2049536oif.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Mar 2019 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oYDFxGodBAT+KeWMpstuaGtQJvbudSxPq7SilshI/zA=;
        b=q/+UKf7uC2I1VaE9inDz9FVaU9VpJSn1Io8QsYk0YClcCCe2dVn61xzcB5yJhyLhY6
         f/xYb0QvEl71LRhXPKha6XAgpWNvE2tJ8nomNW6cx8Wx8tXJlCW7KhbQjJZiE6P6mqCA
         DKw8E4fLN1gkvC1exOD5gp+J9CcQPxRLmjIZ1QiVAxLmXfMXxumZBZQTI1EvywQrlOK3
         4RbXexZ9ltNyR+5c4xev+sMs2Tz0Gk65dOklw+JX+3B3dcN7ZUwqydH559wiU+i9n7f5
         gjLL4HkgPy+RqExOJ4Y09iqJe2i8XdC9/4YdrlKwiv5j2dfCN8hnC3JUWqmA+vHTXMMi
         7YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oYDFxGodBAT+KeWMpstuaGtQJvbudSxPq7SilshI/zA=;
        b=TQKP8ai7gUEqwI+pKNqplCYVQh9JEnj4h8rrWNdoESb66QO4F4J4UvOLQT4EEUePmp
         ZrVLwfQM30IMhVcmfTby0HeIaV/xnqZPAmNkSK91edMlid3+sHmBSRogwhRTI4Qg75WB
         2zAyPZMWi0z49HaJXywxmUgzEakPux5jKhAS8D0nVwvlKlMwdlS0hSRKtgjJ+JRlg2kn
         yXdImEMFkXnY4s4iuYajxJAG+4mWxlFJWpYPBTDI+fP9NPV0RFxVm4+J1YYQggZR9Ej1
         LQuC8banVm08tIEfUzZ6CMJnMsLK816j0Ozm9CQV79hoHUO5UJMCLz0ryEwqrYl3NQfY
         AqFQ==
X-Gm-Message-State: APjAAAUA8rppimhxYYvbvv2NL5nd1ozu7TwbUW2QttEO6y70fq+xhOpq
        B541k6ewh2K94GXi1LF5QFRRsXR4GPCwxloN3L2VtA==
X-Google-Smtp-Source: APXvYqy7qMEZoEFfFiE1qq4jB0Krvo/wFirbUHlnWwLtlhCcJvz7DJfqI/4S8hsxID72wEgpOhbpWVVXsCDIC2VzuvE=
X-Received: by 2002:aca:4b03:: with SMTP id y3mr2329128oia.21.1553269623525;
 Fri, 22 Mar 2019 08:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be> <20190321092145.14896-2-geert+renesas@glider.be>
In-Reply-To: <20190321092145.14896-2-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Mar 2019 16:46:52 +0100
Message-ID: <CAMpxmJU4ni8=P+BTH7YyX+p2xAc1+h3MA5wBqBpDHMCoSK8X7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Document onnn,cat9554
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

czw., 21 mar 2019 o 10:21 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split DT binding doc and driver update in separate patches.
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
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
> --
> 2.17.1
>

Both applied to for-next.

Thanks,
Bart

Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404F7C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 093D920663
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvEEgSxD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfDDFNg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 01:13:36 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45278 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfDDFNg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 01:13:36 -0400
Received: by mail-lj1-f193.google.com with SMTP id y6so839149ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 22:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=114mMmi6oRIm17SohPdIpHZBA2UhUSX3l3ksXmWxFUA=;
        b=dvEEgSxDFN/xgM7eBCS46yunDaRqZg7glZsDX0ZLSnUo9UpZ4X/83sCKFCqCKw1htj
         CCUoV7N8QYXnyRZgg/T3g28WcHBMxYbaUdmA29UfmCiR1p8e9/Bpd3N6+jUaZhoVRhOd
         EWz7PASMATMh1AssjI3xy99+GcrmBQoiENt04eZKaIkuyUdlrS9Aejw2GSuOwce6H1CC
         r5i/6hjp+0LUfjU6J6C234cjYtutIrJyhp0PFEEScipnLc0XAT0uO7xbfV6LWFvzPGxG
         rHukg0r+HMSWwbbs5j89ppJRTNyEmZjwTkyzCln6EszKoZHKS3skwfXCUUF8OrYNSKBq
         +2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=114mMmi6oRIm17SohPdIpHZBA2UhUSX3l3ksXmWxFUA=;
        b=IqKDbNfeqo5TIEqdKTq/IkzsVvi1MP+UtcquEkngyNdkb0hI6Atlv/EX1xBCKB6XGW
         0Q4F4ihgo+84xW0f++rmWa5uTDMW/MAstyXh8Z2d5wXAjvW9//a5d5L3YBAj2KELwy9s
         KifVA8O7ykXp0Kj5JHRgUot/o5PBGl/SgBq/o1ZkodcjGL/jzlU55GPEcWRQC7bBAuZ5
         km7ORSE/FBCvEiRhraQzPCK8yRY4mTYl5jNlpyPl4iBUXqmT5E/WZ4umTcQP5ZpqP9Iq
         9inY96Vu0mBNtq24DqGvb7cp6f4e8VgWp0ZpcXaGqU1+E9l/QkGVz0i+G7OgzILWrZDq
         onAw==
X-Gm-Message-State: APjAAAW5r1IAYYTsVkRehNd4RvGvaWoVUruNRbuQgXKw8/gf6S5KX1Zi
        VUgVfDb6q+kpx4Ly7kfxzuRqpb/bOOPQ19buUMwejQ==
X-Google-Smtp-Source: APXvYqwoLgdl6oPM+zYkCeAEvjSKJANijJk8PAGhSD/Hp31aLChfcUmQvKWovYi+tJW8s4hCn9tp6/O6JUGuQRr6LW8=
X-Received: by 2002:a2e:5d94:: with SMTP id v20mr2021805lje.138.1554354814433;
 Wed, 03 Apr 2019 22:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190316202552.21525-1-marek.vasut@gmail.com>
In-Reply-To: <20190316202552.21525-1-marek.vasut@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 12:13:22 +0700
Message-ID: <CACRpkdZNfNOhR=H5=ECVfsc-mDhk1RkovV56p3bUp2-KY0oWWQ@mail.gmail.com>
Subject: Re: [PATCH V3] regulator: gpio: Reword the binding document
To:     Mark Vasut <marek.vasut@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 17, 2019 at 3:25 AM <marek.vasut@gmail.com> wrote:

> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Reword the binding document to make it clear how the propeties work
> and which properties affect which other properties.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Harald Geyer <harald@ccbib.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Make "gpios" a mandatory property
>     - Reword "gpio-states" property description
>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
> V3: - Use gpio-states description from Harald
> Note: The recent gpio-regulator rework caused breakage. While the
>       changes in the gpio-regulator code were according to the DT
>       binding document, they stopped working with older DTs. Make
>       the binding document clearer to prevent such breakage in the
>       future.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!

Yours,
Linus Walleij

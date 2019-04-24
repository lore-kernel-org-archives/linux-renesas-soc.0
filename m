Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B635C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D5D52148D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729895AbfDXHtW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 03:49:22 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33490 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfDXHtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 03:49:22 -0400
Received: by mail-vs1-f68.google.com with SMTP id s11so9872907vsn.0;
        Wed, 24 Apr 2019 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xrmw3PKrxYqUh9LWsooVFrARldz5XWXjs3js80DJC+s=;
        b=JK3lKaa7TvZEizg4lItA/MATN9E+JGIU0IziC20YY0DCeZDlMc91YCZ2JFHf2aVehe
         fHRJmU47T2QB3CGsrAE4ea9Jdf+yKjxoNWaJYujtQbb7egE08JSurReobrFvsgfiUCKW
         ODONx8qfhY7UwPcZW358W5eqP2HC56/W2XDolEAQK9LzhjoGradCCvGGJrwgvA1Qh7Pt
         lSLRT0V6t02ewDDBgsTg7UEQmpvIAyBDbcP8j8yHWqzJg14pLWO5LjE6Fu7pYAkeCCzN
         OIk2A1sSKfncVdDaiZ8A7ZFnOlLt3lvxYJplwoLRXlYs8oEturXgmMH35IINJqo6qtxR
         JKHg==
X-Gm-Message-State: APjAAAXsB/VhFjOnAjrzMJdVcHSXhr5Pb+ohVvlRw+cs9scPmC3tZe8X
        t5sfX7Pq5iQoDuODpdKGSl3GhyufLJevWu8xLbI=
X-Google-Smtp-Source: APXvYqyv6OjQXwWHzit16VsjZeLN304U0BN75cGAdj3Bp1tL96G3aCO3IRqrVcsYMay8+ckMbfcUfYh21Hgon/xlbj4=
X-Received: by 2002:a05:6102:199:: with SMTP id r25mr15783762vsq.166.1556092161420;
 Wed, 24 Apr 2019 00:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Apr 2019 09:49:09 +0200
Message-ID: <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add TPU support for R-Car H3/M3-W/M3-N
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cao,

On Tue, Apr 16, 2019 at 3:56 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
>
> For test: After booting, I found the device was registered in the boot log.

Thanks for your series!

> Cao Van Dong (4):
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
>
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>  drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>  7 files changed, 39 insertions(+)

Please split off the clock driver changes into separate patches, as DTS and
clock driver changes go in through different subsystem/maintainer paths.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

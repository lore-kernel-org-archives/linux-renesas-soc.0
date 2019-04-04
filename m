Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5032C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB270206DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 05:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rb2eam4j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfDDFUI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 01:20:08 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46979 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfDDFUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 01:20:08 -0400
Received: by mail-lf1-f66.google.com with SMTP id r25so753642lfn.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Apr 2019 22:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yoqfvFTWTAFDDbj03ZN9hGGuAp6DvtFr6/ovnCtHXsk=;
        b=rb2eam4jEpdPqYJ+FxvdcYgy4B0jsNriqcn5ZO2AHKUXF4R/43esUjVWiaPmMIQrMs
         BUaz9qEyrGiK3Ejt7hmvF0CCefZ0BN0bdMHrpaV82WroY4l23H9Dd5WoKPQ/NMMIqBYI
         r07OBw9abWNvp7Z/hWDdqWbWE3muSDBrk+xmCDRujDELP+qT4428GLRenAhLmcpnE+9/
         s2CpWzW8ghTv+n9KaHfCfQiHIfirLczByrhdedAvJgwWZQRcNoDSaTCju5R3hvZn67A3
         BEQ0yhD9OOvRhZrNUGeVh4+k94+BeETzvug0hw5Vl/019Ayj9OchjvfYXjoVYeIIsGe/
         IQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yoqfvFTWTAFDDbj03ZN9hGGuAp6DvtFr6/ovnCtHXsk=;
        b=N/rda6+7zMNIEGb0sRDPcezkZuytBFoENPjEF/dGNSsUoAbfmivHprWoTEPKcNAGuc
         Qg2PRFTDjNnrdzQYrarDC6eyPu7jeL+Ja7Alr7v2wk3ewWTyQEJkygbYzY5gte3/eCO+
         fo7OSE9LlMrzR9zOJDYO1HfWPPQr1+4zgImte9etxAG0ilMi98TgbBMsK7CvJBeUVB2I
         N3Ogf2Z8hfeVnKdtLPSuVronLJBiJN1mbnOyljqHl+tIjKLiMs+5t0d6V1tJU7Za5t6k
         pXKEOPCfihdF4pRbS/SBUizEh83ofHq5u41JpuLBzehERPfLqWIUq9hkjsg8sfABCTr2
         aCBg==
X-Gm-Message-State: APjAAAWvx6Xp+7M7FvfSkR+LTw2lVnWhPoyWcjTPYAEVdpIXf1cP0It0
        cLFWGitkm31V2m6fiNRHTYD6cjMf2LLL5/B9EiadLQ==
X-Google-Smtp-Source: APXvYqwuzVCKDSzcs1tKbd2mecUDd3njyKw/j+P+5+mZNl0/mZLFXev1X4CWpAsP97ToITVZCQCKE+au8A4/EvbCR84=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr1920981lfh.103.1554355206633;
 Wed, 03 Apr 2019 22:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be>
 <20190321092145.14896-3-geert+renesas@glider.be> <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
In-Reply-To: <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 12:19:55 +0700
Message-ID: <CACRpkdbYD7UAY+sMOOi0kvKmkRzYUHHudBLy19aLsJsgsXpEBA@mail.gmail.com>
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

On Thu, Apr 4, 2019 at 12:19 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Mar 21, 2019 at 4:21 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> > with 8 GPIOs and interrupt functionality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Split DT binding doc and driver update in separate patches.
>
> Patch applied.

Ooops sorry I see Bartosz applied it, backed this out.

Yours,
Linus Walleij

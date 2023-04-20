Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D57C77B72
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Apr 2023 15:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjDTPZI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Apr 2023 11:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjDTPZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 11:25:06 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB3D359B;
        Thu, 20 Apr 2023 08:25:05 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so6145001fa.0;
        Thu, 20 Apr 2023 08:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682004302; x=1684596302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9sa/2v4H2Njw0l2CceynxJxnblXmavqJ5TrXC53BDY=;
        b=JoM399xm8Zjj/iOn5a/aa7eKJtGh4b3fC7taw6eZHQtZY22CDfvFUUlced+OoD+cdd
         /oUzSUo8QkgHVUaBOCvl3g9OPo93gh/5Eto9tKudL+ZnemXxKv/Z08sapec7Ezq56fGa
         w4vUclkX10bWaYrM4pfaLmO/3YYtJufrMnRiW3IVDVhok3n5eyzCeKFUOq0KHK+KsJVc
         MOuKICdZ/yiSRDiOHRjze3FWGt39lKq+DxPVbkfd+lA+WT5SSXDvnb+p6GdLA/6Ha6oX
         Vy5EGALVy0VCGng+CpXG380WFUuEbVGZlOdgIcsY7IF5E/cTiWRpi17YVVOdRQrwdXuZ
         uqTQ==
X-Gm-Message-State: AAQBX9cOHkF0s35J2BZP3Bk3c8Ua9Bqr6SudsOgVyI+P0HKp7A/3MncH
        I/CK2TmDiod6BNB6+vGmfOlzpVOYZJ32p9iK
X-Google-Smtp-Source: AKy350aT1e2nWXDuk/OL1if1BHKcmTmm8JyNtMVZgMzBjEtzRawOhdTCfzQIDCRfO/O9toLUSpR4Cw==
X-Received: by 2002:ac2:59dc:0:b0:4ed:b329:5d85 with SMTP id x28-20020ac259dc000000b004edb3295d85mr586526lfn.15.1682004302462;
        Thu, 20 Apr 2023 08:25:02 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id y20-20020ac24474000000b004e95f1c9e7dsm248202lfl.78.2023.04.20.08.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:25:01 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id r9so3196200ljp.9;
        Thu, 20 Apr 2023 08:24:59 -0700 (PDT)
X-Received: by 2002:a2e:b708:0:b0:2a1:d819:f0ae with SMTP id
 j8-20020a2eb708000000b002a1d819f0aemr510014ljo.9.1682004299449; Thu, 20 Apr
 2023 08:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 17:24:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuF6cHMNOo6j6sp0aOr+7=UMmRGhMYi_HaaQn6gojvAg@mail.gmail.com>
Message-ID: <CAMuHMdVuF6cHMNOo6j6sp0aOr+7=UMmRGhMYi_HaaQn6gojvAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Add MTU3a node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 17, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add MTU3a node to R9A07G044 (RZ/G2L) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

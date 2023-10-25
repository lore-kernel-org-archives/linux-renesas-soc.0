Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D0AC0032E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 25 Oct 2023 20:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjJYUKz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 25 Oct 2023 16:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjJYUKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2023 16:10:52 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99367181;
        Wed, 25 Oct 2023 13:10:46 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso66069fac.2;
        Wed, 25 Oct 2023 13:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698264646; x=1698869446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cB5t/FGxP8oaOCcJ0NhN01egXZyXl6xmINLoswYWk44=;
        b=inP+gCPWaW9tQgTZZP5v1oDOdaPc91PGGcxYPEnVSKa5BIMNimJY7jZz8DWzmRAh8K
         t736asmkRUdDkHYj/a/YscIfGVP8V29DTIAU+JrtaeYHxlCAV13BUrVI0bGA4VG7iP7l
         TTrFSaoa5BmYy2vvkhtU4VwUOOmHiqdH+jXovv6lMKec6QycgbSts189bnj0a0rf4Qil
         YgEws7brhB6rGrf/yjAoGdg+vJHwjG259FZKNQ9nhI9sqI1tSicp13p6CGJUysPPG3fw
         hvYeGcEccgwyMWg6Yd4ONygKJH9lf0cgPZodyCKjMYEw2OTHiTLad+njYQ0vxbMgleTl
         qkIA==
X-Gm-Message-State: AOJu0YxXLEVDvPLh+KJltpD0cvBDFqg/K2cgO7bhXq/D63zP1AlTAIXD
        7ei2LJohnOods03eQejfcM4HhheYFRVUtQ==
X-Google-Smtp-Source: AGHT+IHA/67BZbV+Hu9m6098Yd6XKV4OiRjPVILZuXW7e4Ujf1OmCNzdoQmVNR1mdv2JgWX9CeWUqQ==
X-Received: by 2002:a05:6871:3142:b0:1e9:f1cc:a415 with SMTP id lu2-20020a056871314200b001e9f1cca415mr22218468oac.57.1698264645715;
        Wed, 25 Oct 2023 13:10:45 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id z2-20020a056870514200b001db36673d92sm2743821oak.41.2023.10.25.13.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 13:10:45 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e19cb7829bso71738fac.1;
        Wed, 25 Oct 2023 13:10:45 -0700 (PDT)
X-Received: by 2002:a05:6871:a693:b0:1e9:9f9b:eb80 with SMTP id
 wh19-20020a056871a69300b001e99f9beb80mr17510340oab.46.1698264644717; Wed, 25
 Oct 2023 13:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <9467a1c67d5d240211f88336973fa968d39cc860.1690446928.git.geert+renesas@glider.be>
 <20231025200307.GA1068690-robh@kernel.org>
In-Reply-To: <20231025200307.GA1068690-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Oct 2023 22:10:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXE4LyNbcbw-m3n0xWcABnJZAhnNcrq4V1YrkfwE85hdg@mail.gmail.com>
Message-ID: <CAMuHMdXE4LyNbcbw-m3n0xWcABnJZAhnNcrq4V1YrkfwE85hdg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
To:     Rob Herring <robh@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Oct 25, 2023 at 10:03 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Jul 27, 2023 at 10:36:23AM +0200, Geert Uytterhoeven wrote:
> > Document support for the Interrupt Controller for External Devices
> > (INT-EX) in the Renesas R-Car S4-8 (R8A779F0) SoC.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > v2:
> >   - Add Reviewed-by,
> >   - Widen audience after testing.
> > ---
> >  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied, thanks.

In the meantime, this became commit 977f7c2b27566777 ("dt-bindings:
interrupt-controller: renesas,irqc: Add r8a779f0 support") in v6.6-rc6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

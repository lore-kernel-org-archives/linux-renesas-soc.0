Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CEAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0A262085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 10:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730588AbfCYK4D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 06:56:03 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37937 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfCYK4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 06:56:03 -0400
Received: by mail-ua1-f68.google.com with SMTP id d4so2810811uap.5;
        Mon, 25 Mar 2019 03:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x2NesIaeklCZygSZLD5N5TkRPlJpj6oE7QXrNRYchKU=;
        b=tLhqWgrOniilFQ/0ENbL0nBN8vKpLg1wEeYI/v1B+FIm+UscnXxTAGB/K37+w21Irv
         lpcxKBgRzIUTsG+SUAclCjzIrMQPTyzdABb0467LahrkCaXbqqzWCfWdPfZQBnRajrKG
         QKjOCaFfMMSzHQz1FMmLasOo99h4xa/NJhSaUaqYJFRJ24Sba/3etHIVCG6wWfPfM1VS
         JCSc0T3m1i65XMQn7I6hun/GPtLMfAO34kLq3+fMFV8d0Hk6mBMn8zT1x/OfJ6dusj87
         j70dlZ022uMikKGBrl8TEoTCd521zXt/rdD0XA6hhCuebIMzqdnzaQ2kW4EyNIB0dvps
         ffxw==
X-Gm-Message-State: APjAAAVDdp9SfIOVA0CacrCe5bqvkhj3V9rLyTw3fU3DnzH43o2G+eUe
        cKeo+Vi8KBrvrC8+tWyIBkZloAQAjbKO594u7k8=
X-Google-Smtp-Source: APXvYqy3G/NIWeoBjrMYLxNjP1XV2E5+aO8XRZ1Ari1ehTPmOL2oCnKZoUyY87MisKau4ixxPVZFQX9hbxUBgUYnM2I=
X-Received: by 2002:ab0:28d6:: with SMTP id g22mr13327102uaq.75.1553511362129;
 Mon, 25 Mar 2019 03:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-2-geert+renesas@glider.be> <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
In-Reply-To: <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Mar 2019 11:55:50 +0100
Message-ID: <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Mar 22, 2019 at 11:23 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 20, 2019 at 08:44:09PM +0100, Geert Uytterhoeven wrote:
> > Enable the I2C bus, and add the following devices:
> >   - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
> >     default),
> >   - R1EX24016ASAS0A EEPROM.
> >
> > The bus also contains a MAX9856 Audio Codec, which is not yet supported.
> >
> > All devices (incl. the audio codec) are documented to support an I2C bus
> > running at 400 kHz.
> >
> > Pinctrl is based on the RZ/A BSP.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Pending acceptance of the DT binding patches documenting the
> > "onnn,cat9554" and "renesas,r1ex24016" compatible values.
>
> Thanks.
>
> I'm marking this series as deferred pending acceptance of the bindings.
> Please repost or ping me once that has happened.

next-20190325 has:

    d333bad1f6f3e0df dt-bindings: at24: add Renesas R1EX24016
    5c9f8cfe3cb67dcb dt-bindings: gpio: pca953x: Document onnn,cat9554

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

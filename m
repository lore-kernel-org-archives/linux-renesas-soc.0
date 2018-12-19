Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E678C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0723D2084A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbeLSOWg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 09:22:36 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44643 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729412AbeLSOWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 09:22:36 -0500
Received: by mail-ua1-f65.google.com with SMTP id d19so7007830uaq.11;
        Wed, 19 Dec 2018 06:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmTv+X/xk+qMSLXpm2sok5Ra7OGKkLp2jh2pjOkDXuE=;
        b=gr9D3oZpVAkqnPrW7PzY8fsAy1fs0hLW+2etEn9V/HBIZpqTqZ1W1YQhiT4PhZRhWY
         FTPvp3ZPH5Sdv4SxHScJR7j+eisTZ37MfZ4jp4D4Hbe+5L6lnbu0K5ZnBONkCGx50qKR
         d4mdrhwGd/h8KRJv9eWkU4Yoi7ZEpOdsNByPn64e9SY46yc1Q0+p8NcelvRe0g+F0dbf
         +yj3Dw/6F6OGaxy5PelENhvXPI5fHQKQsHwXnTTUMRNs4CnT0DpFbINyLMar1b0wHP9G
         DQiaq/4Ng96TISZtHPspg/IHxPVgGK3GIIJjgCNARff6mvFquh0u/gtXN1wkYSr4J0Sb
         pGCA==
X-Gm-Message-State: AA+aEWZ0xnmGKmBOPYlCrAS91TAEHlpGfF8UwTsaYsOE6gMWIxD55Yex
        ZCiaWhQpYI7qs4guT8PGV77jMmFiYn3PYIJMWLrq7UJeuCk=
X-Google-Smtp-Source: AFSGD/XsXc+LcjBmO4R/ggugBYv0bMMrqhQGAIVJdWUq3n+HzXmS1gLSkbnGvOgBzDu4BN52YNTp06ZTafy3xC6K3gs=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr9401442uad.78.1545229355055;
 Wed, 19 Dec 2018 06:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com> <20181218150551.GA15519@bogus>
 <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
In-Reply-To: <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Dec 2018 15:22:23 +0100
Message-ID: <CAMuHMdV8w+WXUkF-eUu0BkX_bAWL8-12DyJoHZRmD0jUvSZRcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Dec 19, 2018 at 3:07 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 18, 2018 at 9:05 AM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Dec 17, 2018 at 09:43:23AM -0500, Chris Brandt wrote:
> > > Basic support for the RZ/A2 (R7S9210) SoC.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > ---
>
> > > +     gic: interrupt-controller@e8221000 {
> > > +             compatible = "arm,gic-400";
> >
> > Kind of strange that a single core A9 uses an external GIC rather than
> > the built-in one.
>
> Still have this question on v4. It should be "arm,cortex-a9-gic" if
> the A9 built-in GIC is used.

The GIC in RZ/A2 is documented to be a GIC-400.  Apparently the A9 GIC does
not have enough interrupt sources to serve all RZ/A2 peripherals.

Note that several Renesas A9 SoCs use a PL390.

https://lore.kernel.org/lkml/20150429125703.GB11757@leverpostej/
has a patch to print the GIC variant ID at runtime, to be 100% sure.

0x0000043b = arm,pl390
0x0102043b = arm,cortex-a9-gic
0x0200043b = arm,gic-400

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

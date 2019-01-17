Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4F9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDE9620855
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfAQKXh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:23:37 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43689 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbfAQKX3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:23:29 -0500
Received: by mail-vk1-f196.google.com with SMTP id o130so2137054vke.10;
        Thu, 17 Jan 2019 02:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2at2HOgxEy2KhEMyiXRe69mJNqe+/cUFO8dhT9g/kCE=;
        b=c/FRa16mbL2MpsffAjmBS4uZM+CQ084Z6luhbd8l8gb1wi7VtJ4YY8qnxPdq/jWmJt
         5D8aR9d/q4+/OEjwpKy3v+amRoM1TpKA1Ou1kvflbbWRk5c9KDv8ivgx5RusRndJoPdK
         wx4K2fsdB2dS1dY91D9uHRhqxLsYsmZaIW1IIpi/tJ4IRpx0tVQMw2+cLEszhzapg2NH
         n9MrUqTR9pOzVUE9rpw9QZ5shN0+DwO0KJ00jtogiaC2VdnNF6Nrq4AVnY+uloJc5Je3
         XjJG0cfv5Bv20TJ3d7nXPogli9dzPXq/qAV1sY28owskuyAkP8G/NAKUASFWmT/DZpAl
         qqyQ==
X-Gm-Message-State: AJcUukcEmAFzo+dgLW0NZaOP+wAoPr/TASNsY/pKMr5HlIPTCI0sOcxK
        JNI4ZpG436DBJJNmYiCfGotY34aN/6q5PbW+cQs=
X-Google-Smtp-Source: ALg8bN7V+V4uMkRynEFicsUMoqJsdQ3CZ8dOCjo90TENV6YrmYpo6Hntgh2fJkIeH2WAXvW8twpc2gsYRLFNaNbHFM4=
X-Received: by 2002:a1f:2ed7:: with SMTP id u206mr5259687vku.72.1547720608294;
 Thu, 17 Jan 2019 02:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
 <20190116210555.12209-2-wsa+renesas@sang-engineering.com> <CAMuHMdVMQp9YOTc-WDSLkTdeYppHMO0sTBF3fkkxn-VvBUbZUw@mail.gmail.com>
 <20190117101824.7knzifej66j2lo3o@ninjato>
In-Reply-To: <20190117101824.7knzifej66j2lo3o@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:23:16 +0100
Message-ID: <CAMuHMdX32xKbKpSDL4uLrCdunspeWAgFFZRooHUSn77O+D=K5Q@mail.gmail.com>
Subject: Re: [RFC/RFT 1/7] i2c: sh_mobile: simplify sending address for RX
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 17, 2019 at 11:18 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Jan 17, 2019 at 11:11:09AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Jan 17, 2019 at 1:36 AM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > pd->pos won't be smaller than -1, so we can simplify the logic.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > > +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> > > @@ -392,13 +392,9 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
> > >         int real_pos;
> > >
> > >         do {
> > > -               if (pd->pos <= -1) {
> >
> > If this condition is never true, shouldn't the block just be removed instead?
>
> "pd->pos won't be *smaller* than -1"

I stand corrected.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFFDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 08:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83AA8205F4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 08:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfCVIXZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 04:23:25 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40888 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfCVIXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 04:23:24 -0400
Received: by mail-vs1-f67.google.com with SMTP id z18so881795vso.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Mar 2019 01:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Fw69F54klbbclcAxim6Z0jg7pk/8+e+kmOkiMJwwPg=;
        b=HzzYOl94FZyGRvRAywsuvd2QXRmMCPDoLOjPwUah3IgMatKP1zRnSVmz4D+gGeT6w7
         s2SjNFRXGSK+qQkk8BVJjbZcXmIr1vhjBp7oU3UetaUCQScjeYhIMbKMgMFUjs3ChHjq
         a4a55/n0c3cYq2gTpr0ZEmwxQdhHaXNFQuXNOYpCkHig/OEM5ZpsT7qo0aEV4Br0uP/a
         ULYCbos/dWquJWQYIftpCDjyvOxI8Fv8MRJ85ajYyvX7ArQ54G0h61kHh++1UMbs8iyg
         pgV26G6ObivVAHXNPEJvgyyA8MujxsgzS43el+Kr4JljwlzbAuQmf736P8ecJJJ/S01n
         SIFQ==
X-Gm-Message-State: APjAAAWlkjaXG8z0AM4NeGa/TeJJuFhNn/AOUW+XUiJHfnEwerazOJWO
        HZ+V06Qk2Q0bWJSgecmne7dwjzmcHQom8Ird8Vc=
X-Google-Smtp-Source: APXvYqy5pCwa7aIvxDON4fvJ7xFuK5gvHgb7U0JQ0YEg6HuegLxoSJ3zLE83Z2V3wMg+zXKP23T+CEc49dCz2H0xmPc=
X-Received: by 2002:a05:6102:199:: with SMTP id r25mr5062636vsq.166.1553243002416;
 Fri, 22 Mar 2019 01:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
In-Reply-To: <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Mar 2019 09:23:09 +0100
Message-ID: <CAMuHMdUSxx94+-M6OR+2BOO0NgAdP27o1Af7c_xeufv1b1Hp5A@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Thu, Mar 21, 2019 at 11:02 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Mar 20, 2019 at 9:41 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > On Wed, Mar 20, 2019, Geert Uytterhoeven wrote:
> > > This patch series adds support for devices on the I2C bus on the RSKRZA1
> > > board, including the GPIO expander that drives 3 LEDs.
> >
> > Very cool.
> >
> > I figured there was a more graceful way of turning on/off those LEDs
> > than what I was doing...which was just writing to the I2C bus in my LED
> > heartbeat kernel thread.
> > https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/mach-shmobile/board-rskrza1.c#L145
>
> Yeah, I've seen that code. Not fit for upstream ;-)

The proper way is to use that standard heartbeat LED trigger
CONFIG_LEDS_TRIGGER_HEARTBEAT=y, configurable from
sysfs.

For your sample DTS: you can even specify an LED trigger from DT, cfr.
Documentation/devicetree/bindings/leds/common.txt:

    linux,default-trigger = "heartbeat".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

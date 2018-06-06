Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:46748 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751912AbeFFNvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 09:51:20 -0400
Received: by mail-ua0-f196.google.com with SMTP id e8-v6so4040264uam.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jun 2018 06:51:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180606134138.2b7x5odnc6iwrk3o@ninjato>
References: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVXrFvg9JqAp9C8pzcYZVMraeRUehgW5G0YszEjwoHb4Q@mail.gmail.com> <20180606134138.2b7x5odnc6iwrk3o@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 15:51:18 +0200
Message-ID: <CAMuHMdXTs6sYjmKC3Wu1BgO7UuwxzMj-cp=LcjbxbywRR2zKow@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to 400kHz
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Jun 6, 2018 at 3:41 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> >  arch/arm64/boot/dts/renesas/salvator-x.dtsi  | 2 ++
>> >  arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++
>>
>> Any reason this cannot be added to salvator-common.dtsi instead?
>
> It could be. For clarity, I wanted to place this attribute to the
> highest level and not somewhere inbetween.

All other (non-VC5/6) devices on i2c4 currently described in DT are
described in salvator-common.dtsi.
If a board adds a device with a lower frequency limit, it can still override it.

Note that the highest level is r8a779*-salvator-*dts ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

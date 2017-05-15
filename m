Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35229 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934544AbdEOUWk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 16:22:40 -0400
Received: by mail-io0-f194.google.com with SMTP id o12so12685749iod.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2017 13:22:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170515184041.GA23926@verge.net.au>
References: <1494852253-8572-1-git-send-email-geert+renesas@glider.be> <20170515184041.GA23926@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2017 22:22:38 +0200
Message-ID: <CAMuHMdU+FWLhB4sMq3HWkMrGN2aC+inA53-DNoB2pyXAiEJ8CA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: r8a7795: Add support for R-Car H3 ES2.0
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, May 15, 2017 at 8:40 PM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, May 15, 2017 at 02:44:10PM +0200, Geert Uytterhoeven wrote:
>> This patch series adds support for Renesas Salvator-X and H3ULCB
>> development boards equipped with revision ES2.0 of the R-Car H3 SoC.

[...]

>> This has been tested on Salvator-X (H3 ES1.0 and ES2.0), and H3ULCB with
>> H3 ES1.1.
>>
>> This has not been tested on H3ULCB with H3 ES2.0 due to lack of
>> hardware, so perhaps you want to defer patch 3. However, adding ES2.0
>> support to both boards at the same time has its advantages (e.g. to answer
>> the question "in which kernel version do I need a DTB with 'es1' in its
>> name?").
>>
>> Thanks for applying (at least) the first two patches!
>
> Thanks, patches 1 and 2 queued up.

Thank you!

> I'd rather not take 3 until it can be tested somehow.

No problem.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

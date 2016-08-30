Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33044 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751804AbcH3HCx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 03:02:53 -0400
Received: by mail-it0-f67.google.com with SMTP id n75so1278379ith.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2016 00:02:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160830065213.GA12845@verge.net.au>
References: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW7=XB_-7YvMwBw-7WLaEj8A4=znsvRkTbdf5SCYe00rg@mail.gmail.com> <20160830065213.GA12845@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2016 09:02:51 +0200
Message-ID: <CAMuHMdWkLeZp1mjFkTX8NMbrdCS-9RbuB4DxRMuQBqnjCWmocQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: shmobile: remove label property from led
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Aug 30, 2016 at 8:52 AM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Aug 29, 2016 at 09:53:23AM +0200, Geert Uytterhoeven wrote:
>> The patch index in the subject should have been 0/4. You're breaking my
>> script to extract patch series from email threads ;-)

I think you're quoting the wrong part?

> True. Probably we should not apply this series as its just a clean up
> and not worth the risk of breaking user-space.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

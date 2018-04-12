Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:38963 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbeDLLem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 07:34:42 -0400
MIME-Version: 1.0
In-Reply-To: <20180412113134.nzz4ncvl453dkcvr@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com> <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
 <20180412111127.iyvxe2xvemlnpj4v@katana> <CAMuHMdXPe7kipfN1ve2C3EpM-bxCvW9Akiqv7Ri4NqYYOTVW7Q@mail.gmail.com>
 <20180412113134.nzz4ncvl453dkcvr@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Apr 2018 13:34:41 +0200
Message-ID: <CAMuHMdVnYrw+Z_+REEpTOb7_N3UHAgUhjpuwHk+JKew=UMDeZg@mail.gmail.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Apr 12, 2018 at 1:31 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> That should have been caught by the !soc check above, and have already
>> returned with -ENODEV.
>
> Now I get it: You mean non-0 check, not non-NULL check...

soc->data _is_ a pointer. You only cast it to an integer on the next line.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

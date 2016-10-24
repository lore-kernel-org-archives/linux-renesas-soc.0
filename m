Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f174.google.com ([209.85.213.174]:35300 "EHLO
        mail-yb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935173AbcJXJVN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 05:21:13 -0400
Received: by mail-yb0-f174.google.com with SMTP id d128so17459568ybh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2016 02:21:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <125b4831-cbdf-f8e1-da97-8ea9cf458c22@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <580620CD.50703@sang-engineering.com> <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
 <CAMuHMdWuHZ=5ogTE9rG=hjJxVn4dADc_cXuEcO76goq8KDf9kg@mail.gmail.com> <125b4831-cbdf-f8e1-da97-8ea9cf458c22@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2016 11:21:12 +0200
Message-ID: <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 24, 2016 at 11:13 AM, Xuan Truong Nguyen
<nx-truong@jinso.co.jp> wrote:
>> This is with shmobile_defconfig?
>
> yes. we also attach the configs file we used
> (lager-scif-pio-v4.9-rc2.config)
>
>> Does it work better if you enable CONFIG_SERIAL_SH_SCI_DMA?
>
> yes, it's better a little bit. the kernel does not hangs up, but the warning
> message is output.
> please refer lager-scif-dma.log.
>
> we tested on v4.9-rc2. the issue is the same.
>
> if you need any information, please let us know.

> WARNING: CPU: 0 PID: 2249 at drivers/dma/sh/rcar-dmac.c:1257 rcar_dmac_tx_status+0x128/0x4
> No descriptor for cookie!

> [<c03419e8>] (rcar_dmac_tx_status) from [<c0371e04>] (rx_timer_fn+0x48/0x148)

> [<c0371dbc>] (rx_timer_fn) from [<c016dedc>] (call_timer_fn+0x2c/0xa0)

That looks like a race condition between timeout handling and actual completion
of the DMA?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

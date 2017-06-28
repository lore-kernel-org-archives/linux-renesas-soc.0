Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36180 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdF1TIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 15:08:41 -0400
Received: by mail-io0-f195.google.com with SMTP id h134so6071310iof.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2017 12:08:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170628190434.GB17318@verge.net.au>
References: <201706281100.6rIDiZIL%fengguang.wu@intel.com> <20170628190434.GB17318@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jun 2017 21:08:39 +0200
Message-ID: <CAMuHMdU0Wuat9762ayksF7RdQUeeO4Qg0kqik52itgNx-_crwg@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/sdhi-gen3-dma-2017-v2-rebased1 3/4]
 drivers/mmc//host/renesas_sdhi_internal_dmac.c:96:2: error: implicit
 declaration of function 'writeq'
To: Simon Horman <horms@verge.net.au>
Cc: kbuild test robot <fengguang.wu@intel.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 28, 2017 at 9:04 PM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 28, 2017 at 11:37:02AM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/sdhi-gen3-dma-2017-v2-rebased1
>> head:   bcf4bf9f75e02e84971693bce04e5c3775b0f97e
>> commit: 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06 [3/4] mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC
>> config: arm-allmodconfig (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm
>>
>> All errors (new ones prefixed by >>):
>
> This should be resolved in topic/sdhi-gen3-dma-2017-v3

IC. I guess I should use that branch (or a newer one) for next renesas-drivers?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35288 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756001AbdC2Mbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 08:31:35 -0400
MIME-Version: 1.0
In-Reply-To: <20170328224035.8040-4-niklas.soderlund+renesas@ragnatech.se>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se> <20170328224035.8040-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Mar 2017 14:31:33 +0200
Message-ID: <CAMuHMdUOFBURWOCdAbTgWtJdgEabwLeic+KVS7bHhesH_Fe3Zg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: rcar-dmac: wait for ISR to finish before
 freeing resources
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Wed, Mar 29, 2017 at 12:40 AM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This fixes a race condition where the channel resources could be freed
> before the ISR had finished running resulting in a NULL pointer
> reference from the ISR.
>
> [  167.148934] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000
> [  167.157051] pgd =3D ffff80003c641000
> [  167.160449] [00000000] *pgd=3D000000007c507003, *pud=3D000000007c4ff00=
3, *pmd=3D0000000000000000
> [  167.168719] Internal error: Oops: 96000046 [#1] PREEMPT SMP
> [  167.174289] Modules linked in:
> [  167.177348] CPU: 3 PID: 10547 Comm: dma_ioctl Not tainted 4.11.0-rc1-0=
0001-g8d92afddc2f6633a #73
> [  167.186131] Hardware name: Renesas Salvator-X board based on r8a7795 (=
DT)
> [  167.192917] task: ffff80003a411a00 task.stack: ffff80003bcd4000
> [  167.198850] PC is at rcar_dmac_chan_prep_sg+0xe0/0x400
> [  167.203985] LR is at rcar_dmac_chan_prep_sg+0x48/0x400

Do you have a test case to trigger this?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

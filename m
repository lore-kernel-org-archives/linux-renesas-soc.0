Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:46386 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752739AbdKFN1h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2017 08:27:37 -0500
MIME-Version: 1.0
In-Reply-To: <8760ao5hrp.wl%kuninori.morimoto.gx@renesas.com>
References: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
 <20171020061516.GM30097@localhost> <CAMuHMdUqZb-ba9_c+TyE6dFMiWcBPj+39QFOfOtsK8vTw-FSxg@mail.gmail.com>
 <CAMuHMdXc9tpNW-PDScm5OWwciP_tFh19y=b0O+4UKhUUSvwJPA@mail.gmail.com>
 <20171031114113.GR3187@localhost> <878tfqzov2.wl%kuninori.morimoto.gx@renesas.com>
 <8760ao5hrp.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Nov 2017 14:27:36 +0100
Message-ID: <CAMuHMdWWmydtHaVwquW7E1+LaEjS+MMyO_fMaD-QpJtCMWMBWw@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: use TCRB instead of TCR for residue
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Williams <dan.j.williams@intel.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, Nov 6, 2017 at 2:24 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> Large serial console input (copy and pasting long lines) works, as that uses
>> DMA. Small serial console input (typing) doesn't work.
>>
>> Apparently for the serial port, TCR contains the value we need (< 0x20),
>> while TCRB always contains 0x20.
>> Perhaps the code should use the minimum of both registers instead?
>
> TCR(= read) happen 1st, and TCRB (= write) happen next.
> "TCRB always contains 0x20" means, DMA didn't transfer data for some reason ?

In the case of the serial console, the individual characters were actually
transfered, as the console did manage to read them.

With your patch, the serial driver doesn't know about them (residue == 0),
and the console doesn't see them.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

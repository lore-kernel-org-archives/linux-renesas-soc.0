Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33395 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752962AbeGBBYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Jul 2018 21:24:49 -0400
MIME-Version: 1.0
In-Reply-To: <87wouefnsq.wl-kuninori.morimoto.gx@renesas.com>
References: <87wouefnsq.wl-kuninori.morimoto.gx@renesas.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 1 Jul 2018 22:24:47 -0300
Message-ID: <CAOMZO5DvebzRFdUDM1xkR8=-PoYkqM_1svydtXS_zz6pewaY8A@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: clear channel register when error
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vinod <vkoul@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kuninori-san,

On Sun, Jul 1, 2018 at 10:07 PM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We need to clear channel register in error case as recovery.
> The channel is already stopped in such case, thus we don't need to call
> rcar_dmac_chan_halt() before clearing.
>
> rcar_dmac_chan_halt() will clear register and confirm DE bit.
> But it will be failed because channel is already stopped in error case.
> In other words, we shouldn't call it then.
>
> // This patch started to use C++ style comment out
> // because it is recent Linus request

This is valid for the SPDX part only.

For code you should still use the standard /* style.

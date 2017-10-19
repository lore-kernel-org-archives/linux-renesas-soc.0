Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:52725 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751701AbdJSHlF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 03:41:05 -0400
MIME-Version: 1.0
In-Reply-To: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
References: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Oct 2017 09:41:03 +0200
Message-ID: <CAMuHMdWnFwwmCVsCAee9Fk2BrPwULgE1z_OYe+=jUcys9nc3Gw@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: use TCRB instead of TCR for residue
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vinod.koul@intel.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 19, 2017 at 3:15 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>
> SYS/RT/Audio DMAC includes independent data buffers for reading
> and writing. Therefore, the read transfer counter and write transfer
> counter have different values.
> TCR indicates read counter, and TCRB indicates write counter.
> The relationship is like below.
>
>         TCR       TCRB
> [SOURCE] -> [DMAC] -> [SINK]
>
> In the MEM_TO_DEV direction, what really matters is how much data has
> been written to the device. If the DMA is interrupted between read and
> write, then, the data doesn't end up in the destination, so shouldn't
> be counted. TCRB is thus the register we should use in this cases.
>
> In the DEV_TO_MEM direction, the situation is more complex. Both the
> read and write side are important. What matters from a data consumer
> point of view is how much data has been written to memory.
> On the other hand, if the transfer is interrupted between read and
> write, we'll end up losing data. It can also be important to report.
>
> In the MEM_TO_MEM direction, what matters is of course how much data
> has been written to memory from data consumer point of view.
> Here, because read and write have independent data buffers, it will
> take a while for TCR and TCRB to become equal. Thus we should check
> TCRB in this case, too.
>
> Thus, all cases we should check TCRB instead of TCR.
>
> Without this patch, Sound Capture has noise after PluseAudio support
> (= 07b7acb51d2 ("ASoC: rsnd: update pointer more accurate")), because
> the recorder will use wrong residue counter which indicates transferred
> from sound device, but in reality the data was not yet put to memory
> and recorder will record it.
>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> [Kuninori: added detail information in log]
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v2 -> v3
>
>  - Code is back to same as v1
>  - log has more detail explanation
>  - From: is back to Yokoyama-san again

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

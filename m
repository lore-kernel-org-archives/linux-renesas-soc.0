Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:48748 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdJaKqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 06:46:37 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUqZb-ba9_c+TyE6dFMiWcBPj+39QFOfOtsK8vTw-FSxg@mail.gmail.com>
References: <87bml4c5e0.wl%kuninori.morimoto.gx@renesas.com>
 <20171020061516.GM30097@localhost> <CAMuHMdUqZb-ba9_c+TyE6dFMiWcBPj+39QFOfOtsK8vTw-FSxg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2017 11:46:36 +0100
Message-ID: <CAMuHMdXc9tpNW-PDScm5OWwciP_tFh19y=b0O+4UKhUUSvwJPA@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: use TCRB instead of TCR for residue
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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

CC linux-renesas-soc

On Tue, Oct 31, 2017 at 11:45 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Vinod, Morimoto-san, Yokoyama-san,
>
> On Fri, Oct 20, 2017 at 8:15 AM, Vinod Koul <vinod.koul@intel.com> wrote:
>> On Thu, Oct 19, 2017 at 01:15:13AM +0000, Kuninori Morimoto wrote:
>>> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>>>
>>> SYS/RT/Audio DMAC includes independent data buffers for reading
>>> and writing. Therefore, the read transfer counter and write transfer
>>> counter have different values.
>>> TCR indicates read counter, and TCRB indicates write counter.
>>> The relationship is like below.
>>>
>>>         TCR       TCRB
>>> [SOURCE] -> [DMAC] -> [SINK]
>>>
>>> In the MEM_TO_DEV direction, what really matters is how much data has
>>> been written to the device. If the DMA is interrupted between read and
>>> write, then, the data doesn't end up in the destination, so shouldn't
>>> be counted. TCRB is thus the register we should use in this cases.
>>>
>>> In the DEV_TO_MEM direction, the situation is more complex. Both the
>>> read and write side are important. What matters from a data consumer
>>> point of view is how much data has been written to memory.
>>> On the other hand, if the transfer is interrupted between read and
>>> write, we'll end up losing data. It can also be important to report.
>>>
>>> In the MEM_TO_MEM direction, what matters is of course how much data
>>> has been written to memory from data consumer point of view.
>>> Here, because read and write have independent data buffers, it will
>>> take a while for TCR and TCRB to become equal. Thus we should check
>>> TCRB in this case, too.
>>>
>>> Thus, all cases we should check TCRB instead of TCR.
>>>
>>> Without this patch, Sound Capture has noise after PluseAudio support
>>> (= 07b7acb51d2 ("ASoC: rsnd: update pointer more accurate")), because
>>> the recorder will use wrong residue counter which indicates transferred
>>> from sound device, but in reality the data was not yet put to memory
>>> and recorder will record it.
>>
>> Applied, thanks.
>
> This is now commit 847449f23dcbff68 ("dmaengine: rcar-dmac: use TCRB
> instead of TCR for residue") in slave-dma/next, and breaks serial console
> input on koelsch (shmobile_defconfig) and salvator-x (renesas_defconfig).
> Reverting that commit fixes the issue for me.
>
> Large serial console input (copy and pasting long lines) works, as that uses
> DMA. Small serial console input (typing) doesn't work.
>
> Apparently for the serial port, TCR contains the value we need (< 0x20),
> while TCRB always contains 0x20.
> Perhaps the code should use the minimum of both registers instead?
>
> For reference, below is the (gmail-whitespace-damaged) patch I used for
> debugging (note that you cannot print from rcar_dmac_chan_get_residue()!):
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 50c4950050bea876..c2683294d1c735aa 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1237,6 +1237,10 @@ static int rcar_dmac_chan_terminate_all(struct
> dma_chan *chan)
>         return 0;
>  }
>
> +unsigned int different, same;
> +unsigned int diff_cnt;
> +u32 diff_tcr[100], diff_tcrb[100];
> +
>  static unsigned int rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>                                                dma_cookie_t cookie)
>  {
> @@ -1310,7 +1314,21 @@ static unsigned int
> rcar_dmac_chan_get_residue(struct rcar_dmac_chan *chan,
>         }
>
>         /* Add the residue for the current chunk. */
> -       residue += rcar_dmac_chan_read(chan, RCAR_DMATCRB) << desc->xfer_shift;
> +{
> +u32 tcr = rcar_dmac_chan_read(chan, RCAR_DMATCR);
> +u32 tcrb = rcar_dmac_chan_read(chan, RCAR_DMATCRB);
> +if (tcr == tcrb) {
> +       same++;
> +} else {
> +       different++;
> +       if (diff_cnt < ARRAY_SIZE(diff_tcr)) {
> +               diff_tcr[diff_cnt] = tcr;
> +               diff_tcrb[diff_cnt] = tcrb;
> +               diff_cnt++;
> +       }
> +}
> +       residue += tcrb << desc->xfer_shift;
> +}
>
>         return residue;
>  }
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index d5714deaaf928b3d..25df0288c85be9e0 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1389,6 +1389,10 @@ static void work_fn_tx(struct work_struct *work)
>         dma_async_issue_pending(chan);
>  }
>
> +extern unsigned int different, same;
> +extern unsigned int diff_cnt;
> +extern u32 diff_tcr[100], diff_tcrb[100];
> +
>  static void rx_timer_fn(unsigned long arg)
>  {
>         struct sci_port *s = (struct sci_port *)arg;
> @@ -1402,6 +1406,13 @@ static void rx_timer_fn(unsigned long arg)
>         u16 scr;
>
>         dev_dbg(port->dev, "DMA Rx timed out\n");
> +if (diff_cnt) {
> +       unsigned int i;
> +
> +       for (i = 0; i <  diff_cnt; i++)
> +               pr_info("tcr[%u] = 0x%x != tcrb[%u] = 0x%x (same %u,
> different %u)\n", i, diff_tcr[i], i, diff_tcrb[i], same, different);
> +       diff_cnt = 0;
> +}
>
>         spin_lock_irqsave(&port->lock, flags);
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

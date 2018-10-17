Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42268 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbeJQTmy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 15:42:54 -0400
MIME-Version: 1.0
References: <20181016114652.11856-1-geert+renesas@glider.be>
In-Reply-To: <20181016114652.11856-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Oct 2018 13:47:21 +0200
Message-ID: <CAMuHMdW55+qXT5xJXRFB1j2aO1oZ-GEJTMtv+BMwXOaQXJ1e+w@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] serial: sh-sci: Fix fallback to PIO on DMA failure
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: uli+renesas@fpond.eu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 3:24 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When submitting a DMA request fails, the driver is supposed to fall back
> to PIO.  However, this never really worked due to various reasons
> (sh-sci driver issues and dmaengine framework limitations).
>
> There are three places where DMA submission can fail, and the driver
> should fall back to PIO:
>   1. sci_dma_rx_complete(),
>   2. sci_submit_rx(),
>   3. work_fn_tx().
>
> This RFC fixes fallback to PIO in the receive path (cases 1 and 2).
> Fallback to PIO in the transmit path (case 3) already works fine.
>
> Case 1: sci_dma_rx_complete()
>
>   A. PIO cannot take over on SCIF if any DMA transactions are pending,
>      hence they must be terminated first.
>
>   B. The active cookies must be invalidated, else rx_timer_fn() may
>      trigger a NULL pointer dereference.
>
>   C. Restarting the port is not needed, as it is already running, but
>      serial port interrupts must be directed back from the DMA engine to
>      the CPU.
>
> Case 2: sci_submit_rx()
>
>   D. Some callers of sci_submit_rx() hold the port spinlock, others
>      don't.  During fallback to PIO, the driver needs to obtain the port
>      spinlock.  If the lock was already held, spinlock recursion is
>      detected, causing a deadlock: BUG: spinlock recursion on CPU#0.
>
>      Fix this by adding a flag parameter to sci_submit_rx() for the
>      caller to indicate the port spinlock is already held, so spinlock
>      recursion can be avoided.
>
>      Move the spin_lock_irqsave() up, so all DMA disable steps are
>      protected, which is safe as the recently introduced
>      dmaengine_terminate_async() can be called in atomic context.
>
>   E. When falling back to PIO, active_rx must be set to a different
>      value than cookie_rx[i], else sci_dma_rx_find_active() will
>      incorrectly find a match, leading to a NULL pointer dereference in
>      rx_timer_fn() later.
>
>   F. On (H)SCIF, sci_submit_rx() is called in the receive interrupt
>      handler.  Hence if DMA submission fails, the interrupt handler
>      should handle reception using PIO.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against tty/next + "serial: sh-sci: Fix receive on SCIFA/SCIFB variants
> with DMA".
>
> All testing was done on r8a7791/koelsch using SCIF1 on debug serial 1,
> and SCIFA3 on EXIO-B, by introducing random failures in DMA submission
> code.
>
> Thanks for your comments!
>
> v2:
>   - Fix fallback in sci_dma_rx_complete(),
>   - Fallback in the transmit path already works fine,
>   - Widen audience, but keep RFC.
> ---
>  drivers/tty/serial/sh-sci.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 3aad48e64b9b71ff..30b2728c20d6e982 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1272,6 +1272,7 @@ static void sci_dma_rx_complete(void *arg)
>         struct dma_async_tx_descriptor *desc;
>         unsigned long flags;
>         int active, count = 0;
> +       unsigned int i;

Oops, there's a "u16 scr;" missing here.

>
>         dev_dbg(port->dev, "%s(%d) active cookie %d\n", __func__, port->line,
>                 s->active_rx);
> @@ -1309,12 +1310,22 @@ static void sci_dma_rx_complete(void *arg)
>         return;
>
>  fail:
> +       dmaengine_terminate_async(chan);
>         spin_unlock_irqrestore(&port->lock, flags);
>         dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
>         /* Switch to PIO */
>         spin_lock_irqsave(&port->lock, flags);
> +       for (i = 0; i < 2; i++)
> +               s->cookie_rx[i] = -EINVAL;
> +       s->active_rx = 0;
>         s->chan_rx = NULL;
> -       sci_start_rx(port);
> +       /* Direct new serial port interrupts back to CPU */
> +       scr = serial_port_in(port, SCSCR);
> +       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> +               scr &= ~SCSCR_RDRQE;
> +               enable_irq(s->irqs[SCIx_RXI_IRQ]);
> +       }
> +       serial_port_out(port, SCSCR, scr | SCSCR_RIE);
>         spin_unlock_irqrestore(&port->lock, flags);
>  }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

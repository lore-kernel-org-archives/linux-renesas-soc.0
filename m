Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33782 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbeK0DsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 22:48:13 -0500
Received: by mail-lj1-f194.google.com with SMTP id v1-v6so17303548ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Nov 2018 08:53:31 -0800 (PST)
Date: Mon, 26 Nov 2018 17:53:29 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] mmc: tmio: fix reset operation
Message-ID: <20181126165329.GS1158@bigcity.dyn.berto.se>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-3-niklas.soderlund@ragnatech.se>
 <CAK7LNAQ4FwnmLb_O+mNrWa6kF6KEpyDSg3r_zJbc_b8=hyLZ+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ4FwnmLb_O+mNrWa6kF6KEpyDSg3r_zJbc_b8=hyLZ+w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Yamada-san,

Thanks for your feedback.

On 2018-11-02 15:54:17 +0900, Masahiro Yamada wrote:
> On Thu, Nov 1, 2018 at 8:53 AM Niklas S�derlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > SD / MMC did not operate properly when suspend transition failed.
> > Because the SCC was not reset at resume, issue of the command failed.
> > Call the host specific reset function and reset the hardware in order to
> > add reset of SCC. This change also fixes tuning on some stubborn cards
> > on Gen2.
> >
> > Based on work from Masaharu Hayakawa.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > ---
> > * Changes sine v1
> > - Merge tmio_mmc_reset() into tmio_mmc_hw_reset() as it's now the only
> >   caller.
> >
> > * Changes since v2
> > - Rebased on mmc/next caused small refactoring of the code.
> > ---
> >  drivers/mmc/host/tmio_mmc_core.c | 26 +++++++++++++++-----------
> >  1 file changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> > index 953562a12a0d6ebc..662161be03b6d52e 100644
> > --- a/drivers/mmc/host/tmio_mmc_core.c
> > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > @@ -171,6 +171,18 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
> >         }
> >  }
> >
> > +static void tmio_mmc_hw_reset(struct mmc_host *mmc)
> > +{
> > +       struct tmio_mmc_host *host = mmc_priv(mmc);
> > +
> > +       host->reset(host);
> > +
> > +       tmio_mmc_abort_dma(host);
> > +
> > +       if (host->hw_reset)
> > +               host->hw_reset(host);
> > +}
> > +
> >  static void tmio_mmc_reset_work(struct work_struct *work)
> >  {
> >         struct tmio_mmc_host *host = container_of(work, struct tmio_mmc_host,
> > @@ -209,7 +221,7 @@ static void tmio_mmc_reset_work(struct work_struct *work)
> >
> >         spin_unlock_irqrestore(&host->lock, flags);
> >
> > -       host->reset(host);
> > +       tmio_mmc_hw_reset(host->mmc);
> >
> >         /* Ready for new calls */
> >         host->mrq = NULL;
> 
> 
> 
> I see tmio_mmc_abort_dma() a few lines below.
> 
> If you add tmio_mmc_abort_dma() into tmio_mmc_hw_reset(),
> you do not need to abort DMA twice, don't you?
> 
> 
> 
> 
>         tmio_mmc_hw_reset(host->mmc);
> 
>         /* Ready for new calls */
>         host->mrq = NULL;
> 
>         tmio_mmc_abort_dma(host);              /* <-- abort DMA again? */
>         mmc_request_done(host->mmc, mrq);
> }
> 

You are correct with this change the call to tmio_mmc_abort_dma() can be 
dropped here. Will do so and send out a new version. Thanks for pointing 
this out!

> 
> > @@ -696,14 +708,6 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
> >         return 0;
> >  }
> >
> > -static void tmio_mmc_hw_reset(struct mmc_host *mmc)
> > -{
> > -       struct tmio_mmc_host *host = mmc_priv(mmc);
> > -
> > -       if (host->hw_reset)
> > -               host->hw_reset(host);
> > -}
> > -
> >  static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
> >  {
> >         struct tmio_mmc_host *host = mmc_priv(mmc);
> > @@ -1228,7 +1232,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
> >                 _host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
> >
> >         _host->set_clock(_host, 0);
> > -       _host->reset(_host);
> > +       tmio_mmc_hw_reset(mmc);
> 
> 
> I think it is weird to call tmio_mmc_abort_dma()
> before tmio_mmc_request_dma().
> 
> 
> 
> 
> 
> >         _host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
> >         tmio_mmc_disable_mmc_irqs(_host, TMIO_MASK_ALL);
> > @@ -1329,7 +1333,7 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
> >         struct tmio_mmc_host *host = dev_get_drvdata(dev);
> >
> >         tmio_mmc_clk_enable(host);
> > -       host->reset(host);
> > +       tmio_mmc_hw_reset(host->mmc);
> >
> >         if (host->clk_cache)
> >                 host->set_clock(host, host->clk_cache);
> > --
> > 2.19.1
> >
> 
> 
> --
> Best Regards
> Masahiro Yamada

-- 
Regards,
Niklas S�derlund

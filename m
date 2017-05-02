Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:32802 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdEBMBa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 08:01:30 -0400
MIME-Version: 1.0
In-Reply-To: <1493723743-22821-2-git-send-email-horms+renesas@verge.net.au>
References: <1493723743-22821-1-git-send-email-horms+renesas@verge.net.au> <1493723743-22821-2-git-send-email-horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 May 2017 14:01:28 +0200
Message-ID: <CAK8P3a2RDm-ithQizfrZotFWkg9N8mrw-723jt7A=V7f-oKJQw@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/5] mmc: renesas-sdhi, tmio: make dma more modular
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 2, 2017 at 1:15 PM, Simon Horman <horms+renesas@verge.net.au> wrote:

> @@ -202,6 +214,15 @@ void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  irqreturn_t tmio_mmc_irq(int irq, void *devid);
>
> +#if IS_ENABLED(CONFIG_MMC_SDHI)
> +const struct tmio_mmc_dma_ops *tmio_mmc_get_dma_ops(void);
> +#else
> +static inline const struct tmio_mmc_dma_ops *tmio_mmc_get_dma_ops(void)
> +{
> +       return NULL;
> +}
> +#endif
> +
>  static inline char *tmio_mmc_kmap_atomic(struct scatterlist *sg,
>                                          unsigned long *flags)
>  {

Here you return a NULL pointer for the operations structure

> +
> +static inline void tmio_mmc_enable_dma(struct tmio_mmc_host *host, bool enable)
> +{
> +       if (host->dma_ops->enable)
> +               host->dma_ops->enable(host, enable);
> +}
>

And here you check the ->enable callback but not the dma_ops pointer.
In the other callbacks you check the dma_ops pointer but not the callback.
Is that intentional? Maybe always check the dma_ops pointer first for
consistency, as a NULL operations structure (resulting from a future bug)
might lead running user space with kernel privileges.

      Arnd

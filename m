Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24833 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725735AbeHXFXg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 01:23:36 -0400
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoW=wuYZw+VV6TncLgtMbFdvJCfYOzL8xg7x2WimqNN2A@mail.gmail.com>
References: <1534999460-15111-1-git-send-email-yamada.masahiro@socionext.com>
 <1534999460-15111-5-git-send-email-yamada.masahiro@socionext.com> <CAPDyKFoW=wuYZw+VV6TncLgtMbFdvJCfYOzL8xg7x2WimqNN2A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 24 Aug 2018 10:50:26 +0900
Message-ID: <CAK7LNARYEf34cJG8=z4TgbuVAEzn=NMdOTH5tfMryHQX7uJrgg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mmc: uniphier-sd: add UniPhier SD/eMMC controller driver
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2018-08-23 19:43 GMT+09:00 Ulf Hansson <ulf.hansson@linaro.org>:
> [...]
>
>> +static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
>> +                                            struct tmio_mmc_data *pdata)
>> +{
>> +       struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
>> +       struct dma_chan *chan;
>> +
>> +       chan = dma_request_chan(mmc_dev(host->mmc), "rx-tx");
>> +       if (IS_ERR(chan)) {
>> +               dev_warn(mmc_dev(host->mmc),
>> +                        "failed to request DMA channel. falling back to PIO\n");
>> +               return; /* just use PIO even for -EPROBE_DEFER */
>> +       }
>> +
>> +       /* this driver uses a single channel for both RX an TX */
>> +       priv->chan = chan;
>> +       host->chan_rx = chan;
>> +       host->chan_tx = chan;
>> +
>> +       tasklet_init(&host->dma_issue, uniphier_sd_external_dma_issue,
>> +                    (unsigned long)host);
>
> Isn't it time to get rid of tasklets for tmio?
>
> No worries, I don't require that to be changed prior $subject patch,
> however using threaded IRQs is a justified modernization for the tmio
> variants.


Yeah, I also thought this.

But, the irq handler is in the TMIO common code,
so it would affect Renesas code.

tmio-mmc has lots to be improved.
Tasklet is not the only problem.


Before investing more effort,
I want working code base for my platform.


Anyway, thanks for applying this!



> [...]
>
> Kind regards
> Uffe



-- 
Best Regards
Masahiro Yamada

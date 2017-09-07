Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:56425 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754277AbdIGHQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 03:16:20 -0400
Subject: Re: [PATCH 1/8] spi: sh-msiof: Add sleep before master transfer for
 test
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-2-dirk.behme@de.bosch.com>
 <f355b733-68cd-d252-2972-87d3efbedf75@mentor.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <0360714b-ede1-9a23-5c51-ad69393029ee@de.bosch.com>
Date: Thu, 7 Sep 2017 09:16:17 +0200
MIME-Version: 1.0
In-Reply-To: <f355b733-68cd-d252-2972-87d3efbedf75@mentor.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07.09.2017 09:04, Vladimir Zapolskiy wrote:
> Hi Dirk,
> 
> On 09/06/2017 10:05 AM, Dirk Behme wrote:
>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>
>> This patch is for debug of transfer between master and slave.
>> Since the slave needs to complete a preparation in data transfer
>> before the master working, the sleep wait is put before
>> the data transfer of the master.
>>
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>   drivers/spi/Kconfig        | 20 ++++++++++++++++++++
>>   drivers/spi/spi-sh-msiof.c | 15 +++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index a75f2a2cf780..0139ecf8f42e 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -600,6 +600,26 @@ config SPI_SH_MSIOF
>>   	help
>>   	  SPI driver for SuperH and SH Mobile MSIOF blocks.
>>   
>> +config SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG
>> +	bool "Transfer Synchronization Debug support for MSIOF"
>> +	depends on SPI_SH_MSIOF
>> +	default n
> 
> Drop 'default n', it is the default per se.
> 
>> +	help
>> +	  In data transfer, the slave needs to have completed
>> +	  a transfer preparation before the master.
>> +	  As a test environment, it was to be able to put a sleep wait
>> +	  before the data transfer of the master.
>> +
>> +config SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG_MSLEEP
>> +	int "Master of sleep latency (msec time)"
> 
> Master of sleep latency? Probably reformulation is wanted.
> 
>> +	default 1
> 
> In addition please define and add a valid 'range' option.
> 
>> +	depends on SPI_SH_MSIOF && SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG
> 
> Dependence on SPI_SH_MSIOF is inherited.
> 
>> +	help
>> +	  Select Sleep latency of the previous data transfer
>> +	  at the time of master mode.
>> +	  Examples:
>> +	    N => N msec
>> +
>>   config SPI_SH
>>   	tristate "SuperH SPI controller"
>>   	depends on SUPERH || COMPILE_TEST
>> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
>> index 0eb1e9583485..2b4d3a520176 100644
>> --- a/drivers/spi/spi-sh-msiof.c
>> +++ b/drivers/spi/spi-sh-msiof.c
>> @@ -41,6 +41,10 @@ struct sh_msiof_chipdata {
>>   	u16 min_div;
>>   };
>>   
>> +#ifdef CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG
>> +#define TRANSFAR_SYNC_DELAY (CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG_MSLEEP)
> 
> typo, s/TRANSFAR/TRANSFER/
> 
> Parenthesis around CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG_MSLEEP
> are not needed.
> 
>> +#endif /* CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG */
>> +
>>   struct sh_msiof_spi_priv {
>>   	struct spi_master *master;
>>   	void __iomem *mapbase;
>> @@ -910,6 +914,11 @@ static int sh_msiof_transfer_one(struct spi_master *master,
>>   		if (tx_buf)
>>   			copy32(p->tx_dma_page, tx_buf, l / 4);
>>   
>> +#ifdef CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG
>> +		if (p->mode == SPI_MSIOF_MASTER)
>> +			msleep(TRANSFAR_SYNC_DELAY);
>> +#endif /* CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG */
> 
> If SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG is unset, you may set TRANSFAR_SYNC_DELAY
> to 0 and get rid of #ifdefs in the code.
> 
> 	if (p->mode == SPI_MSIOF_MASTER && TRANSFAR_SYNC_DELAY)
> 		msleep(TRANSFAR_SYNC_DELAY);
> 
>> +
>>   		ret = sh_msiof_dma_once(p, tx_buf, rx_buf, l);
>>   		if (ret == -EAGAIN) {
>>   			pr_warn_once("%s %s: DMA not available, falling back to PIO\n",
>> @@ -983,6 +992,12 @@ static int sh_msiof_transfer_one(struct spi_master *master,
>>   	words = len / bytes_per_word;
>>   
>>   	while (words > 0) {
>> +
>> +#ifdef CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG
>> +		if (p->mode == SPI_MSIOF_MASTER)
>> +			msleep(TRANSFAR_SYNC_DELAY);
>> +#endif /* CONFIG_SPI_SH_MSIOF_TRANSFER_SYNC_DEBUG */
>> +
>>   		n = sh_msiof_spi_txrx_once(p, tx_fifo, rx_fifo, tx_buf, rx_buf,
>>   					   words, bits);
>>   		if (n < 0)
>>
> 
> In general I don't think it makes any sense to incluide this change.


Would be fine with me.

Geert: Do you agree to drop this, too?

Best regards

Dirk

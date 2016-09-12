Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34533 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbcILLAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 07:00:03 -0400
Received: by mail-lf0-f48.google.com with SMTP id u14so84220574lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2016 04:00:02 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] mmc: tmio-mmc: add support for 32bit data port
To: Chris Brandt <chris.brandt@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20160911210328.30641-1-chris.brandt@renesas.com>
 <20160911210328.30641-3-chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b49b3a72-5937-fab0-8493-cc27f2655592@cogentembedded.com>
Date: Mon, 12 Sep 2016 13:59:59 +0300
MIME-Version: 1.0
In-Reply-To: <20160911210328.30641-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 9/12/2016 12:03 AM, Chris Brandt wrote:

> For the r7s72100 SOC, the DATA_PORT register was changed to be 32-bits wide.
> Therefore a new flag has been created that will allow 32-bit reads/writes
> to the DATA_PORT register instead of 16-bit (because 16-bits accesses are
> not supported).
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * changed 'data * 0xFF' to 'data & 0xFF'
> * added 'const' for sd_ctrl_write32_rep

[...]

> diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
> index 017a4dc..66a25ec 100644
> --- a/drivers/mmc/host/tmio_mmc_pio.c
> +++ b/drivers/mmc/host/tmio_mmc_pio.c
> @@ -439,10 +439,45 @@ static void tmio_mmc_transfer_data(struct tmio_mmc_host *host,
>  {
>  	int is_read = host->data->flags & MMC_DATA_READ;
>  	u8  *buf8;
> +	u32 data;
>
>  	/*
>  	 * Transfer the data
>  	 */
> +	if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
> +		if (is_read)
> +			sd_ctrl_read32_rep(host, CTL_SD_DATA_PORT, (u32 *)buf,
> +					   count >> 2);
> +		else
> +			sd_ctrl_write32_rep(host, CTL_SD_DATA_PORT, (u32 *)buf,
> +					    count >> 2);
> +
> +		/* if count was multiple of 4 */
> +		if (!(count & 0x3))
> +			return;
> +
> +		buf8 = (u8 *)(buf + (count >> 2));
> +		count %= 4;
> +
> +		if (is_read) {
> +			sd_ctrl_read32_rep(host, CTL_SD_DATA_PORT, &data, 1);
> +			while (count--) {
> +				*buf8 = data & 0xFF;
> +				data = data >> 8;

				data >>= 8;

> +				buf8++;
> +			}
> +		} else {
> +			data = *buf8++;
> +			if (count > 1)
> +				data |= (*buf8++ << 8);

    Parens not needed.

> +			if (count > 2)
> +				data |= (*buf8++ << 16);

    Here as well.
    Dunno how I missed it in the previous review...

    BTW, you could use memcpy() and thus avoid all the loops and shifts, see 
ata_sff_data_xfer32() in drivers/ata/libata-sff.c.

[...]

MBR, Sergei

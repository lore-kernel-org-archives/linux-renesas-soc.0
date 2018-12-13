Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C71DC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 11:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1A9420870
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 11:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E1GClN4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A9420870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbeLMLDc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:03:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48150 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbeLMLDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 06:03:32 -0500
Received: from [IPv6:2a02:c7f:1887:5d00:a043:492c:f55d:2bdb] (unknown [IPv6:2a02:c7f:1887:5d00:a043:492c:f55d:2bdb])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 732E3549;
        Thu, 13 Dec 2018 12:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544699009;
        bh=H4lKYabHwkowQsLq5MmPxjCoKjEjqNJA90zektQujwI=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=E1GClN4m0B1U0rI4ShZZOhTIMiP5ffTDRdHutjhQ1mQ+Z7DDespCSqCvzlAPfBqUx
         DKTq65mv9npDkDXIP1IeCooKb1zxVEe6643HmqC09hCLDMUNv4JE3/AxJ5mWgNd63Q
         6hlxv2WoJ9rcZ9H+ERON+si/dlRacl+sSyEOS4Hg=
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     Marek Vasut <marek.vasut@gmail.com>, linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Reply-To: kieran.bingham@ideasonboard.com
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <2b364543-913a-6c8a-bed7-a7d908c16540@ideasonboard.com>
Date:   Thu, 13 Dec 2018 11:03:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On 12/12/2018 01:39, Marek Vasut wrote:
> The bank_shift = fls(...) code was duplicated in the driver 5 times,
> pull it into separate function.
> 

This looks like a good fix-up to me.

As it's just a single line, it might have warranted being a macro - but
I think the function helps a lot and is readable. The compiler will
likely inline it anyway.


> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> V2: Replace bank_size with bank_shift in commit message
> ---
>  drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 540166443c34..afe6de4c48c4 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -159,11 +159,16 @@ struct pca953x_chip {
>  	int (*read_regs)(struct pca953x_chip *, int, u8 *);
>  };
>  
> +static int pca953x_bank_shift(struct pca953x_chip *chip)
> +{
> +	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +}
> +
>  static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
>  				int off)
>  {
>  	int ret;
> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +	int bank_shift = pca953x_bank_shift(chip);
>  	int offset = off / BANK_SZ;
>  
>  	ret = i2c_smbus_read_byte_data(chip->client,
> @@ -182,7 +187,7 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
>  				int off)
>  {
>  	int ret;
> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +	int bank_shift = pca953x_bank_shift(chip);
>  	int offset = off / BANK_SZ;
>  
>  	ret = i2c_smbus_write_byte_data(chip->client,
> @@ -221,7 +226,7 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>  
>  static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +	int bank_shift = pca953x_bank_shift(chip);
>  	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
>  	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>  
> @@ -265,7 +270,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>  
>  static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +	int bank_shift = pca953x_bank_shift(chip);
>  	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
>  	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>  
> @@ -402,13 +407,12 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>  				      unsigned long *mask, unsigned long *bits)
>  {
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
> +	int bank_shift = pca953x_bank_shift(chip);
>  	unsigned int bank_mask, bank_val;
> -	int bank_shift, bank;
> +	int bank;
>  	u8 reg_val[MAX_BANK];
>  	int ret;
>  
> -	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> -
>  	mutex_lock(&chip->i2c_lock);
>  	memcpy(reg_val, chip->reg_output, NBANK(chip));
>  	for (bank = 0; bank < NBANK(chip); bank++) {
> 


-- 
Regards
--
Kieran

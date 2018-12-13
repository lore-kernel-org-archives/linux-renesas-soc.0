Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B52CC67839
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 13:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D387320849
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 13:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lA9mko8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D387320849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbeLMNTM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 08:19:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36410 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729265AbeLMNTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 08:19:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id u4so1004220wrp.3;
        Thu, 13 Dec 2018 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2EhH7laQ8fPqismTJNyeXT9UPldzl7G3tBWq4Zi0yjI=;
        b=lA9mko8K9zBROgvMBl9aGBUyiLrZ+w90BU/GxA0xKsoCWsYR4NpAh92A25SByQHcfR
         68FVCD+KAN/L0lJFZ0RRxFJMeauIO5YGZzcuY6pHksozms24XA4+4TbHhYb1DKnbd3tz
         vEPBXFPyFr3vZER9Q7aCLsvRUNZmNRpII+hb5KMC/RxYa+QM/AOHY5CswG2BoUzjvvBW
         tl0bjMTX1wJZ1vO/w0baodP2A9qssCWlscxMFYM89/Ud3VSIqh+78PcHgzo/BnG40jiO
         MUZcuwhUuINtrvE3qpTJa+Mkt/R6IqMuuMw2U7qzysjYrTS/g52ceftxPjs8hS+ScmLY
         /K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2EhH7laQ8fPqismTJNyeXT9UPldzl7G3tBWq4Zi0yjI=;
        b=SCdL6MeCPsuvoh4falRHzIe6WCFpmrVGrSPdqMRt2AOuRIOXc5PO+4MqFwuuLuJnl3
         WJGxxpnaM1/nM4HAGLBBlceRhh9unWN+OS6OqznjdqVKLr8G8NZRWr/dDjc4uNW5vH4x
         OcFSXQA8amLXuA6PTufbHoqjpJcsfbmrHIEqcTOsYygSZZTzGFLU0pdYfEoU6E00wjkV
         yx9riK5mG2KpAke4D7HeBCcQRDUWado4xyye+OB7SkfnBd9utf1NJGJLRm8mR8IgeR9b
         tQ4lgQcM/E3wglANdSWYOUBRuKGveR8p4x2VV8lCLgk/+GJOrLwoqdLFW8qa9+Wuw+aL
         GPHA==
X-Gm-Message-State: AA+aEWbJ5p3uN4MTZB6x6Y6xqEG2enjVaWFXjj1K369WhLt1Tz1hgmCk
        J4bQ3skyOCenworddf433NE=
X-Google-Smtp-Source: AFSGD/Xut2atoeODIuy5VAj8cLgCJX8pG+61r3itb0h2MpUxDoGUkRtEFj1Q9XXtiaD+oHzScPwCbA==
X-Received: by 2002:adf:82a4:: with SMTP id 33mr1045375wrc.252.1544707148654;
        Thu, 13 Dec 2018 05:19:08 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a18sm3197878wrp.13.2018.12.13.05.19.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 05:19:07 -0800 (PST)
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     kieran.bingham@ideasonboard.com, linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
 <2b364543-913a-6c8a-bed7-a7d908c16540@ideasonboard.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <446bdb42-cd80-3895-cea2-ce55dacf3d5d@gmail.com>
Date:   Thu, 13 Dec 2018 14:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2b364543-913a-6c8a-bed7-a7d908c16540@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/13/2018 12:03 PM, Kieran Bingham wrote:
> Hi Marek,

Hi,

> On 12/12/2018 01:39, Marek Vasut wrote:
>> The bank_shift = fls(...) code was duplicated in the driver 5 times,
>> pull it into separate function.
>>
> 
> This looks like a good fix-up to me.
> 
> As it's just a single line, it might have warranted being a macro - but
> I think the function helps a lot and is readable. The compiler will
> likely inline it anyway.

The compiler will inline it , and the bonus point is that you get type
checking . There is no type checking with a macro.

>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> 
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>> V2: Replace bank_size with bank_shift in commit message
>> ---
>>  drivers/gpio/gpio-pca953x.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index 540166443c34..afe6de4c48c4 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -159,11 +159,16 @@ struct pca953x_chip {
>>  	int (*read_regs)(struct pca953x_chip *, int, u8 *);
>>  };
>>  
>> +static int pca953x_bank_shift(struct pca953x_chip *chip)
>> +{
>> +	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> +}
>> +
>>  static int pca953x_read_single(struct pca953x_chip *chip, int reg, u32 *val,
>>  				int off)
>>  {
>>  	int ret;
>> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> +	int bank_shift = pca953x_bank_shift(chip);
>>  	int offset = off / BANK_SZ;
>>  
>>  	ret = i2c_smbus_read_byte_data(chip->client,
>> @@ -182,7 +187,7 @@ static int pca953x_write_single(struct pca953x_chip *chip, int reg, u32 val,
>>  				int off)
>>  {
>>  	int ret;
>> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> +	int bank_shift = pca953x_bank_shift(chip);
>>  	int offset = off / BANK_SZ;
>>  
>>  	ret = i2c_smbus_write_byte_data(chip->client,
>> @@ -221,7 +226,7 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>>  
>>  static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>>  {
>> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> +	int bank_shift = pca953x_bank_shift(chip);
>>  	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
>>  	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>>  
>> @@ -265,7 +270,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>>  
>>  static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>>  {
>> -	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> +	int bank_shift = pca953x_bank_shift(chip);
>>  	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
>>  	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>>  
>> @@ -402,13 +407,12 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>>  				      unsigned long *mask, unsigned long *bits)
>>  {
>>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
>> +	int bank_shift = pca953x_bank_shift(chip);
>>  	unsigned int bank_mask, bank_val;
>> -	int bank_shift, bank;
>> +	int bank;
>>  	u8 reg_val[MAX_BANK];
>>  	int ret;
>>  
>> -	bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
>> -
>>  	mutex_lock(&chip->i2c_lock);
>>  	memcpy(reg_val, chip->reg_output, NBANK(chip));
>>  	for (bank = 0; bank < NBANK(chip); bank++) {
>>
> 
> 


-- 
Best regards,
Marek Vasut

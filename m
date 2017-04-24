Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/4] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
To: Lee Jones <lee.jones@linaro.org>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com>
 <20170416180801.17828-2-marek.vasut+renesas@gmail.com>
 <20170424113847.4z7bobboucttk3ir@dell>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d348b031-5e06-2d0f-01ae-0ee310f03873@gmail.com>
Date: Mon, 24 Apr 2017 17:03:39 +0200
MIME-Version: 1.0
In-Reply-To: <20170424113847.4z7bobboucttk3ir@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/24/2017 01:38 PM, Lee Jones wrote:
> On Sun, 16 Apr 2017, Marek Vasut wrote:

[...]

>> +static int bd9571mwv_identify(struct bd9571mwv *bd)
>> +{
>> +	struct device *dev = bd->dev;
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret = regmap_read(bd->regmap, BD9571MWV_VENDOR_CODE, &value);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to read vendor code register\n");
> 
> Nit: Don't you care what the return value is?

Not really, but I added the reporting. I wonder whether it shouldn't be
the regmap which reports those kinds of failures, just like ie. when
k*alloc() fails.

>> +		return ret;
>> +	}
>> +
>> +	if (value != BD9571MWV_VENDOR_CODE_VAL) {
>> +		dev_err(dev, "Invalid vendor code ID %02x (expected %02x)\n",
>> +			value, BD9571MWV_VENDOR_CODE_VAL);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_CODE, &value);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to read product code register\n");
> 
> Same.

And fixed globally ...

-- 
Best regards,
Marek Vasut

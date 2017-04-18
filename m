Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 4/4] regulator: Add ROHM BD9571MWV-M PMIC regulator driver
To: Mark Brown <broonie@kernel.org>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com>
 <20170416180801.17828-4-marek.vasut+renesas@gmail.com>
 <20170418175738.bqsjyltki7zujbjn@sirena.org.uk>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5f76efbb-851a-9c69-0b6e-a5bae2ed2e57@gmail.com>
Date: Tue, 18 Apr 2017 20:39:17 +0200
MIME-Version: 1.0
In-Reply-To: <20170418175738.bqsjyltki7zujbjn@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/18/2017 07:57 PM, Mark Brown wrote:
> On Sun, Apr 16, 2017 at 08:08:01PM +0200, Marek Vasut wrote:
> 
> This looks good, a couple of minor things though:
> 
>> +static int bd9571mwv_regulator_is_enabled(struct regulator_dev *reg)
>> +{
>> +	/* Always enabled. */
>> +	return 1;
>> +}
> 
> This should be the default implementation, no need to open code it.

Fixed.

>> +int bd9571mwv_set_voltage_sel_regmap(struct regulator_dev *rdev,
>> +				     unsigned int sel)
>> +{
>> +	return regmap_write_bits(rdev->regmap, BD9571MWV_DVFS_SETVID,
>> +				 rdev->desc->vsel_mask, sel);
>> +}
> 
> regulator_set_voltage_sel_regmap().

I'm using different register for reading and setting the voltage, so
this doesn't work in this case. Plus these two registers have different
format to make it more fun.

-- 
Best regards,
Marek Vasut

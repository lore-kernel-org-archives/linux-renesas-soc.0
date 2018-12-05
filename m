Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37370 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbeLEOwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:52:35 -0500
Subject: Re: [PATCH 14/14] gpio: pca953x: Restore registers after
 suspend/resume cycle
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
 <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
 <CAMuHMdXQTXAPL_Ri_+Jg_8huxz2TDpDFB83-=inkn3wCEbFPpw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5e860392-7870-ec55-3d5b-42b23aa4fbfa@gmail.com>
Date: Wed, 5 Dec 2018 15:45:42 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQTXAPL_Ri_+Jg_8huxz2TDpDFB83-=inkn3wCEbFPpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/05/2018 03:39 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sun, Dec 2, 2018 at 8:36 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> It is possible that the PCA953x is powered down during suspend.
>> Use regmap cache to assure the registers in the PCA953x are in
>> line with the driver state after resume.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
>> +static int pca953x_suspend(struct device *dev)
>> +{
>> +       struct pca953x_chip *chip = dev_get_drvdata(dev);
>> +
>> +       regcache_mark_dirty(chip->regmap);
>> +       pca953x_regcache_sync(dev);
>> +       regcache_cache_only(chip->regmap, true);
> 
> Based on the discussion about adding suspend/resume support to the VC5
> clock driver, I guess the two sync calls above are not needed here?

Yes

-- 
Best regards,
Marek Vasut

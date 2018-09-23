Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Sun, 23 Sep 2018 22:20:34 +0200
From: Stefan Lengfeld <contact@stefanchrist.eu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 0/4] i2c: core: introduce master_xfer_irqless
Message-ID: <20180923202034.qugs4fxucj7h4vri@porty>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Sep 20, 2018 at 06:14:19PM +0200, Wolfram Sang wrote:
> To keep the discussion about master_xfer_irqless going, I post here a
> draft how I envision the changes to the I2C core. They are only build
> tested. I am unsure if I can test them on hardware before next week, so
> I'll send them around as RFC already, so people can get an idea and
> comment. Maybe Stefan has some bandwidth to test his imx driver
> implementation on top of this?

No problem. I have some spare time in the next days and will post my
results to the mailinglist.

Kind Regards,
Stefan Lengfeld

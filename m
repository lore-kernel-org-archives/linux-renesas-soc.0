Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Mon, 8 Oct 2018 13:06:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Lengfeld <contact@stefanchrist.eu>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, preid@electromag.com.au,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.or,
        j-keerthy@ti.com, t-kristo@ti.com, grygorii.strashko@ti.com
Subject: Re: [RFC PATCH 1/3] i2c: imx: implement master_xfer_irqless callback
Message-ID: <20181008100601.GX15943@smile.fi.intel.com>
References: <20180923202034.qugs4fxucj7h4vri@porty>
 <20181007153937.16787-1-contact@stefanchrist.eu>
 <20181007153937.16787-2-contact@stefanchrist.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181007153937.16787-2-contact@stefanchrist.eu>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 07, 2018 at 05:39:35PM +0200, Stefan Lengfeld wrote:
> Rework the read and write code paths in the driver to support operation
> in IRQ disabled contexts. The patch is currently tested only on a
> phyCORE-i.MX6 Solo board.
> 
> The driver supports normal operation, DMA transfers and now the polling
> mode or also called sleep-free or IRQ-less operation. It makes the code
> not simpler or easier to read, but IRQ less I2C transfers are needed on
> some hardware configurations, e.g. to trigger reboots on an external
> PMIC chip.

> +		if (!polling)
> +			schedule();
> +		else
> +			udelay(100);

What the point to use negative conditional when it's pretty straightforward and
positive may be used?

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:11639 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbeJHRTD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 13:19:03 -0400
Date: Mon, 8 Oct 2018 13:07:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Lengfeld <contact@stefanchrist.eu>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, preid@electromag.com.au,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.or,
        j-keerthy@ti.com, t-kristo@ti.com, grygorii.strashko@ti.com
Subject: Re: [RFC PATCH 2/3] watchdog: da9062: avoid regmap in restart handler
Message-ID: <20181008100744.GY15943@smile.fi.intel.com>
References: <20180923202034.qugs4fxucj7h4vri@porty>
 <20181007153937.16787-1-contact@stefanchrist.eu>
 <20181007153937.16787-3-contact@stefanchrist.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181007153937.16787-3-contact@stefanchrist.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 07, 2018 at 05:39:36PM +0200, Stefan Lengfeld wrote:
> Using i2c_transfer() directly to set the shutdown bit is more reliable
> than using regmap in atomic contexts, because calls to 'schedule()' or
> 'sleep()' must be avoided in call code paths.

>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>

The rule of thumb when extending a header inclusion block is that try to
squeeze the new inclusion in the longest sorted part of the list.

Rationale behind is easy maintenance.

-- 
With Best Regards,
Andy Shevchenko

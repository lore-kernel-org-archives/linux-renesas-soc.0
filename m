Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:61851 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752860AbdLMP1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 10:27:42 -0500
Message-ID: <1513178859.7000.43.camel@linux.intel.com>
Subject: Re: [PATCH 3/6] i2c: add 'set_sda' to bus_recovery_info
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Phil Reid <preid@electromag.com.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Claudio Foellmi <claudio.foellmi@ergon.ch>,
        Andrzej Hajda <a.hajda@samsung.com>
Date: Wed, 13 Dec 2017 17:27:39 +0200
In-Reply-To: <20171204123640.3382-4-wsa+renesas@sang-engineering.com>
References: <20171204123640.3382-1-wsa+renesas@sang-engineering.com>
         <20171204123640.3382-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 2017-12-04 at 13:36 +0100, Wolfram Sang wrote:
> This will be needed when we want to create STOP conditions, too,
> later.
> Create the needed fields and populate them for the GPIO case if the
> GPIO
> is set to output.

> +#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>

I think it should be not done like this. (Yes, I know why you did that)

Perhaps Linus will accept a patch to move direction flags to some header
feasible via consumer.h.

Linus?

Or if we wish to hide:

static inline bool gpiod_is_direction_out() {}
static inline bool gpiod_is_direction_in() {}

> 	if (gpiod_get_direction(bri->sda_gpiod) == GPIOF_DIR_OUT)

P.S. Yep, I saw some other upstreamed patch doing this kind of
comparison.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

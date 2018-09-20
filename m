Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:56778 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbeIUDrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 23:47:43 -0400
Date: Thu, 20 Sep 2018 15:02:03 -0700
From: Tony Lindgren <tony@atomide.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 0/4] i2c: core: introduce master_xfer_irqless
Message-ID: <20180920220203.GA5662@atomide.com>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Wolfram Sang <wsa+renesas@sang-engineering.com> [180920 09:19]:
> To keep the discussion about master_xfer_irqless going, I post here a
> draft how I envision the changes to the I2C core. They are only build
> tested. I am unsure if I can test them on hardware before next week, so
> I'll send them around as RFC already, so people can get an idea and
> comment. Maybe Stefan has some bandwidth to test his imx driver
> implementation on top of this?
> 
> A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/xfer_irqless
> 
> Happy hacking and thanks for all the input to this,

Thanks looks nice to me:

Acked-by: Tony Lindgren <tony@atomide.com>

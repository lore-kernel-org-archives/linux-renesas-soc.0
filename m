Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:50379 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727634AbeJVQev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 12:34:51 -0400
Date: Mon, 22 Oct 2018 11:17:18 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] pinctrl: intel: pinctrl-baytrail: simplify getting
 .driver_data
Message-ID: <20181022081718.GQ2302@lahna.fi.intel.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
 <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
 <20181021211951.GM10650@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021211951.GM10650@smile.fi.intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 12:19:51AM +0300, Andy Shevchenko wrote:
> On Sun, Oct 21, 2018 at 10:00:27PM +0200, Wolfram Sang wrote:
> > We should get 'driver_data' from 'struct device' directly. Going via
> > platform_device is an unneeded step back and forth.
> > 
> 
> Thanks!
> 
> I see only 3 out of 5 patches.
> 
> Since we are about to establish a separate tree as well as an additional record
> in MAINTAINERS data base for Intel pinctrl driver, I ask you to resend only
> Intel related stuff in a separate series.

Well, it is easy enough to apply to our tree even if part of larger
series :) So no need to resend anything IMHO.

Looks good to me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

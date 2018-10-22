Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46152 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbeJVTNo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 15:13:44 -0400
MIME-Version: 1.0
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
 <20181021200032.1833-2-wsa+renesas@sang-engineering.com> <20181021211951.GM10650@smile.fi.intel.com>
 <20181022081718.GQ2302@lahna.fi.intel.com>
In-Reply-To: <20181022081718.GQ2302@lahna.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Oct 2018 13:55:25 +0300
Message-ID: <CAHp75VfTevUTdYwMxg9RSsEp+bNJRna24seg6eTAjNgRPggqtA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: intel: pinctrl-baytrail: simplify getting .driver_data
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 11:51 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Oct 22, 2018 at 12:19:51AM +0300, Andy Shevchenko wrote:
> > On Sun, Oct 21, 2018 at 10:00:27PM +0200, Wolfram Sang wrote:
> > > We should get 'driver_data' from 'struct device' directly. Going via
> > > platform_device is an unneeded step back and forth.

> > Thanks!
> >
> > I see only 3 out of 5 patches.
> >
> > Since we are about to establish a separate tree as well as an additional record
> > in MAINTAINERS data base for Intel pinctrl driver, I ask you to resend only
> > Intel related stuff in a separate series.
>
> Well, it is easy enough to apply to our tree even if part of larger
> series :) So no need to resend anything IMHO.

I think it's slightly harder to sort things out for the more complex
series, anyway, I'm right now talking to Wolfram and he shared how he
did this series. The split is based on records in MAINTAINERS data
base, that's why we have non-Intel parts there. Whenever we push new
record, this automatically fixes the split.

> Looks good to me,
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko

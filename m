Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:34032 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751120AbdCaE4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 00:56:54 -0400
Date: Thu, 30 Mar 2017 21:56:49 -0700
From: Eduardo Valentin <edubezval@gmail.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v3 0/7] thermal: rcar_gen3_thermal: add support for
 interrupt triggerd trip points
Message-ID: <20170331045647.GA2194@localhost.localdomain>
References: <20170329184356.8610-1-niklas.soderlund+renesas@ragnatech.se>
 <20170329205139.GB1440@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170329205139.GB1440@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 10:51:39PM +0200, Wolfram Sang wrote:
> On Wed, Mar 29, 2017 at 08:43:49PM +0200, Niklas S�derlund wrote:
> > Hi,
> > 
> > This series adds support for hardware backed trip point windows. It is
> > based on top of v4.11-rc1 and is tested on R-Car H3 and M3-W.
> > 
> > The series starts out by fixing three issues (1/7, 2/7, 3/7) that should
> > have been fixed by me before the initial driver where submitted to
> > upstream. Sorry for not spotting the issues sooner.
> > 
> > The series then extends the rcar_gen3_thermal driver with hardware
> > interrupts for trip point windows by implementing the .set_trips()
> > callback of struct thermal_zone_of_device_ops (4/7, 5/7). It then adds
> > suspend and resume handlers so that the hardware interrupts are
> > preserved across suspend/resume cycles (6/7, 7/7).
> 
> Thanks, Niklas! From my PoV, this series is good to go upstream!
> 
Agreed here. Good job with the patches Niklas. Given the nature of
changes in the driver, I am allowing some time for them to sit on
linux-next. Queued them on my branch -linus, for next merge window.

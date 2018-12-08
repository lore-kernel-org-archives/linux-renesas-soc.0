Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from void.printf.net ([192.34.86.38]:42143 "EHLO void.printf.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbeLHGBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Dec 2018 01:01:05 -0500
Date: Sat, 8 Dec 2018 05:56:30 +0000
From: Chris Ball <chris@printf.net>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Avri Altman <Avri.Altman@wdc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Michael Heimpold <mhei@heimpold.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH mmc-utils] fix GCC7 build by refactoring trimming
        routines
Message-ID: <20181208055630.GB12686@void.printf.net>
References: <20181203131923.1487-1-wsa+renesas@sang-engineering.com> <SN6PR04MB4925AE1C9D8FB94687CE1E15FCAE0@SN6PR04MB4925.namprd04.prod.outlook.com> <20181203142442.cfxrx3aqj6qacnjp@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203142442.cfxrx3aqj6qacnjp@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi everyone, I'm very sorry for the delay in responding to these patches
and the duplicated effort it caused.

On Mon, Dec 03, 2018 at 03:24:42PM +0100, Wolfram Sang wrote:
> Hi Avri, hi Chris,
> 
> > > I got a compile error with GCC7. When trimming white spaces from strings
> > > lsmmc uses strncpy with overlapping memory areas. This is not allowed.
> > > In addition, the implementation was not efficient with calling strlen
> > > and strncpy once per iteration. Refactor the code to be valid and more
> > > effective.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, I've applied this fix of Wolfram's to mmc-utils master.

> Thanks for the pointer. Chris, how do you feel with maintaining
> mmc-utils? Would you maybe be willing to share maintenance with someone?

Yep, that'd make sense.

-- 
Chris Ball   <http://printf.net/>

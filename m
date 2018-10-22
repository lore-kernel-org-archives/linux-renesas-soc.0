Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:55888 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728629AbeJWBrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 21:47:51 -0400
Date: Mon, 22 Oct 2018 19:28:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: ds1685: simplify getting .driver_data
Message-ID: <20181022172815.GW17341@piout.net>
References: <20181021200042.1993-1-wsa+renesas@sang-engineering.com>
 <20181021200042.1993-2-wsa+renesas@sang-engineering.com>
 <20181022155335.GT17341@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181022155335.GT17341@piout.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22/10/2018 17:53:35+0200, Alexandre Belloni wrote:
> On 21/10/2018 22:00:41+0200, Wolfram Sang wrote:
> > We should get 'driver_data' from 'struct device' directly. Going via
> > platform_device is an unneeded step back and forth.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > 
> > Build tested only. buildbot is happy.
> > 
> >  drivers/rtc/rtc-ds1685.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> Applied, thanks.
> 

By the way, is there any reason why this was not part of your patch back
in April? I had a deja vu feeling ;)


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

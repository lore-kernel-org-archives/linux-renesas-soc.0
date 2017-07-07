Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46461 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751034AbdGGLne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jul 2017 07:43:34 -0400
Date: Fri, 7 Jul 2017 13:43:30 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools-3.1] i2c-tools: add new tool 'i2ctransfer'
Message-ID: <20170707134330.47bd5cbc@endymion>
In-Reply-To: <20170419181257.bgzi2o4ygwdpquvs@ninjato>
References: <20170407124403.1880-1-wsa+renesas@sang-engineering.com>
        <20170419181257.bgzi2o4ygwdpquvs@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 19 Apr 2017 20:12:57 +0200, Wolfram Sang wrote:
> On Fri, Apr 07, 2017 at 02:44:03PM +0200, Wolfram Sang wrote:
> > This tool allows to construct and concat multiple I2C messages into one
> > single transfer. Its aim is to test I2C master controllers, and so there
> > is no SMBus fallback.
> > 
> > I've been missing such a tool a number of times now, so I finally got
> > around to writing it myself. As with all I2C tools, it can be dangerous,
> > but it can also be very useful when developing.
> > 
> > It has been tested with various Renesas I2C IP cores as well as Tegra,
> > i.MX and AT91.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---  
> 
> Pushed to i2c-tools-3.1.

As usual I'm late to the party... I don't think this should have gone
to branch 3.1 which is a bug-fix only branch. If people want the newest
shiny stuff they should use the master branch. And if it bothers them
that there is no released version of it... well they may be right, and
it suggests it's about time to push a first version of i2c-tools 4 out
the door.

-- 
Jean Delvare
SUSE L3 Support

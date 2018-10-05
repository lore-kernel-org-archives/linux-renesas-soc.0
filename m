Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:58376 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728621AbeJEV3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 17:29:04 -0400
Date: Fri, 5 Oct 2018 07:30:02 -0700
From: Tony Lindgren <tony@atomide.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] i2c: omap: use core to detect 'no zero length'
 quirk
Message-ID: <20181005143002.GI5662@atomide.com>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
 <20180723202617.15230-5-wsa+renesas@sang-engineering.com>
 <20181005122409.GH5433@kunai>
 <0a7bf9ae-8c20-ce11-0c01-33a3f0eeb93a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a7bf9ae-8c20-ce11-0c01-33a3f0eeb93a@ti.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Grygorii Strashko <grygorii.strashko@ti.com> [181005 14:16]:
> 
> 
> On 10/05/2018 07:24 AM, Wolfram Sang wrote:
> > On Mon, Jul 23, 2018 at 10:26:08PM +0200, Wolfram Sang wrote:
> > > And don't reimplement in the driver.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > Ping.
> > 
> 
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Acked-by: Tony Lindgren <tony@atomide.com>

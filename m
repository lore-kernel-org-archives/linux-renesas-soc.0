Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43615 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754183AbcKJKL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 05:11:26 -0500
Date: Thu, 10 Nov 2016 11:11:19 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 01/14] ARM: dts: lager: rename and reindex i2cexio
Message-ID: <20161110101119.GB9855@verge.net.au>
References: <20161106202032.5227-1-wsa+renesas@sang-engineering.com>
 <20161106202032.5227-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVqy1=uAa7WUgLo_3mpqyTzoab0bSnmHBUgpQ=vJup0Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqy1=uAa7WUgLo_3mpqyTzoab0bSnmHBUgpQ=vJup0Gw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 07, 2016 at 02:12:05PM +0100, Geert Uytterhoeven wrote:
> On Sun, Nov 6, 2016 at 9:20 PM, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > From: Simon Horman <horms+renesas@verge.net.au>
> >
> > The rename from i2cexio to i2cexio0 is in in preparation for adding
> 
> double "in"
> 
> > i2cexio1 which will use the dmuxer for IIC1/I2C1.
> 
> demuxer
> 
> > The reindexing from i2c8 to i2c10 is to allow space for grouping of
> > additional GPIO buses to added by follow-up patches to support demuxing of
> 
> to be added
> 
> > other i2c buses.
> >
> > Also note that fallback to GPIO is not provided by the hardware for IIC0/I2C0.

Thanks Geert, I have fixed up the commit message as per your suggestions.

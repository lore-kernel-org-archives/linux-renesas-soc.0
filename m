Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36858 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbcIBISE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:18:04 -0400
Date: Fri, 2 Sep 2016 10:17:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 01/13] ARM: dts: lager: rename and reindex i2cexio
Message-ID: <20160902081757.GB16669@verge.net.au>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
 <1466567031-20381-2-git-send-email-horms+renesas@verge.net.au>
 <20160830151819.GA1695@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160830151819.GA1695@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 30, 2016 at 05:29:08PM +0200, Wolfram Sang wrote:
> Hi Simon,
> 
> >  		serial0 = &scif0;
> >  		serial1 = &scifa1;
> > -		i2c8 = "i2cexio";
> > +		i2c10 = "i2cexio0";
> 
> Those should be pointers, i.e. "&i2cexio0;", here and in the rest of
> your series. Sorry for the broken template!

Thanks, got it.

> Did you have a chance to
> test my fix for the demuxer?

Sorry, not yet.

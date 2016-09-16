Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40458 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758337AbcIPJs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 05:48:58 -0400
Date: Fri, 16 Sep 2016 11:48:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        magnus.damm@gmail.com, wsa@the-dreams.de
Subject: Re: [PATCH 4/6] arm64: renesas: r8a7796: add I2C support
Message-ID: <20160916094853.GD14562@verge.net.au>
References: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
 <20160914164611.31237-5-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160914164611.31237-5-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 06:46:09PM +0200, Ulrich Hecht wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

I would like to see some testing of this with 64bit memory enabled -
or some assurance there is no issue with such a configuration.

I am marking this patch and other arm64 patches in this series as Deferred
for now.

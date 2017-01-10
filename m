Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38666 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933016AbdAJIFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 03:05:35 -0500
Date: Tue, 10 Jan 2017 09:05:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [RFC 1/3] mmc: host: tmio: refactor calls to sdio irq
Message-ID: <20170110080528.GC25239@verge.net.au>
References: <20170105114326.12426-1-wsa+renesas@sang-engineering.com>
 <20170105114326.12426-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170105114326.12426-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 05, 2017 at 12:43:24PM +0100, Wolfram Sang wrote:
> tmio_mmc_sdio_irq() is not used as a seperate irq handler anymore, so we
> can make it similar to the other irq helper functions, namely:
> 
> * only give the host as argument function which is what it really needs
> * prefix function name with __
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like that this avoids implicitly casting to and from void *.

Acked-by: Simon Horman <horms+renesas@verge.net.au>

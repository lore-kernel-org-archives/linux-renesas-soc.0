Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:39352 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751904AbdLETnB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 14:43:01 -0500
Date: Tue, 05 Dec 2017 14:42:59 -0500 (EST)
Message-Id: <20171205.144259.1917745716758080716.davem@davemloft.net>
To: thomas.petazzoni@free-electrons.com
Cc: sergei.shtylyov@cogentembedded.com,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] net: sh_eth: DMA mapping API fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Dec 2017 14:33:25 +0100

> Here are two patches that fix how the sh_eth driver is using the DMA
> mapping API: a bogus struct device is used in some places, or a NULL
> struct device is used.

Series applied.

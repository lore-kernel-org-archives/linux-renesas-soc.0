Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:40064 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbeJWLK7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Oct 2018 07:10:59 -0400
Date: Mon, 22 Oct 2018 19:49:41 -0700 (PDT)
Message-Id: <20181022.194941.909491547578465241.davem@davemloft.net>
To: wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        richardcochran@gmail.com, netdev@vger.kernel.org
Subject: Re: [PATCH 1/1] ptp: ptp_dte: simplify getting .driver_data
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181021200039.1933-2-wsa+renesas@sang-engineering.com>
References: <20181021200039.1933-1-wsa+renesas@sang-engineering.com>
        <20181021200039.1933-2-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sun, 21 Oct 2018 22:00:39 +0200

> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

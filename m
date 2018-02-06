Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:45526 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752630AbeBFQZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 11:25:25 -0500
Date: Tue, 06 Feb 2018 11:25:23 -0500 (EST)
Message-Id: <20180206.112523.173878106111040737.davem@davemloft.net>
To: wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org, dan.carpenter@oracle.com,
        linux-renesas-soc@vger.kernel.org, thomas.lendacky@amd.com,
        netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] net: amd-xgbe: fix comparison to bitshift when
 dealing with a mask
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180205201002.23621-5-wsa+renesas@sang-engineering.com>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
        <20180205201002.23621-5-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Mon,  5 Feb 2018 21:10:01 +0100

> Due to a typo, the mask was destroyed by a comparison instead of a bit
> shift.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied and queued up for -stable, thanks.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:37438 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbeEBUly (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 16:41:54 -0400
Date: Wed, 02 May 2018 16:41:53 -0400 (EDT)
Message-Id: <20180502.164153.940230623258227296.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH 0/2] sh_eth: complain on access to unimplemented TSU
 registers
From: David Miller <davem@davemloft.net>
In-Reply-To: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
References: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 2 May 2018 22:53:23 +0300

> Here's a set of 2 patches against DaveM's 'net-next.git' repo. The 1st patch
> routes TSU_POST<n> register accesses thru sh_eth_tsu_{read|write}() and the 2nd
> added WARN_ON() unimplemented register to those functions. I'm going to deal with
> TSU_ADR{H|L}<n> registers in a later series...
> 
> [1/2] sh_eth: use TSU register accessors for TSU_POST<n>
> [2/2] sh_eth: WARN_ON() access to unimplemented TSU register

Series applied to net-next, thanks.

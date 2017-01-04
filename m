Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:59712 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752418AbdADSs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 13:48:58 -0500
Date: Wed, 04 Jan 2017 13:48:13 -0500 (EST)
Message-Id: <20170104.134813.597034024837629584.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] sh_eth: E-MAC interrupt handler cleanups
From: David Miller <davem@davemloft.net>
In-Reply-To: <64514012.uUvlhX0YRQ@wasted.cogentembedded.com>
References: <64514012.uUvlhX0YRQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 04 Jan 2017 15:09:36 +0300

>    Here's a set of 3 patches against DaveM's 'net-next.git' repo. I'm cleaning
> up the E-MAC interrupt handling with the main goal of factoring out the E-MAC
> interrupt handler into a separate function.
> 
> [1/3] sh_eth: handle only enabled E-MAC interrupts
> [2/3] sh_eth: no need for *else* after *goto*
> [3/3] sh_eth: factor out sh_eth_emac_interrupt()

Series applied to net-next, thanks.

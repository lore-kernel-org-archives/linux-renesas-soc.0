Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:54868 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753584AbdA3QZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 11:25:51 -0500
Date: Mon, 30 Jan 2017 11:18:16 -0500 (EST)
Message-Id: <20170130.111816.407600624117593483.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] sh_eth: E-DMAC interrupt mask cleanups
From: David Miller <davem@davemloft.net>
In-Reply-To: <3387005.NzsGXf10rT@wasted.cogentembedded.com>
References: <3387005.NzsGXf10rT@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 29 Jan 2017 15:06:39 +0300

>    Here's a set of 3 patches against DaveM's 'net-next.git' repo. The main goal
> of this set is to stop using the bare numbers for the E-DMAC interrupt masks.
> 
> [1/3] sh_eth: rename EESIPR bits
> [2/3] sh_eth: add missing EESIPR bits
> [3/3] sh_eth: stop using bare numbers for EESIPR values

Series applied, thank you.

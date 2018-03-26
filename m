Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:52982 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752044AbeCZQet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Mar 2018 12:34:49 -0400
Date: Mon, 26 Mar 2018 12:34:47 -0400 (EDT)
Message-Id: <20180326.123447.1350791578528691423.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH 0/2] sh_eth: unify the SoC feature checks
From: David Miller <davem@davemloft.net>
In-Reply-To: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
References: <b3706a51-27a4-d78b-998d-9440637ac216@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 24 Mar 2018 23:04:53 +0300

> Here's a set of 5 patches against DaveM's 'net-next.git' repo.
> 
> The Ether driver sometimes uses the bit fields in 'struct sh_eth_cpu_data'
> to check which Ether registers exist in a certain SoC and sometimes it uses
> sh_eth_is_{gether|rz_fast_ether}() which basically compares 2 pointers (1 of
> them being constant) -- the latter is definitely not a strongest feature of
> the RISC CPUs (be it SH or ARM), so I decided to get rid of this type of
> the feature checks in favour of the bit fields (I've also made use of a
> 32-bit value and method pointer where appropriate)...

Series applied with patch #4 subject fixed up.

Thank you.

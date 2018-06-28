Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:46778 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933361AbeF1HDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jun 2018 03:03:02 -0400
Date: Thu, 28 Jun 2018 16:02:55 +0900 (KST)
Message-Id: <20180628.160255.776642381164230024.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] sh_eth: fix *enum* {A|M}PR_BIT
From: David Miller <davem@davemloft.net>
In-Reply-To: <e67e6256-4ae9-4527-d482-cf3bb50921cf@cogentembedded.com>
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
        <e67e6256-4ae9-4527-d482-cf3bb50921cf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 26 Jun 2018 18:42:33 +0300

> The *enum* {A|M}PR_BIT were declared in the commit 86a74ff21a7a ("net:
> sh_eth: add support for  Renesas SuperH Ethernet") adding SH771x support,
> however the SH771x manual  doesn't have the APR/MPR registers described
> and the code writing to them for SH7710 was later removed by the commit
> 380af9e390ec ("net: sh_eth: CPU dependency code collect to "struct
> sh_eth_cpu_data""). All the newer SoC manuals have these registers
> documented as having a 16-bit TIME parameter of the PAUSE frame, not
> 1-bit -- update the *enum* accordingly, fixing up the APR/MPR writes...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.

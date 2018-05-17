Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:32894 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751642AbeEQSx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 14:53:58 -0400
Date: Thu, 17 May 2018 14:53:57 -0400 (EDT)
Message-Id: <20180517.145357.2037804925428844092.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] Add R8A77980 GEther support
From: David Miller <davem@davemloft.net>
In-Reply-To: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 16 May 2018 22:52:40 +0300

> Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
> add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
> register bits/values introduced with this chip, and ending with adding a new
> 'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
> value...
> 
> [1/1] sh_eth: add RGMII support
> [2/3] sh_eth: add EDMR.NBST support
> [3/3] sh_eth: add R8A77980 support

Waiting for a respin of this, correcting the RGMII check in patch #1.

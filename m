Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34524 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752406AbeERLBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:01:01 -0400
Received: by mail-lf0-f66.google.com with SMTP id x145-v6so1308819lff.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 04:01:00 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add R8A77980 GEther support
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <20180517.145357.2037804925428844092.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <dfae27c2-0658-cdd5-a4f3-ff373e34fefd@cogentembedded.com>
Date: Fri, 18 May 2018 14:00:57 +0300
MIME-Version: 1.0
In-Reply-To: <20180517.145357.2037804925428844092.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/17/2018 09:53 PM, David Miller wrote:

>> Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
>> add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
>> register bits/values introduced with this chip, and ending with adding a new
>> 'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
>> value...
>>
>> [1/1] sh_eth: add RGMII support
>> [2/3] sh_eth: add EDMR.NBST support
>> [3/3] sh_eth: add R8A77980 support
> 
> Waiting for a respin of this, correcting the RGMII check in patch #1.

   Respun yesterday, will repost RSN. :-)

MBR, Sergei

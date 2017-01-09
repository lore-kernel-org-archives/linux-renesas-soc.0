Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:52182 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbdAIVzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 16:55:51 -0500
Date: Mon, 09 Jan 2017 16:55:39 -0500 (EST)
Message-Id: <20170109.165539.1736465829807903795.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: niklas.soderlund+renesas@ragnatech.se, horms+renesas@verge.net.au,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        geert@linux-m68k.org, linux-pm@vger.kernel.org
Subject: Re: [PATCHv3 0/6] sh_eth: add wake-on-lan support via magic packet
From: David Miller <davem@davemloft.net>
In-Reply-To: <a957f04f-0784-fa39-b7b0-8b8bd68c2a30@cogentembedded.com>
References: <20170109153409.13956-1-niklas.soderlund+renesas@ragnatech.se>
        <20170109.155542.1563572267512721426.davem@redhat.com>
        <a957f04f-0784-fa39-b7b0-8b8bd68c2a30@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 10 Jan 2017 00:48:28 +0300

> On 01/09/2017 11:55 PM, David Miller wrote:
> 
>>> This series adds support for Wake-on-Lan using Magic Packet for a few
>>> models of the sh_eth driver. Patch 1/6 fix a naming error, patch 2/6
>>> adds generic support to control and support WoL while patches 3/6 -
>>> 6/6
>>> enable different models.
>>>
>>> Based ontop of net-next master.
>>  ...
>>
>> Series applied, thanks.
> 
>    That was too quick for me... I hadn't even started looking into the
>    main patch yet. :-/

Sorry, today a lot of stuff got submitted and I do not want to have such
a huge backlog at the end of the day.

I can revert the entire series if you want me to.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33374 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031965AbdAIVsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 16:48:32 -0500
Received: by mail-lf0-f50.google.com with SMTP id k86so103563356lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2017 13:48:32 -0800 (PST)
Subject: Re: [PATCHv3 0/6] sh_eth: add wake-on-lan support via magic packet
To: David Miller <davem@redhat.com>,
        niklas.soderlund+renesas@ragnatech.se
References: <20170109153409.13956-1-niklas.soderlund+renesas@ragnatech.se>
 <20170109.155542.1563572267512721426.davem@redhat.com>
Cc: horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-pm@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a957f04f-0784-fa39-b7b0-8b8bd68c2a30@cogentembedded.com>
Date: Tue, 10 Jan 2017 00:48:28 +0300
MIME-Version: 1.0
In-Reply-To: <20170109.155542.1563572267512721426.davem@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/09/2017 11:55 PM, David Miller wrote:

>> This series adds support for Wake-on-Lan using Magic Packet for a few
>> models of the sh_eth driver. Patch 1/6 fix a naming error, patch 2/6
>> adds generic support to control and support WoL while patches 3/6 - 6/6
>> enable different models.
>>
>> Based ontop of net-next master.
>  ...
>
> Series applied, thanks.

    That was too quick for me... I hadn't even started looking into the main 
patch yet. :-/

MBR, Sergei

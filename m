Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:51613 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752354AbdHUIY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 04:24:58 -0400
Subject: Re: Status of r8a7795 SDHI support?
To: Wolfram Sang <wsa@the-dreams.de>
CC: <linux-renesas-soc@vger.kernel.org>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
 <20170821081808.7teztwh4hbz25zjq@ninjato>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <977e03d5-f59d-b41e-9135-fc6dfc19482d@de.bosch.com>
Date: Mon, 21 Aug 2017 10:24:55 +0200
MIME-Version: 1.0
In-Reply-To: <20170821081808.7teztwh4hbz25zjq@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 21.08.2017 10:18, Wolfram Sang wrote:
> Hi Dirk,
> 
>>> Ah, ES2.0. That's the missing information. Yup, is on the todo-list. I
>>> will try to test your patch on my Salvator-XS board today.
>>
>> Ok, thanks :)
> 
> Your patch on top of v4.13-rc5 makes SDHI work on my Salvator-XS with a


Please feel free to forward it to the correct channels for merge, then.


> H3 ES2.0. It detects the eMMC and I can mount SD cards on both slots and
> checksum large files.


Hmm, sounds like I have to search on my custom board why there is not 
output at all, then :(

Anyway, many thanks for testing!

Best regards

Dirk

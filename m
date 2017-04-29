Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:36349 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755605AbdD2P74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Apr 2017 11:59:56 -0400
Received: by mail-wm0-f48.google.com with SMTP id u65so62846400wmu.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Apr 2017 08:59:55 -0700 (PDT)
Subject: Re: [RFC 0/2] mmc: sdhi: make use of CBSY
To: Wolfram Sang <wsa@the-dreams.de>
References: <1453808801-12510-1-git-send-email-wsa@the-dreams.de>
 <ac6f67df-b124-53c3-ee54-9f215120c556@gmail.com>
 <20170429095523.GA2689@katana>
Cc: linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
From: Dirk Behme <dirk.behme@gmail.com>
Message-ID: <12359195-20b7-eee1-f914-db1c2ae0a6ee@gmail.com>
Date: Sat, 29 Apr 2017 17:59:49 +0200
MIME-Version: 1.0
In-Reply-To: <20170429095523.GA2689@katana>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29.04.2017 11:55, Wolfram Sang wrote:
> Hi Dirk,
>
>> Checking the recent kernel [1] it seems to me that this changes never made
>> it into mainline.
>>
>> Does anybody remember why and/or the history?
>
> As for Ulf, it was RFC, so no urge to pick it up. As for me, I was
> waiting for more feedback and then it fell through the cracks.
>
> Thanks for bringing it up again. I am curious, does it make a
> difference somewhere despite being closer to the docs?


No, not that I'm aware atm. Most probably, its only relevant from 
review point of view.

We just found this topic while comparing what was applied to an older 
internal test version compared to recent mainline.

So if it does no harm an makes the code closer to the docs, would it 
be an option to apply it?

Best regards

Dirk

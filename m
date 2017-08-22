Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:38395 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751384AbdHVGpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 02:45:19 -0400
Subject: Re: Status of r8a7795 SDHI support?
To: Wolfram Sang <wsa@the-dreams.de>
CC: <linux-renesas-soc@vger.kernel.org>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
 <20170821081808.7teztwh4hbz25zjq@ninjato>
 <977e03d5-f59d-b41e-9135-fc6dfc19482d@de.bosch.com>
 <06bc290a-8173-3d41-ff1e-8c26b4d4c093@de.bosch.com>
 <20170821134722.GA5226@katana>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <fc4e436e-9b6c-d39a-2061-aeaa1a249cc4@de.bosch.com>
Date: Tue, 22 Aug 2017 08:45:16 +0200
MIME-Version: 1.0
In-Reply-To: <20170821134722.GA5226@katana>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 21.08.2017 15:47, Wolfram Sang wrote:
> 
>> It works, now :)
> 
> Great!
> 
>> tmio_mmc_init_ocr()
>>
>> fails (silently!). And with this the whole RCar3 SDHI, without any error
>> message.
> 
> I'll check next week about an error message there.
> 
>> Many thanks for your help!
> 
> You're welcome. If you want, you can even test SDR104 by applying this
> patch:
> 
> [RFT] arm64: dts: renesas: salvator-common: enable SDR104 for SD cards
> 
> It works fine here for SD cards. My SDIO card makes problems, but that
> might be the line length is just too long. We are currently evaluating
> that. So, testing SDR104 on various boards would be very helpful!


I'm not an expert on this, does SDR104 need 1.8V?

To my understanding, sd-uhs-sdr50 is the max speed for 3.3V?

I ask because on my custom board the hardware guys gave us 3.3V, only, 
for the SD slot :(


>> P.S.: Will try to send the pin mux patch tomorrow.
> 
> Thanks, I'll have a look at it next week then, too.


Patch sent.

Best regards

Dirk

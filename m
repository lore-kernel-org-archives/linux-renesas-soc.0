Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53016 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbeLKJbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 04:31:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id m1so784592wml.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 01:31:13 -0800 (PST)
Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To: Biju Das <biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
 <eb72f5b7-2920-b3b5-8387-d2b6b2d310cd@linaro.org>
 <OSBPR01MB2103C137219528C37165A317B8A60@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ca6c023b-e8a2-09c8-6931-99f9d7b70afe@linaro.org>
Date: Tue, 11 Dec 2018 09:31:10 +0000
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103C137219528C37165A317B8A60@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 11/12/18 08:16, Biju Das wrote:
> Hi Srini,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
>> nvmem_{read,write}()
>>
>>
>>
>> On 10/12/18 15:28, Biju Das wrote:
>>> +/* Stop the user from writing */
>>> +if (offset >= nvmem->size)
>>> +return -ENOSPC;
>>> +
>> This should be "return -EFBIG" to make utilities like dd or sh happy.
>>
>> Look at 38b0774c0598c ("nvmem: core: return EFBIG on out-of-range
>> write") for more info.
> 
> return -ENOSPC also make dd or sh happy. Please let me know which is appropriate by the below results. Based on your feedback, If needed, I can send a patch with "return -EFBIG"
> 

Lets stay with -EFBIG for now! given the fact that it was already in the 
old code!


--srini

> With -ENOSPC
> ------------
> dd if=1.bin of=/sys/bus/nvmem/devices/pcf85x63-0/nvmem bs=1 count=2
> dd: writing '/sys/bus/nvmem/devices/pcf85x63-0/nvmem': No space left on device
> 2+0 records in
> 1+0 records out
> 
> echo "1234" > /sys/bus/nvmem/devices/pcf85x63-0/nvmem
> -sh: echo: write error: No space left on device
> 
> with -EFBIG
> ------------
> dd if=1.bin of=/sys/bus/nvmem/devices/pcf85x63-0/nvmem bs=1 count
> dd: writing '/sys/bus/nvmem/devices/pcf85x63-0/nvmem': File too large
> 2+0 records in
> 1+0 records out
> 
> echo "1234" > /sys/bus/nvmem/devices/pcf85x63-0/nvmem
> -sh: echo: write error: File too large
> 
> Regards,
> Biju
> 
> 
> 
> 
> [https://www2.renesas.eu/media/email/unicef.jpg]
> 
> This Christmas, instead of sending out cards, Renesas Electronics Europe have decided to support Unicef with a donation. For further details click here<https://www.unicef.org/> to find out about the valuable work they do, helping children all over the world.
> We would like to take this opportunity to wish you a Merry Christmas and a prosperous New Year.
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 

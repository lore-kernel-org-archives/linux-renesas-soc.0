Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:24561 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeJCIT2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 04:19:28 -0400
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org,
        geert+renesas@glider.be, linux-hwmon@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
 <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <84db03da-fb58-0f77-cfb4-317b434376f8@jinso.co.jp>
Date: Wed, 3 Oct 2018 10:33:16 +0900
MIME-Version: 1.0
In-Reply-To: <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Guenter-san,

Thanks for your comment!

>> In __hwmon_device_register() function of hwmon.c, we have assigned 
>> 'dev' directly to 'hdev->parent'.
>> Formerly, when registering the hwmon device, we pass NULL as the 
>> device. This is not affected.
>> Recently, the developer has replaced the parameter NULL as the device 
>> by the actual device.
>> This causes the "No sensors found" error. This patch is to fix this 
>> error.
>>
>> This patch is based on the v4.19-rc3 tag.
>>
>
> NACK.
>
> This is wrong. The passed device is the hwmon driver's parent device. 
> Using that device's
> parent would be wrong. Indeed, that device could be a platform device 
> with no parent.
Maybe I did not know all problem. If I'm wrong, sorry for the inconvenience.

> The problem must be fixed in the calling code.
>
I will see the feedback from Marc-san.


Regards,
Dong/Jinso

>> ---
>>   drivers/hwmon/hwmon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
>> index 33d5128..7c8d3cb 100644
>> --- a/drivers/hwmon/hwmon.c
>> +++ b/drivers/hwmon/hwmon.c
>> @@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const 
>> char *name, void *drvdata,
>>         hwdev->name = name;
>>       hdev->class = &hwmon_class;
>> -    hdev->parent = dev;
>> +    hdev->parent = dev->parent;
>>       hdev->of_node = dev ? dev->of_node : NULL;
>>       hwdev->chip = chip;
>>       dev_set_drvdata(hdev, drvdata);

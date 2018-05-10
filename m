Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f42.google.com ([209.85.213.42]:46988 "EHLO
        mail-vk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbeEJIWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 04:22:08 -0400
Received: by mail-vk0-f42.google.com with SMTP id i190-v6so702158vkd.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 May 2018 01:22:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoT=idCav6t7woXBTVQQjr9YRCaCcqS+S5BWrNXEV90zQA@mail.gmail.com>
References: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
 <CANqRtoT=idCav6t7woXBTVQQjr9YRCaCcqS+S5BWrNXEV90zQA@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 10 May 2018 11:22:07 +0300
Message-ID: <CAOtvUMcBvDxhW+hsK2UHdkxm+X8SE3GorD+Fq8GPrBVguS3KPA@mail.gmail.com>
Subject: Re: Booting Salvator-X ES1 board with upstream kernel
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 10, 2018 at 11:19 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> Hi Gilad,
>
> Thanks for your email.
>
> On Thu, May 10, 2018 at 5:12 PM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
>> Hi there,
>>
>> I am trying to add support for the CryptoCell security IP in the
>> R-Rcar boards to mainline but I've run into some trouble.
>>
>> I have an R-Car 3rd gen Salvator-X ES1 board. I've been able to boot
>> Linux 4.9 on it from the rareness-bsp tree, using the defconfig and
>> the r8a7795-es1-salvator-x DTB with no problems, so the HW is fine.
>>
>> However, I can't seem to boot an upstream kernel (Linus master or
>> soc-for-v4.17 branch) on it. I just get total silence on the UART
>> after u-boot.
>>
>> Any tips or ideas for me to try?
>
> Just to clarify, are you using r8a7795 R-Car H3 SoC ES1.0, or some other SoC?
>
> Salvator-X comes in different configurations.

To the best of my knowledge I am indeed using the r8a7795 R-Car H3 SoC ES1.0

Thanks,
Gilad



-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru

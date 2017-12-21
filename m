Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:32999 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752471AbdLUQIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 11:08:02 -0500
Received: by mail-lf0-f68.google.com with SMTP id g80so24058658lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 08:08:01 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <45101cc8-d2e8-7835-42f2-9566b9c3cd52@cogentembedded.com>
Date: Thu, 21 Dec 2017 19:07:58 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/21/2017 03:25 PM, Geert Uytterhoeven wrote:

>> We need to configure its GPIOs later.
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -338,6 +338,11 @@
>>   &i2c4 {
>>          status = "okay";
>>
>> +       pca9654: gpio@20 {
>> +               compatible = "onsemi,pca9654";
>> +               reg = <0x20>;
> 
> Missing gpio-controller, #gpio-cells, and interrupts properties?

    Indeed.

> Seems like Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> can use some updates...

    What do you mean? I've surely updated it in my vendor prefix fix:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a64e557f399090f5d1917b2f32a065da2b12be1

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei

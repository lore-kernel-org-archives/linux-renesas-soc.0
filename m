Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:45099 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752544AbeBZLf6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 06:35:58 -0500
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>
References: <20180217020756.21474-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
 <2860322f-89b9-32aa-37bc-4fa4a52c1837@gmail.com>
 <20180226105510.azlj56eohhu5wu3n@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0a1597df-a9ba-c178-3af2-042cb3e31de4@gmail.com>
Date: Mon, 26 Feb 2018 12:15:39 +0100
MIME-Version: 1.0
In-Reply-To: <20180226105510.azlj56eohhu5wu3n@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/26/2018 11:55 AM, Simon Horman wrote:
> On Sat, Feb 24, 2018 at 11:11:31PM +0100, Marek Vasut wrote:
>> On 02/18/2018 04:07 PM, Geert Uytterhoeven wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> CC Steve Twiss
>>>
>>> On Sat, Feb 17, 2018 at 3:07 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> Add PMIC nodes to Porter and connect CPU DVFS supply. There is
>>>> one DA9063 and one DA9210 on Porter, the only difference from
>>>> the other boards is that DA9063 is at I2C address 0x5a rather
>>>> than 0x58 .
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/arm/boot/dts/r8a7791-porter.dts
>>>> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
>>>> @@ -354,10 +354,47 @@
>>>>         clock-frequency = <400000>;
>>>>  };
>>>>
>>>> +&i2c6 {
>>>> +       status = "okay";
>>>> +       clock-frequency = <100000>;
>>>> +
>>>> +       pmic@5a {
>>>> +               compatible = "dlg,da9063";
>>>
>>> Does it matter that this is a DA9063L ("Variant 6B")?
>>> Do we need a new compatible value, or can this be detected at runtime?
>>
>> The driver detects it
>>
>> da9063 6-005a: Device detected (chip-ID: 0x61, var-ID: 0x63)
>>
>> Comparing the datasheets makes it obvious that 9063L is just a cut-down
>> version of 9063, with less LDOs and one less ADC. So I think we should
>> have extra compatible and have the driver restrict which LDOs can be
>> used with this smaller PMIC.
> 
> Thanks, and sorry to ping yo about this while you were in transit.
> 
> It sounds like this patch should be updated.
> Accordingly I'm marking it as "Changes Requested".

Correct

-- 
Best regards,
Marek Vasut

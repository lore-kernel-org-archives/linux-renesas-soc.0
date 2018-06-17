Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:43984 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932733AbeFQBov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Jun 2018 21:44:51 -0400
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so7206680plj.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Jun 2018 18:44:51 -0700 (PDT)
Subject: Re: [RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and
 newer
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        u-boot@lists.denx.de, Geert Uytterhoeven <geert@linux-m68k.org>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        takuya.sakata.wz@bp.renesas.com
References: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <2832035.axAMzJBFkt@avalon> <8c5cc7c6-c518-81e6-3c2f-503e1abbe4b0@gmail.com>
 <1667599.ksFFHZy3Oy@avalon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <64c5ff1c-d679-27bb-f6a1-398d8595c050@gmail.com>
Date: Sun, 17 Jun 2018 02:08:02 +0200
MIME-Version: 1.0
In-Reply-To: <1667599.ksFFHZy3Oy@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/16/2018 05:44 PM, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Saturday, 16 June 2018 02:42:30 EEST Marek Vasut wrote:
>> On 06/16/2018 01:21 AM, Laurent Pinchart wrote:
>>> On Friday, 15 June 2018 15:00:31 EEST Marek Vasut wrote:
>>>> On 06/15/2018 01:43 PM, Marek Vasut wrote:
>>>>> On 06/15/2018 12:37 PM, Ulrich Hecht wrote:
>>>>>> On Fri, Jun 15, 2018 at 12:09 PM, Marek Vasut  wrote:
>>>>>>>> +             arm_smccc_smc(ARM_SMCCC_RENESAS_MEMCONF,
>>>>>>>> +                           0, 0, 0, 0, 0, 0, 0, &res);
>>>>>>>
>>>>>>> Will this call work on platforms without patched ATF ?
>>>>>>> (I think not, don't you need to handle return value?)
>>>>>>
>>>>>> I have not actually tested that, but if I understand the ATF code
>>>>>> correctly, unimplemented calls return
>>>>>> SMC_UNK (0xffffffff), which should be handled by the default case (NOP)
>>>>>> below.
>>>>>
>>>>> Which means the board has a memory size of 0 and fails to boot ?
>>>>>
>>>>>>>> +             switch (res.a0) {
>>>>>>>> +             case 1:
>>>>>>>> +                     base[0] = 0x048000000ULL;
>>>>>>>> +                     size[0] = 0x038000000ULL;
>>>>>>>> +                     base[1] = 0x500000000ULL;
>>>>>>>> +                     size[1] = 0x040000000ULL;
>>>>>>>> +                     base[2] = 0x600000000ULL;
>>>>>>>> +                     size[2] = 0x040000000ULL;
>>>>>>>> +                     base[3] = 0x700000000ULL;
>>>>>>>> +                     size[3] = 0x040000000ULL;
>>>>>>>> +                     fdt_fixup_memory_banks(blob, base, size, 4);
>>>>>>>> +                     break;
>>>>>>>> +             case 2:
>>>>>>>> +                     base[0] = 0x048000000ULL;
>>>>>>>> +                     size[0] = 0x078000000ULL;
>>>>>>>> +                     base[1] = 0x500000000ULL;
>>>>>>>> +                     size[1] = 0x080000000ULL;
>>>>>>>> +                     fdt_fixup_memory_banks(blob, base, size, 2);
>>>>>>>> +                     break;
>>>>>>>> +             case 3:
>>>>>>>> +                     base[0] = 0x048000000ULL;
>>>>>>>> +                     size[0] = 0x078000000ULL;
>>>>>>>> +                     base[1] = 0x500000000ULL;
>>>>>>>> +                     size[1] = 0x080000000ULL;
>>>>>>>> +                     base[2] = 0x600000000ULL;
>>>>>>>> +                     size[2] = 0x080000000ULL;
>>>>>>>> +                     base[3] = 0x700000000ULL;
>>>>>>>> +                     size[3] = 0x080000000ULL;
>>>>>>>> +                     fdt_fixup_memory_banks(blob, base, size, 4);
>>>>>>>> +                     break;
>>>>>>>
>>>>>>> Obvious design question is -- since you're adding new SMC call anyway,
>>>>>>> can't the call just return the memory layout table itself, so that it
>>>>>>> won't be duplicated both in U-Boot and ATF ?
>>>>>>
>>>>>> My gut feeling was to go with the smallest interface possible.
>>>>>
>>>>> But this doesn't scale. The API here uses some ad-hoc constants to
>>>>> identify memory layout tables which have to be encoded both in ATF and
>>>>> U-Boot, both of which must be kept in sync.
>>>>>
>>>>> The ATF already has those memory layout tables, it's only a matter of
>>>>> passing them to U-Boot. If you do just that, the ad-hoc constants and
>>>>> encoding of tables into U-Boot goes away and in fact simplifies the
>>>>> design.
>>>>>
>>>>> Yet, I have to wonder if ATF doesn't already contain some sort of
>>>>> standard SMC call to get memory topology. It surprises me that it
>>>>> wouldn't.
>>>>
>>>> In fact, Laurent (CCed) was solving some similar issue with lossy decomp
>>>> and I think this involved some passing of memory layout information from
>>>> ATF to U-Boot too, or am I mistaken ?
>>>
>>> That's correct, ATF stores information about the memory layout at a fixed
>>> address in system memory, and U-Boot can read it.
>>
>> Well, that sounds good ! Maybe we can avoid adding SMC call altogether
>> then? :)
> 
> I'd prefer that, yes.
> 
> Let's not duplicate the mechanism used to pass FCNL information from ATF to U-
> Boot, but instead create a data table format that can store all the 
> information we need, in an easily extensible way.
> 
> To see how the mechanism is implemented for FCNL, search for 47FD7000 in the 
> Renesas ATF sources (git://github.com/renesas-rcar/arm-trusted-firmware.git).

For everyone involved, can you explain what FCNL is ? ;-)

Any yes, I agree this sounds good. I had a discussion on the U-Boot IRC
about passing the memory configuration around and the result is
basically the same -- pass a table from ATF to U-Boot. If there's
already something, great.

-- 
Best regards,
Marek Vasut

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:37982 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965590AbeFOKhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 06:37:32 -0400
Received: by mail-oi0-f42.google.com with SMTP id d5-v6so8392103oib.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jun 2018 03:37:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fc5a0c4f-8e2a-19bf-2d46-6ade92920b5c@gmail.com>
References: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com> <fc5a0c4f-8e2a-19bf-2d46-6ade92920b5c@gmail.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Fri, 15 Jun 2018 12:37:30 +0200
Message-ID: <CAO3366yB85UTK+T1Wq8_tV_J4AS0zwAWkKSDAfqUJWcLsDj=7g@mail.gmail.com>
Subject: Re: [RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and newer
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        u-boot@lists.denx.de, Geert Uytterhoeven <geert@linux-m68k.org>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        takuya.sakata.wz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 15, 2018 at 12:09 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> +             arm_smccc_smc(ARM_SMCCC_RENESAS_MEMCONF,
>> +                           0, 0, 0, 0, 0, 0, 0, &res);
>
> Will this call work on platforms without patched ATF ?
> (I think not, don't you need to handle return value?)

I have not actually tested that, but if I understand the ATF code
correctly, unimplemented calls return
SMC_UNK (0xffffffff), which should be handled by the default case (NOP) below.

>
>> +             switch (res.a0) {
>> +             case 1:
>> +                     base[0] = 0x048000000ULL;
>> +                     size[0] = 0x038000000ULL;
>> +                     base[1] = 0x500000000ULL;
>> +                     size[1] = 0x040000000ULL;
>> +                     base[2] = 0x600000000ULL;
>> +                     size[2] = 0x040000000ULL;
>> +                     base[3] = 0x700000000ULL;
>> +                     size[3] = 0x040000000ULL;
>> +                     fdt_fixup_memory_banks(blob, base, size, 4);
>> +                     break;
>> +             case 2:
>> +                     base[0] = 0x048000000ULL;
>> +                     size[0] = 0x078000000ULL;
>> +                     base[1] = 0x500000000ULL;
>> +                     size[1] = 0x080000000ULL;
>> +                     fdt_fixup_memory_banks(blob, base, size, 2);
>> +                     break;
>> +             case 3:
>> +                     base[0] = 0x048000000ULL;
>> +                     size[0] = 0x078000000ULL;
>> +                     base[1] = 0x500000000ULL;
>> +                     size[1] = 0x080000000ULL;
>> +                     base[2] = 0x600000000ULL;
>> +                     size[2] = 0x080000000ULL;
>> +                     base[3] = 0x700000000ULL;
>> +                     size[3] = 0x080000000ULL;
>> +                     fdt_fixup_memory_banks(blob, base, size, 4);
>> +                     break;
>
> Obvious design question is -- since you're adding new SMC call anyway,
> can't the call just return the memory layout table itself, so that it
> won't be duplicated both in U-Boot and ATF ?

My gut feeling was to go with the smallest interface possible.

CU
Uli

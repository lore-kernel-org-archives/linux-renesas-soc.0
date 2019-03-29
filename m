Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20138C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 07:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4906A2173C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 07:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="n60p+w1v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbfC2HFG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 03:05:06 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:49476 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbfC2HFG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 03:05:06 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 44Vt664VvXz1XLGMB;
        Fri, 29 Mar 2019 08:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1553843102;
        bh=xSzlTI5ByBzxomol2l57PFqBuDQF9cj7yVZ+PcN0FhE=; l=10;
        h=From:From:Reply-To:Sender;
        b=n60p+w1vXLbpAdIcVJh8Vla6kLh1cizp6uCadeKc7mELGzJWbJcD+b/jPurqueCxK
         qDKdbKb1SZYkQjsYomf0fHNIhpquvHA23fbvDEb1rdghuMtpUXhrQDSZGzyuYH4f8Y
         pMRk8F5hhLjTfPcMXPfjLYr83CLfMCkStdOUemQw=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44Vt6640wrz1Qj;
        Fri, 29 Mar 2019 08:05:02 +0100 (CET)
X-AuditID: 0a3aad14-cc5ff7000000410a-78-5c9dc39e8555
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 9B.C7.16650.E93CD9C5; Fri, 29 Mar 2019 08:05:02 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 44Vt661kpMzR6c;
        Fri, 29 Mar 2019 08:05:02 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5; Fri, 29 Mar 2019
 08:05:01 +0100
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
CC:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
 <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
 <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
Date:   Fri, 29 Mar 2019 08:05:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf0wTZxjHee+uvaNw7CgwHlAh636Ykchgw3lhPzRZYopxzuyP6bZmrowD
        GtpCeoUAySICcwxmQhhUegrtopuODicgAlMmFscQQTowG0KnMJvxax3JGAoTcD0Ktn/sv+89
        z/fzPs9937wULu+koimN3sgZ9GqtQiojZMmNW7bVd9epEiZbI1jz72cItuFRKcb+MdqJsa5H
        DyTsTWstYq+1DJNs6/RfGNt/6hjJjtvcUna5s4xkB6w1BHus+mX2m14B30UrhU9tpLJD+I1U
        uif2K+3dZUh5aaEYKa/3uQjlfHPMfvI92atpnFaTxxleeP1DWaa7YRXPWTqYX/t5FypCEynl
        iKKASYKZG1g5CqTkzFEMnONsOZJ5tA1BY5EF936cQTD3i4kQXWHMQThi7lvT4cw78N1yPRJN
        OHMbh7ZfP5F6iWYM7k90SEWXlImDjsoyUtRPMPFg/WFAImqa2Qml7c41D8E8Cz3dX615IhgV
        9NZcIL2eULhudq1NC2R2wcn+1TUWZ1gwWwaRV0fCqMuCeXUslLSewEUNzFNQM1ZBVKIwwe8o
        wQ8X/HDBD7ciogFFpHMJebrEHUkJ8YZUji9MSIz/KFvXjLxXGd6OHtrT7YihkCKYjmusU8kl
        6jy+QGdH2ylMEUHHHveUQlKz0woy1XzmIUOuluMV0fRmxx6VPOxxmc9N1Wl4XpOttyOgcEU4
        ve2Kh6PT1AWFnCHbi9nRJopQRNIZ1FsqOZOhNnJZHJfDGTa6r1CUAuhkuwcMNXAZXH66Rmvc
        aCu20CggIED+pH/HfyxGBdrRS1SwZ/bfV8XZfI5ax2sy1vEoLy7fqPrQPpRCzS1M1OGU2TxZ
        h8sJfbaei46knxcXYUR/Zq7+8R7Rm2ntnKCSR/g1fGfNoBHkSTKMjhLhYM+78W0A9CYxtND1
        og968bSHYVpj4bOp3TC0eBbBzNwFBOZqJ4L69gUEwpwTg3OV9zC407+Ewfm2uwQsHymTgKWn
        WgLfDp6VwPz0fQkUV1ml8MWsWwpD3wskXG7rI2HKsULB1J3BQHg4XCGDf5pMMvhz1iEDy71Z
        GdysKA2CxaK7QXDZthgE9bWVNFhGFmkYOdoUAr2uKyFQ9aUjBCwnF0JmPOlinnRnDp8Q0zWq
        jf+T7nrV93PRRUjq/qCl99a7lhqTqcGeON492lv/zN6fK1uyotqfe9/RfD7Gffvf1wJLDny9
        /VZ1sJBebEzNyBo6PnatqqT54o03Vg7wq9OHTStbU642JS0dqjmdcCl80vbm8NhPzHyj60d6
        opbskjk1H2v29RTvSJbuHKQe7C28GFOQPxD19tO7u7aWnVMQfKY6MQ438Or/AFIYQPjQBAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 28.03.2019 12:30, Dirk Behme wrote:
> On 28.03.2019 11:16, Dirk Behme wrote:
>> Hi Geert,
>>
>> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
>>> Hi Eugeniu,
>>>
>>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com> 
>>> wrote:
>>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and 
>>>> the
>>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3], 
>>>> which
>>>> mirrors v4.18-rc1 commit [4] in mainline.
>>>>
>>>> JFYI, quite far away in the delivery chain, we've received below 
>>>> report:
>>>>
>>>>> With this patch [2-4] there are reports about broken data
>>>>> communication with 115200 baud with SXM module. Reverting
>>>>> this patch results in successful communication, again.
>>>>
>>>> While this scarce information barely helps anybody, I thought that
>>>> sharing it with you might be beneficial in case you collect several
>>>> reports linked to this specific commit in future, meaning it 
>>>> potentially
>>>> adds a regression.
>>>>
>>>> Also, if you are aware of any userland changes that might be
>>>> required/assumed by this patch or in case you have any alternative
>>>> ideas how to avoid reverting this patch, your feedback would be very
>>>> appreciated.
>>>
>>> Thanks for your report!
>>>
>>> [TLDR: skip to the suggested fix below; I only noticed the bug after
>>>         writing the below paragraphs, which are still useful 
>>> questions to
>>>         let us reproduce the issue]
>>>
>>> Which SoC are you using?
>>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
>>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
>>> hence the affected code path is not exercised:
>>>
>>>      sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
>>>      sh-sci e6550000.serial: Using clk scif for 115200+0 bps
>>>
>>> Does your board have an external SCIF clock? Which frequency?
>>> Can you check the clock values and deviation for your configuration, by
>>> changing the calls to print the above information from dev_dbg() to
>>> dev_info()?
>>>
>>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
>>> of the posted patch, help?
>>> Perhaps the sampling point shift is inverted? Does -shift work better?
>>>
>>> [possible solution]
>>>
>>>> +                               int shift = min(-8, max(7, deviation 
>>>> / 2));
>>>
>>> Oops, min and max are exchanged!
>>>
>>> I guess using
>>>
>>>      int shift = clamp(deviation / 2, -8, 7)
>>>
>>> instead fixes the issue?
>>
>>
>> Uh, that was fast :) Many thanks!
>>
>> We will test this as fast as possible! But due to the long delivery 
>> chain Eugeniu mentioned this will take some time. I'll try my best to 
>> come back to you as fast as possible.
> 
> 
> Just for the archives: We are testing the attached patch.


* Testing the patch [5]

- int shift = min(-8, max(7, deviation / 2));
+ int shift = clamp(deviation / 2, -8, 7);

does *not* fix our issue. Or in other words: Testing was *not* successful.

* However, from review point of view we think that it fixes a serious 
bug. So maybe it should be applied, anyhow?

* Using strace we managed to get some more information about the usage 
of the serial port [6]. With this, we are talking about 57600 and not 115200

* Switching to dev_info() [7] as requested above we get

[    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41, 
base_baud = 0) is a hscif
[  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
[  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
[  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
[  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps

* We are talking about a custom r8a7796 board

Best regards

Dirk


[5] https://patchwork.kernel.org/patch/10322809/#22554931

[6]

[pid  4715] newfstatat(AT_FDCWD, "/dev/ttySC3", {st_mode=S_IFCHR|0777, 
st_rdev=makedev(204, 11), ...}, 0) = 0
[pid  4715] openat(AT_FDCWD, "/dev/ttySC3", O_RDWR) = 9
[pid  4715] ioctl(9, TCGETS, {B9600 opost isig icanon echo ...}) = 0
[pid  4715] ioctl(9, TCFLSH, TCIFLUSH)  = 0
[pid  4715] ioctl(9, SNDCTL_TMR_START or TCSETS, {B57600 -opost -isig 
-icanon -echo ...}) = 0
[pid  4715] ioctl(9, TIOCMGET, 
[TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4715] ioctl(9, TIOCMSET, 
[TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4715] ioctl(9, TIOCMGET, 
[TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4715] ioctl(9, TIOCMSET, 
[TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4715] nanosleep({0, 250000000}, NULL) = 0
[pid  4715] mmap(NULL, 8388608, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0xffffbc192000
[pid  4715] mprotect(0xffffbc192000, 4096, PROT_NONE) = 0
[pid  4715] clone(child_stack=0xffffbc990af0, 
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
parent_tidptr=0xffffbc9912b0, tls=0xffffbc9918d0, 
child_tidptr=0xffffbc9912b0) = 4720
strace: Process 4720 attached
[pid  4715] futex(0xffff200082cc, FUTEX_WAIT_BITSET_PRIVATE, 1, {442, 
798479296}, ffffffff <unfinished ...>
[pid  4720] set_robust_list(0xffffbc9912c0, 24) = 0
[pid  4720] prctl(PR_SET_NAME, "link_thread\0\0\0\0\0") = 0
[pid  4720] mmap(NULL, 8388608, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0xffff27800000
[pid  4720] mmap(0xffff24000000, 67108864, PROT_NONE, 
MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESERVE, -1, 0) = 0xffff1c000000
[pid  4720] mprotect(0xffff1c000000, 135168, PROT_READ|PROT_WRITE) = 0
[pid  4720] mprotect(0xffff27800000, 4096, PROT_NONE) = 0
[pid  4720] clone(strace: Process 4721 attached
child_stack=0xffff27ffeaf0, 
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
parent_tidptr=0xffff27fff2b0, tls=0xffff27fff8d0, 
child_tidptr=0xffff27fff2b0) = 4721
[pid  4721] set_robust_list(0xffff27fff2c0, 24 <unfinished ...>
[pid  4720] ioctl(9, TIOCMGET <unfinished ...>
[pid  4721] <... set_robust_list resumed> ) = 0
[pid  4720] <... ioctl resumed> , 
[TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4721] prctl(PR_SET_NAME, "link_reader\0\0\0\0\0" <unfinished ...>
[pid  4720] ioctl(9, TIOCMSET, [TIOCM_DTR|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR] 
<unfinished ...>
[pid  4721] <... prctl resumed> )       = 0
[pid  4720] <... ioctl resumed> )       = 0
[pid  4721] ppoll([{fd=9, events=POLLIN}], 1, {1, 0}, NULL, 0 
<unfinished ...>
[pid  4720] nanosleep({0, 250000000}, NULL) = 0
[pid  4720] ioctl(9, TIOCMGET, 
[TIOCM_DTR|TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4720] ioctl(9, TIOCMSET, [TIOCM_CTS|TIOCM_CAR|TIOCM_DSR]) = 0
[pid  4720] nanosleep({0, 100000000}, NULL) = 0
[pid  4720] ioctl(9, TCGETS, {B57600 -opost -isig -icanon -echo ...}) = 0
[pid  4720] ioctl(9, TCFLSH, TCIFLUSH)  = 0
[pid  4720] ioctl(9, SNDCTL_TMR_START or TCSETS, {B57600 -opost -isig 
-icanon -echo ...}) = 0
[pid  4720] write(9, "\336\306\0\0\0\4\0\0\0\0\304\250", 12) = 12
[pid  4720] futex(0xffff2000824c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008248, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4716] <... futex resumed> )       = 0
[pid  4720] futex(0xffff20008d9c, FUTEX_WAIT_PRIVATE, 1, NULL 
<unfinished ...>
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 5, {383, 
226656729}, ffffffff) = -1 ETIMEDOUT (Connection timed out)
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff20008d9c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008d98, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4720] <... futex resumed> )       = 0
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 7, {393, 
151155511}, ffffffff <unfinished ...>
[pid  4720] futex(0xffff20008d60, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4720] write(9, "\336\306\0\0\0\4\0\0\0\0\304\250", 12) = 12
[pid  4720] futex(0xffff2000824c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008248, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4720] futex(0xffff20008d9c, FUTEX_WAIT_PRIVATE, 3, NULL 
<unfinished ...>
[pid  4716] <... futex resumed> )       = 0
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 9, {383, 
301617693}, ffffffff) = -1 ETIMEDOUT (Connection timed out)
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff20008d9c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008d98, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 11, {393, 
150961530}, ffffffff <unfinished ...>
[pid  4720] <... futex resumed> )       = 0
[pid  4720] futex(0xffff20008d60, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4720] write(9, "\336\306\0\0\0\4\0\0\0\0\304\250", 12) = 12
[pid  4720] futex(0xffff2000824c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008248, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4716] <... futex resumed> )       = 0
[pid  4720] futex(0xffff20008d9c, FUTEX_WAIT_PRIVATE, 5, NULL 
<unfinished ...>
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 13, {383, 
377427852}, ffffffff) = -1 ETIMEDOUT (Connection timed out)
[pid  4716] futex(0xffff20008210, FUTEX_WAKE_PRIVATE, 1) = 0
[pid  4716] futex(0xffff20008d9c, FUTEX_WAKE_OP_PRIVATE, 1, 1, 
0xffff20008d98, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = 1
[pid  4720] <... futex resumed> )       = 0
[pid  4716] futex(0xffff2000824c, FUTEX_WAIT_BITSET_PRIVATE, 15, {393, 
150762113}, ffffffff <unfinished ...>
[pid  4720] futex(0xffff20008d60, FUTEX_WAKE_PRIVATE, 1) = 0
...

[7]

 From 9a3c199f02cb66cb67e93e0824b03b622ab3b024 Mon Sep 17 00:00:00 2001
From: Dirk Behme <dirk.behme@de.bosch.com>
Date: Fri, 29 Mar 2019 06:39:31 +0100
Subject: [PATCH] serial: sh-sci: Enable debug output

Enable some debug output as requested by Geert in

https://patchwork.kernel.org/patch/10322809/#22554727

Change-Id: Icd2f97138516a0e40726fa1ccd50a69abb57cb76
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
  drivers/tty/serial/sh-sci.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index eba08cd892e5..32210cf2413c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2161,7 +2161,7 @@ static int sci_brg_calc(struct sci_port *s, 
unsigned int bps,
  			break;
  	}

-	dev_dbg(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
+	dev_info(s->port.dev, "BRG: %u%+d bps using DL %u SR %u\n", bps,
  		min_err, *dlr, *srr + 1);
  	return min_err;
  }
@@ -2376,7 +2376,7 @@ static void sci_set_termios(struct uart_port 
*port, struct ktermios *termios,

  done:
  	if (best_clk >= 0)
-		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
+		dev_info(port->dev, "Using clk %pC for %u%+d bps\n",
  			s->clks[best_clk], baud, min_err);

  	sci_port_enable(s);
-- 
2.20.0



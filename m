Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFE0C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 06:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB4372084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 06:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="QP02+LaI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731582AbfDAGFQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 02:05:16 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:50816 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfDAGFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 02:05:16 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44Xhdh1GXzz1XLFjJ;
        Mon,  1 Apr 2019 08:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1554098712;
        bh=WQzLc8ik3inJZMK5lCJ26mkvaboYo4pT75ge25HpFt4=; l=10;
        h=From:From:Reply-To:Sender;
        b=QP02+LaIe3EBpGGtaymifGjSfnAivgZ2tNvw6/mUj+urL7nR+KTGCDTcBZlkpy1pw
         O39QsrR8lP0+3kPcOc+uIqfw90t+z9ts0nOXP8A8Og+eCdjh9FpuQ4SZTozJZSda/y
         0OUSyMvcSN5sFTCE6JcwimhftkZgg1eqletuTZxE=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44Xhdh0jypz1RX;
        Mon,  1 Apr 2019 08:05:12 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-38-5ca1aa172994
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 95.68.32648.71AA1AC5; Mon,  1 Apr 2019 08:05:11 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44Xhdg4LPPz6CjZqj;
        Mon,  1 Apr 2019 08:05:11 +0200 (CEST)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5; Mon, 1 Apr 2019
 08:05:10 +0200
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
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
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
 <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
 <3dc6a66a-c057-af29-2a2e-c526a4d2a30a@de.bosch.com>
 <CAMuHMdXKkjqNzoXVezO9Do-0y70-+71OkYuXC_FFz-7cFeNmjA@mail.gmail.com>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <84efbc4c-aadc-0476-d030-384f25f11acc@de.bosch.com>
Date:   Mon, 1 Apr 2019 08:05:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXKkjqNzoXVezO9Do-0y70-+71OkYuXC_FFz-7cFeNmjA@mail.gmail.com>
Content-Type: multipart/mixed;
        boundary="------------9B89FBAD26E7CEB0F72C8DD9"
Content-Language: en-US
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA21Tf1AUZRjm29vj9g72XBaRt0NML5tpKAi0cjXHanKcwxqCchrGOctDFu4K
        7pi7gxHrDyDR48jABhjvAu7IH8hPEWiAHNQuUWAQMMZgiNAjIsCICBAbMdtlwWOa/nu+532f
        532/Z76PENF5UgWh05tZo16TpPSW4bIdNcGhgZVl6vCckVDGNlKOM5WPj2LM2GArxow+XhAz
        3c5TiLnW0Cdhvpn4A2O6Tp+QMHerpryZxVaLhLnpLMSZEwWvMBXtdtHrpMp+vEqiarH/LFFN
        uaNVru8tSHVpPgupOjpHcdVs/YZoyX7Zzng2SZfGGl/cdVCmrfxzEE8pfP/wPzMteAb6bK8V
        SQmgXgLHTKbYimQETR3H4NRf95BwuIDgbFGtt3A4h6CsrR3xEn8qFjJtnTiP11IfwMxC0ZJc
        RN0SQUNtl4gv0FQ1Dl/UvMljbyoEWvItEh6vocLAefmmmMck9RpM9H+9xOPUZnAfy1oaEECp
        ob2wUSL0+EGHbXRpmJSKgRtzzZgVEdywaDjT9wlPi6hAGBx1YMJ1NkHhT7l4PqLtq9R2j8K+
        SiFgBmyOHiTgp6FpqlgkYAMMT3++3LMJCnLdEsFGBwu/+wm0CW6VdP2nhQ8iA0HbdDnmRD6V
        KCCBDU9L3rY9ggkzxrGmI+ERYYcMyfVIeBFUM2rpTHAhikBKX5IqKVPTYk2aKT3ZhV4mMGUA
        2RHHUfI4Q3y6VmPSfmhMTWJNSgW5vnevmvZ/QptS45J1JpPOoHehzdwCI3VVvUiB6w16VrmW
        7MpzqmkyXpN+hDUaBAsXCiJwZSCZSLyjpqlEjZn9mGVTWONK9VWCUAIpL+eG+xnZRPZwgi7J
        vFJWBpPIy8uLXre6snoFjJC60FbCl5u9j7cgTSmaZJMucVn+lCCnV1iPtBNFEtPz7hIRMfXd
        byUieukGikDyLd6F4vu1qfoneyjWk16/lqrpgFUFj9ck6kdcqv7kRl7sy31FzwZABvEB+i2T
        HtGW05yGyt8AOeN7oDTLCLaCIQSlzfMI7NNDGNTm/4LBwNgkBsNdf3O/5eQiBrfvOkWQ3Z+P
        Q13THRwc1wvEUN1zXgyzE/fF8MO3dgks2i5JwOIalMB47yMCijOuSmF8uEcKD/tyZTB3sUjG
        md6XQXfuUR+Ytzp84EHGHR+4UmElwTHwgIQL96rlMHDsohzaR6/IJ7lwMS5cJtXBh2vWmP8n
        3GXWczdFBor6cnd2UPrlFx7WLZTNFruGnh/7sSYmJG13zK6q9wb903QNTdEBV88FvV2/w302
        pjGGsY5brrel7z+w2HjgjZ2RW75i3MHdz2jN9aR861ysJXb8RuLG1kPafR8d3L5toKPk3aLQ
        Z9dNfdopvR15Jir80exz17LXaBfO52VG0SetlRU5e5qVuEmriQgRGU2afwFny5s1IgUAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--------------9B89FBAD26E7CEB0F72C8DD9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 29.03.2019 14:00, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Fri, Mar 29, 2019 at 1:13 PM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 29.03.2019 10:46, Geert Uytterhoeven wrote:
>>> On Fri, Mar 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>>> On 28.03.2019 12:30, Dirk Behme wrote:
>>>>> On 28.03.2019 11:16, Dirk Behme wrote:
>>>>>> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
>>>>>>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com>
>>>>>>> wrote:
>>>>>>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and
>>>>>>>> the
>>>>>>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3],
>>>>>>>> which
>>>>>>>> mirrors v4.18-rc1 commit [4] in mainline.
>>>>>>>>
>>>>>>>> JFYI, quite far away in the delivery chain, we've received below
>>>>>>>> report:
>>>>>>>>
>>>>>>>>> With this patch [2-4] there are reports about broken data
>>>>>>>>> communication with 115200 baud with SXM module. Reverting
>>>>>>>>> this patch results in successful communication, again.
>>>>>>>>
>>>>>>>> While this scarce information barely helps anybody, I thought that
>>>>>>>> sharing it with you might be beneficial in case you collect several
>>>>>>>> reports linked to this specific commit in future, meaning it
>>>>>>>> potentially
>>>>>>>> adds a regression.
>>>>>>>>
>>>>>>>> Also, if you are aware of any userland changes that might be
>>>>>>>> required/assumed by this patch or in case you have any alternative
>>>>>>>> ideas how to avoid reverting this patch, your feedback would be very
>>>>>>>> appreciated.
>>>>>>>
>>>>>>> Thanks for your report!
>>>>>>>
>>>>>>> [TLDR: skip to the suggested fix below; I only noticed the bug after
>>>>>>>           writing the below paragraphs, which are still useful
>>>>>>> questions to
>>>>>>>           let us reproduce the issue]
>>>>>>>
>>>>>>> Which SoC are you using?
>>>>>>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
>>>>>>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
>>>>>>> hence the affected code path is not exercised:
>>>>>>>
>>>>>>>        sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
>>>>>>>        sh-sci e6550000.serial: Using clk scif for 115200+0 bps
>>>>>>>
>>>>>>> Does your board have an external SCIF clock? Which frequency?
>>>>>>> Can you check the clock values and deviation for your configuration, by
>>>>>>> changing the calls to print the above information from dev_dbg() to
>>>>>>> dev_info()?
>>>>>>>
>>>>>>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
>>>>>>> of the posted patch, help?
>>>>>>> Perhaps the sampling point shift is inverted? Does -shift work better?
>>>>>>>
>>>>>>> [possible solution]
>>>>>>>
>>>>>>>> +                               int shift = min(-8, max(7, deviation
>>>>>>>> / 2));
>>>>>>>
>>>>>>> Oops, min and max are exchanged!
>>>>>>>
>>>>>>> I guess using
>>>>>>>
>>>>>>>        int shift = clamp(deviation / 2, -8, 7)
>>>>>>>
>>>>>>> instead fixes the issue?
>>>>>>
>>>>>>
>>>>>> Uh, that was fast :) Many thanks!
>>>>>>
>>>>>> We will test this as fast as possible! But due to the long delivery
>>>>>> chain Eugeniu mentioned this will take some time. I'll try my best to
>>>>>> come back to you as fast as possible.
>>>>>
>>>>>
>>>>> Just for the archives: We are testing the attached patch.
>>>>
>>>>
>>>> * Testing the patch [5]
>>>>
>>>> - int shift = min(-8, max(7, deviation / 2));
>>>> + int shift = clamp(deviation / 2, -8, 7);
>>>>
>>>> does *not* fix our issue. Or in other words: Testing was *not* successful.
>>>
>>> I'm sorry to hear that.
>>>
>>>> * However, from review point of view we think that it fixes a serious
>>>> bug. So maybe it should be applied, anyhow?
>>>
>>> Yes, submitted.
>>>
>>>> * Using strace we managed to get some more information about the usage
>>>> of the serial port [6]. With this, we are talking about 57600 and not 115200
>>>>
>>>> * Switching to dev_info() [7] as requested above we get
>>>>
>>>> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41,
>>>> base_baud = 0) is a hscif
>>>> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
>>>> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
>>>> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
>>>> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps
> 
>> Do you have any idea what might be the difference between reverting
>> "serial: sh-sci: Support for HSCIF RX sampling point adjustment" (works)
>> and not reverting that (doesn't work for us), then?
> 
> Before that commit, the RX sampling point was not shifted.
> After that commit, it was incorrectly shifted by -8[*].
> With my fix, it is shifted by 7[*], to compensate for a clock rate that
> is slightly off.
> 
> [*] In units of cycles of the sampling clock, which runs at SR * 57595 =
>      575950 Hz.
> 
> However, doing the above calculation shows that's something wrong with
> the formula used by the driver: with SR = 10, the default sampling point
> at the center is at SR / 2 = 5, so the shift must be within [-4, +4], which
> is exceeded by using a  value of 7.
> 
>      deviation = min_err * srr * last_stop / 2 / baud;
> 
> With:
> 
>      min_err = -5
>      srr = 9
>      last_stop = 19
>      baud = 57600
> 
> Note that srr and baud are unsigned.  Hence the multiplication and
> divisions are done in unsigned arithmetic, and we get deviation = 37282
> instead of 0. Oops...
> 
> Fixed by:
> 
> -                       int deviation = min_err * srr * last_stop / 2 / baud;
> +                       int deviation = (int)(min_err * srr * last_stop) / 2 /
> +                                       (int)baud;
> 
> Before I sent a patch: Uli, shouldn't the formula use "(srr + 1)"
> instead of "srr", as the actual sampling rate factor is one more than
> the value programmed in HSSRR.SRCYC?


Using both attached patches together our tests have been *successful*, 
now. :)

Many thanks!

Best regards

Dirk

--------------9B89FBAD26E7CEB0F72C8DD9
Content-Type: text/plain; charset="UTF-8";
	name="0002-serial-sh-sci-Fix-HSCIF-RX-deviation-calculation.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="0002-serial-sh-sci-Fix-HSCIF-RX-deviation-calculation.patch"

RnJvbSBlYWM5OGEzMWMzZjY1NGFjMmU3ZDZkNzdkY2M2NDhkNGE1MDRjMWE1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPgpEYXRlOiBNb24sIDEgQXByIDIwMTkgMDY6MzA6MDQgKzAyMDAKU3Vi
amVjdDogW1BBVENIIDIvMl0gc2VyaWFsOiBzaC1zY2k6IEZpeCBIU0NJRiBSWCBkZXZpYXRp
b24gY2FsY3VsYXRpb24KCkRvaW5nIHRoZSBkZXZpYXRpb24gY2FsY3VsYXRpb24gbWFudWFs
bHkgc2hvd3MgdGhhdCdzIHNvbWV0aGluZyB3cm9uZyB3aXRoCnRoZSBmb3JtdWxhIHVzZWQg
YnkgdGhlIGRyaXZlcjogd2l0aCBTUiA9IDEwLCB0aGUgZGVmYXVsdCBzYW1wbGluZyBwb2lu
dAphdCB0aGUgY2VudGVyIGlzIGF0IFNSIC8gMiA9IDUsIHNvIHRoZSBzaGlmdCBtdXN0IGJl
IHdpdGhpbiBbLTQsICs0XSwgd2hpY2gKaXMgZXhjZWVkZWQgYnkgdXNpbmcgYSB2YWx1ZSBv
ZiA3LgoKICAgIGRldmlhdGlvbiA9IG1pbl9lcnIgKiBzcnIgKiBsYXN0X3N0b3AgLyAyIC8g
YmF1ZDsKCldpdGg6CgogICAgbWluX2VyciA9IC01CiAgICBzcnIgPSA5CiAgICBsYXN0X3N0
b3AgPSAxOQogICAgYmF1ZCA9IDU3NjAwCgpOb3RlIHRoYXQgc3JyIGFuZCBiYXVkIGFyZSB1
bnNpZ25lZC4gIEhlbmNlIHRoZSBtdWx0aXBsaWNhdGlvbiBhbmQKZGl2aXNpb25zIGFyZSBk
b25lIGluIHVuc2lnbmVkIGFyaXRobWV0aWMsIGFuZCB3ZSBnZXQgZGV2aWF0aW9uID0gMzcy
ODIKaW5zdGVhZCBvZiAwLiBGaXggdGhpcy4KCkFkZGl0aW9uYWxseSwgdXNlICIoc3JyICsg
MSkiIGluc3RlYWQgb2YgInNyciIsIGFzIHRoZSBhY3R1YWwgc2FtcGxpbmcKcmF0ZSBmYWN0
b3IgaXMgb25lIG1vcmUgdGhhbiB0aGUgdmFsdWUgcHJvZ3JhbW1lZCBpbiBIU1NSUi5TUkNZ
Qy4KCkZpeGVzOiA2M2JhMWUwMGYxNzhhNDQ4ICgic2VyaWFsOiBzaC1zY2k6IFN1cHBvcnQg
Zm9yIEhTQ0lGIFJYIHNhbXBsaW5nIHBvaW50IGFkanVzdG1lbnQiKQpTaWduZWQtb2ZmLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgotLS0KIGRy
aXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkv
c2VyaWFsL3NoLXNjaS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jCmluZGV4IDY5
ODk2ZDU4NmEyOS4uOTcxYTJkZWU0ZDFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvc2gtc2NpLmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jCkBAIC0yNDM5
LDcgKzI0MzksOCBAQCBzdGF0aWMgdm9pZCBzY2lfc2V0X3Rlcm1pb3Moc3RydWN0IHVhcnRf
cG9ydCAqcG9ydCwgc3RydWN0IGt0ZXJtaW9zICp0ZXJtaW9zLAogCQkJICogY2VudGVyIG9m
IHRoZSBsYXN0IHN0b3AgYml0IGluIHNhbXBsaW5nIGNsb2Nrcy4KIAkJCSAqLwogCQkJaW50
IGxhc3Rfc3RvcCA9IGJpdHMgKiAyIC0gMTsKLQkJCWludCBkZXZpYXRpb24gPSBtaW5fZXJy
ICogc3JyICogbGFzdF9zdG9wIC8gMiAvIGJhdWQ7CisJCQlpbnQgZGV2aWF0aW9uID0gKGlu
dCkobWluX2VyciAqIChzcnIgKyAxKSAqIGxhc3Rfc3RvcCkgLworCQkJCQkyIC8gKGludCli
YXVkOwogCiAJCQlpZiAoYWJzKGRldmlhdGlvbikgPj0gMikgewogCQkJCS8qIEF0IGxlYXN0
IHR3byBzYW1wbGluZyBjbG9ja3Mgb2ZmIGF0IHRoZQotLSAKMi4yMC4wCgo=
--------------9B89FBAD26E7CEB0F72C8DD9
Content-Type: text/plain; charset="UTF-8";
	name="0001-serial-sh-sci-Fix-HSCIF-RX-sampling-point-adjustment.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-serial-sh-sci-Fix-HSCIF-RX-sampling-point-adjustment.pa";
	filename*1="tch"

RnJvbSBhNmQ4YjM3ZGFlNmVlODYyMTAwMjgwNGNhNzg0MWM5MTNiNTQ0ODNiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPgpEYXRlOiBGcmksIDI5IE1hciAyMDE5IDEwOjEwOjI2ICswMTAwClN1
YmplY3Q6IFtQQVRDSCAxLzJdIHNlcmlhbDogc2gtc2NpOiBGaXggSFNDSUYgUlggc2FtcGxp
bmcgcG9pbnQgYWRqdXN0bWVudAoKVGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBzYW1wbGluZyBw
b2ludCBoYXMgbWluKCkgYW5kIG1heCgpIGV4Y2hhbmdlZC4KRml4IHRoaXMgYnkgdXNpbmcg
dGhlIGNsYW1wKCkgaGVscGVyIGluc3RlYWQuCgpGaXhlczogNjNiYTFlMDBmMTc4YTQ0OCAo
InNlcmlhbDogc2gtc2NpOiBTdXBwb3J0IGZvciBIU0NJRiBSWCBzYW1wbGluZyBwb2ludCBh
ZGp1c3RtZW50IikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMgYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2gtc2NpLmMKaW5kZXggZWJhMDhjZDg5MmU1Li42OTg5NmQ1ODZhMjkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYworKysgYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2gtc2NpLmMKQEAgLTI0NDYsNyArMjQ0Niw3IEBAIHN0YXRpYyB2b2lkIHNjaV9z
ZXRfdGVybWlvcyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCBzdHJ1Y3Qga3Rlcm1pb3MgKnRl
cm1pb3MsCiAJCQkJICogbGFzdCBzdG9wIGJpdDsgd2UgY2FuIGluY3JlYXNlIHRoZSBlcnJv
cgogCQkJCSAqIG1hcmdpbiBieSBzaGlmdGluZyB0aGUgc2FtcGxpbmcgcG9pbnQuCiAJCQkJ
ICovCi0JCQkJaW50IHNoaWZ0ID0gbWluKC04LCBtYXgoNywgZGV2aWF0aW9uIC8gMikpOwor
CQkJCWludCBzaGlmdCA9IGNsYW1wKGRldmlhdGlvbiAvIDIsIC04LCA3KTsKIAogCQkJCWhz
c3JyIHw9IChzaGlmdCA8PCBIU0NJRl9TUkhQX1NISUZUKSAmCiAJCQkJCSBIU0NJRl9TUkhQ
X01BU0s7Ci0tIAoyLjIwLjAKCg==
--------------9B89FBAD26E7CEB0F72C8DD9--

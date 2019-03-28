Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B86EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 11:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E1182075E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 11:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ZLKhIr+r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfC1Laq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 07:30:46 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:57998 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfC1Laq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 07:30:46 -0400
X-Greylist: delayed 4432 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Mar 2019 07:30:45 EDT
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 44VN381Pl7z1XLDR5;
        Thu, 28 Mar 2019 12:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1553772644;
        bh=WQzLc8ik3inJZMK5lCJ26mkvaboYo4pT75ge25HpFt4=; l=10;
        h=From:From:Reply-To:Sender;
        b=ZLKhIr+rg9Ixqw5eQSRqaa4M5uSm4YBTIfElIBf79jKzRdfqpnYSg15FGXWJvnDvf
         OVgfRRNxQrtdSi1ZRivi+EBOBtuh8smD6xrtpVgFc4wpUGJbKn51dDO//XqMLLEMRi
         AP4wt5M8Xmb8dm9+51NEy/wVnEBNdht07Smfi9i4=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44VN380sqxz1yd;
        Thu, 28 Mar 2019 12:30:44 +0100 (CET)
X-AuditID: 0a3aad17-5bfff70000001fa9-27-5c9cb063a23f
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id A5.AE.08105.360BC9C5; Thu, 28 Mar 2019 12:30:43 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 44VN375N9pzVv0;
        Thu, 28 Mar 2019 12:30:43 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1713.5; Thu, 28 Mar 2019
 12:30:43 +0100
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
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
Date:   Thu, 28 Mar 2019 12:30:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
Content-Type: multipart/mixed;
        boundary="------------D97480390D6C49C993F52033"
Content-Language: en-US
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Ta0xbdRjG+Z+e0kPhjMOBru/KxVBFk5khG7KcOaOLxqTsixiN7tJklnEG
        jW2BHiCDEAUGG0JIcAMd5VLYjdsosA0Blw3XDQXC1QuOMsdlDQQUSBxV0AqeQ2H0g9+ePO/7
        e8/7Pv8cQkT/TigIrSGFNRo0OqWnFJe+1hS852RLhTqiJjuKKZuuxZmG9VyMmbHdwRj7+l9i
        ZrD6ImIe3PxRwrTNLWJM/+UiCTPZuODJOO/kS5iB6lKcKSrZz9T3mESHSJXpXKNE1Wn6VaJa
        mIpRWe/nI9VtRw5S9fbZcdXTGyExkmPS1+NYnTaNNb7yxsfShPM5byW1vXS6uPq6OAtdVhYg
        ggDqVZi5G1aAvAiaOovBv0NHCpCU17cRWBfPYq5CLYLfxjIF7U8dgeyyPlzQAdSH0OysQgIg
        osZE0P5LnqeLdiLo+mEECV2e1G7oLM6XCNqXCofquwNiQZPUm3CmsMlT0DgVBmu2vI2pMkoN
        PaW3JK4eP+gts2/4XtQhqHd0bWwkomLg1sg1iUvLwWY3b/hAhULpeCFejGiTG25yQ0xuiEsz
        UGYeQi79HJxpKxe5NAcjlf2bPaFQUjjFs8KhWQi6l2qxakQ0IBmnjUjT74tgIsONsSyXEbE3
        /GSi/gZyvba8A9WOnrIiikBKH7K7rkJNizVpXLreiqIITCkj1Xm8tSM2MS49QcMlnDCm6lhO
        qSCDhg+raf9nNpcaq9dynDbRYEUv8AtMtzQOIwVuSDSwygDSVs/PIOM06RmsMdE1wooCCVwp
        J+OJd9U0Fa9JYT9h2STWuFU9SBBKIKctPOhnZOPZ06e0upStsjKYRB4eHvRO94r7ChjhZUWR
        hA//7XJhBMklafScNn4T3+XC6S13G+1D0cSSY6pSRCzcm60U0RsXKOTkpWZ+CiX0J6Qanu2h
        CCJ1SyY1LXMrbM+aRw8Rn6o/2SjAPvxvtr0BkIFCgH6b5ja07wrPUDZfeLymh6oOBwLT0iMM
        LMVPMHjcv4pBS/sEDubvSsRwfahODE/n/hRDV1mTBJZbv5TC2qVxKQwW5nqDo8DsDStZE95g
        frhCwvma4R2w0n/PF8YHRymoa/3HDxw5EzL4/MHkTvi7e1gOV6t6AOyO8V1gKp0OhIvOySDo
        +soZBBPr3wfDqnkoGGxzvSGwcmUtZJ5PF+PTnf+sXEg3RZPyP+luutvHKbKQ/I8LbQ2dOu/G
        Uud0y4HiA/j+MerJ1RPL+ZawNUfq+/f3VBRlazK/TT6YVvDiT/rQjpij7QNfzzkufDMa/WlN
        ZPzxRZl9OWqs83hNRvKxDywwbrn2hern1bfZVu+Zm7PvvDdVGYo3pyf7W2SZ0b6Oc0lBHwUc
        zX1+9hFt7HcueCy+bFLiXIJm726RkdP8BwIzw1f/BAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--------------D97480390D6C49C993F52033
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 28.03.2019 11:16, Dirk Behme wrote:
> Hi Geert,
> 
> On 28.03.2019 10:24, Geert Uytterhoeven wrote:
>> Hi Eugeniu,
>>
>> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com> 
>> wrote:
>>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and the
>>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3], which
>>> mirrors v4.18-rc1 commit [4] in mainline.
>>>
>>> JFYI, quite far away in the delivery chain, we've received below report:
>>>
>>>> With this patch [2-4] there are reports about broken data
>>>> communication with 115200 baud with SXM module. Reverting
>>>> this patch results in successful communication, again.
>>>
>>> While this scarce information barely helps anybody, I thought that
>>> sharing it with you might be beneficial in case you collect several
>>> reports linked to this specific commit in future, meaning it potentially
>>> adds a regression.
>>>
>>> Also, if you are aware of any userland changes that might be
>>> required/assumed by this patch or in case you have any alternative
>>> ideas how to avoid reverting this patch, your feedback would be very
>>> appreciated.
>>
>> Thanks for your report!
>>
>> [TLDR: skip to the suggested fix below; I only noticed the bug after
>>         writing the below paragraphs, which are still useful questions to
>>         let us reproduce the issue]
>>
>> Which SoC are you using?
>> I assume this is on a custom board, as Salvator-X(S) and ULCB have
>> external SCIF clock crystals, which allow to use a perfect 115200 bps,
>> hence the affected code path is not exercised:
>>
>>      sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
>>      sh-sci e6550000.serial: Using clk scif for 115200+0 bps
>>
>> Does your board have an external SCIF clock? Which frequency?
>> Can you check the clock values and deviation for your configuration, by
>> changing the calls to print the above information from dev_dbg() to
>> dev_info()?
>>
>> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
>> of the posted patch, help?
>> Perhaps the sampling point shift is inverted? Does -shift work better?
>>
>> [possible solution]
>>
>>> +                               int shift = min(-8, max(7, deviation 
>>> / 2));
>>
>> Oops, min and max are exchanged!
>>
>> I guess using
>>
>>      int shift = clamp(deviation / 2, -8, 7)
>>
>> instead fixes the issue?
> 
> 
> Uh, that was fast :) Many thanks!
> 
> We will test this as fast as possible! But due to the long delivery 
> chain Eugeniu mentioned this will take some time. I'll try my best to 
> come back to you as fast as possible.


Just for the archives: We are testing the attached patch.


Best regards

Dirk




--------------D97480390D6C49C993F52033
Content-Type: text/plain; charset="UTF-8";
	name="0001-serial-sh-sci-Fix-HSCIF-RX-sampling-point-adjustment.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-serial-sh-sci-Fix-HSCIF-RX-sampling-point-adjustment.pa";
	filename*1="tch"

RnJvbSAzMmNkZTg1MmEwM2ZhN2ZiYjQ1MGQ1NjY1Nzg1YjFmZjM5MGQzODY3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgpEYXRlOiBUaHUsIDI4IE1hciAyMDE5IDEyOjEwOjU4ICswMTAwClN1Ympl
Y3Q6IFtQQVRDSF0gc2VyaWFsOiBzaC1zY2k6IEZpeCBIU0NJRiBSWCBzYW1wbGluZyBwb2lu
dCBhZGp1c3RtZW50CgpJbiBjb21taXQgNjNiYTFlMDBmMTc4ICgic2VyaWFsOiBzaC1zY2k6
IFN1cHBvcnQgZm9yIEhTQ0lGIFJYIHNhbXBsaW5nCnBvaW50IGFkanVzdG1lbnQiKSBtaW4g
YW5kIG1heCBhcmUgZXhjaGFuZ2VkLiBGaXggdGhpcy4KCkZpeGVzOiAJNjNiYTFlMDBmMTc4
ICgic2VyaWFsOiBzaC1zY2k6IFN1cHBvcnQgZm9yIEhTQ0lGIFJYIHNhbXBsaW5nIHBvaW50
IGFkanVzdG1lbnQiKQpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjQuMTgrClNp
Z25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
ClNpZ25lZC1vZmYtYnk6IERpcmsgQmVobWUgPGRpcmsuYmVobWVAZGUuYm9zY2guY29tPgot
LS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L3NlcmlhbC9zaC1zY2kuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYwppbmRl
eCBlYmEwOGNkODkyZTUuLjY5ODk2ZDU4NmEyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkv
c2VyaWFsL3NoLXNjaS5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYwpAQCAt
MjQ0Niw3ICsyNDQ2LDcgQEAgc3RhdGljIHZvaWQgc2NpX3NldF90ZXJtaW9zKHN0cnVjdCB1
YXJ0X3BvcnQgKnBvcnQsIHN0cnVjdCBrdGVybWlvcyAqdGVybWlvcywKIAkJCQkgKiBsYXN0
IHN0b3AgYml0OyB3ZSBjYW4gaW5jcmVhc2UgdGhlIGVycm9yCiAJCQkJICogbWFyZ2luIGJ5
IHNoaWZ0aW5nIHRoZSBzYW1wbGluZyBwb2ludC4KIAkJCQkgKi8KLQkJCQlpbnQgc2hpZnQg
PSBtaW4oLTgsIG1heCg3LCBkZXZpYXRpb24gLyAyKSk7CisJCQkJaW50IHNoaWZ0ID0gY2xh
bXAoZGV2aWF0aW9uIC8gMiwgLTgsIDcpOwogCiAJCQkJaHNzcnIgfD0gKHNoaWZ0IDw8IEhT
Q0lGX1NSSFBfU0hJRlQpICYKIAkJCQkJIEhTQ0lGX1NSSFBfTUFTSzsKLS0gCjIuMjAuMAoK

--------------D97480390D6C49C993F52033--

Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1176C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 11:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13F65206C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 11:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Iqwrx4SZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbfC2LRP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 07:17:15 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:33448 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbfC2LRP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 07:17:15 -0400
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 44Vzj45S1Sz1XLDQw;
        Fri, 29 Mar 2019 12:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1553858232;
        bh=y2b7Vc4S9Xj0saASRHX0tCniXUHjUyfcXNFDmB3dM3k=; l=10;
        h=From:From:Reply-To:Sender;
        b=Iqwrx4SZFBTY7i0clGRQlLnNCrkGeZt2jq0ffP4XIgQPGCSE6ZlDxbfbpS4pxx60g
         A+6GdEshfpID6rNZzgbHMc7X4O1/VJWue256i1D3wXB2XiyDbhY031yiq5O3VCdvXv
         HAUhqd9vvW4fZ1etsJsogu7GRiDVy9bm1ki44yWs=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 44Vzj44yDbz1V9;
        Fri, 29 Mar 2019 12:17:12 +0100 (CET)
X-AuditID: 0a3aad0c-d19ff700000039d6-1a-5c9dfeb89913
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 8E.59.14806.8BEFD9C5; Fri, 29 Mar 2019 12:17:12 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 44Vzj41zQQzVv1;
        Fri, 29 Mar 2019 12:17:12 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5; Fri, 29 Mar 2019
 12:17:11 +0100
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
To:     Ulrich Hecht <uli@fpond.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
 <1244832967.1529522.1553852778122@webmail.strato.com>
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <9622ca2c-434e-1ce4-4c34-6e6ad314687a@de.bosch.com>
Date:   Fri, 29 Mar 2019 12:17:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1244832967.1529522.1553852778122@webmail.strato.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf0wTZxjHeXvX3tH1ylF+PVa7SbeFjW1YKmWnEzHbTDr3x/hjJotrNg85
        oVsppAdMWHRomEKVlSAs0oFANucASSaUUEaUrMACTNFEF0V+KKy6ilSTESIEC+tRkP6x/577
        fp/P89z7ffOSmKKXVJJGcx5nMbMmtUSKS7e3qt5yLtUZNOWXNzA1U+dxpnm5RMQ8uHNJxLiX
        n4qZ4YYziOlrv0EwHQ8fi5grP5YTzL0Wr4R5dqmUYK42VOPMkHtYwpRXJTNNA3Zsl1xvP9FC
        6AeXzhD6Lvs4ofdOpuldvaVI3z13DOkHh9y4frbtxTRyn3RHBmcyFnCWLTv3S7PK/pkR5d4N
        O3S8bwoVo1aZFYWSQCfBTGun2IqkpII+IQLb0U4kGAq6G8GELS1gnEcwXvWzRDAi6E/gaM0Q
        bkUkGUnzYF0ihB6MHsGg89a3kgDQ4P84+3gFkNDx0FVRSgh1GJ0ADZevioWaolPhl+8qV3pw
        +lWobBlf6YmiDTBQ7SACPeEwWOPGhTqUfhfavneu6BjNQE39NRSoY+COu14UqF+CTm8tFjha
        LFSPnsQrUIQ9aJQ9CLcH4fYgvAHhzSj6IKcpyNZot2k0CZZ0ji/SJCYcyMluQ4FblTlR/0+Z
        LkSTSC2jjvxdZ1CI2QK+MNuFdKRIHUVNzfsleXpORmEWy2d9bsk3cbxaSW26vsegiHgu8/np
        2UaeN+aYXQhITB1JGWb9HJXBFhZxlpwA5kIbSVwdQ2WSHxkUdCabx33JcbmcZc19hyTVQOX7
        /GC4hcvkDh00mvLWbLWKQiEhIYroYCd4rYgMdaGtpMy/e68wguJz2WzemLmKbwjgijV1HR1C
        75FP5ibrMAVuzjFzyhiqSuBpoTMr3/z8D5SbKNMTu0ERFWSsT5lGI8ifYQRVKcAy/+NZ3w3U
        RiGu8FVxHdKe8zO0MxRqqsYQeK77SPBMXAuFxRsnpVD5tPYFWO6dl8Ht4xflMODukcPZdkcY
        VDc1RkJZ371oaLT5lOApsaqgZ/Z+LDgdLjX8eWzyZZhz2OJg9t9bcTDT7n0Nbg6feh3aRive
        AM9YYwKUOX7VwM1zNi10N/dshdlyX5IwRQenO5w6qC3u1sHDZ6M6WLh/m4GehcXt0/5gRf5g
        p7/5QQg2j837n2BX1fXTKYvRzuSi09q/+gnVqd2qt1k5nvIo6ciWV1Lik0qSD/gWlJvDplJH
        tImHR8Ym/yjsyC3b6/jKOu/LKGBR9ZUvxO8bRifM28Sjcf37W/Z9nRztjX1ku9A0XfzmovlB
        xO7fP/7Q1R11sT4ldeyuvuSwB/ssjpB+OtDRFSf6gMnYI9nx22bqghrns9jEeMzCs/8B5jwe
        WNYEAAA=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29.03.2019 10:46, Ulrich Hecht wrote:
> 
>> On March 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>
>>
>> Hi Geert,
>>
>> On 28.03.2019 12:30, Dirk Behme wrote:
>>> On 28.03.2019 11:16, Dirk Behme wrote:
>> * Testing the patch [5]
>>
>> - int shift = min(-8, max(7, deviation / 2));
>> + int shift = clamp(deviation / 2, -8, 7);
>>
>> does *not* fix our issue. Or in other words: Testing was *not* successful.
>>
>> * However, from review point of view we think that it fixes a serious
>> bug. So maybe it should be applied, anyhow?
> 
> It should.
> 
>>
>> * Using strace we managed to get some more information about the usage
>> of the serial port [6]. With this, we are talking about 57600 and not 115200
>>
>> * Switching to dev_info() [7] as requested above we get
>>
>> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41,
>> base_baud = 0) is a hscif
>> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
>> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
>> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
>> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps
>>
>> * We are talking about a custom r8a7796 board
> 
> Reviewing the code, I have found another potential issue: the SRR (sampling rate) value is not validated; only values from 7 to 31 are permissible, according to the datasheet. The values in the debug output above would be fine, though.
> 
> So, for clarification: Is there a problem at 9600/57600 bps, or does it only occur at 115200 bps?


The 115200 bps in the initial report was wrong (sorry!). Looking at the 
strace output provided to my understanding the issue happens with 57600 
bps (it somehow starts with 9600 bps and switches to 57600 bps, then). I 
have to think about 115200 bps as currently we have only a precompiled 
binary to test with (the one the strace is from).

Best regards

Dirk




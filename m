Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDC9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 10:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50B7E20811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 10:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="vVKyOlgy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfC1KQz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 06:16:55 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:45206 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfC1KQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 06:16:55 -0400
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44VLPv4kb2z1XLFjm;
        Thu, 28 Mar 2019 11:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1553768211;
        bh=xSzlTI5ByBzxomol2l57PFqBuDQF9cj7yVZ+PcN0FhE=; l=10;
        h=From:From:Reply-To:Sender;
        b=vVKyOlgy+IDRcIdQ34C7cqb18dUQO7yIyKVVcwlaguwyLsayn0U4DBlIorsiMOYNT
         RveOVkBawyNgWpzWA/Dv8m+CIf/4KkCFl0D0Vejn/1+Pf3IxG8wveKoSdspSDBYBfq
         18EzRYERFHpacIil9sdLGmATDW68P4wgcYOiEEFA=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44VLPv4Kz6z6CjTF7;
        Thu, 28 Mar 2019 11:16:51 +0100 (CET)
X-AuditID: 0a3aad0c-d19ff700000039d6-9c-5c9c9f137dbf
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 83.32.14806.31F9C9C5; Thu, 28 Mar 2019 11:16:51 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 44VLPv07cLz522;
        Thu, 28 Mar 2019 11:16:51 +0100 (CET)
Received: from [10.34.221.161] (10.34.221.161) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5; Thu, 28 Mar 2019
 11:16:37 +0100
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
From:   Dirk Behme <dirk.behme@de.bosch.com>
Organization: Robert Bosch Car Multimedia GmbH
Message-ID: <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
Date:   Thu, 28 Mar 2019 11:16:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.221.161]
X-Brightmail-Tracker: H4sIAAAAAAAAA22TfUwbdRjH+d0d9CgcHOWlD+VtNBoTErGbLzk3dSbGpBoTcYmLmTWjwI12
        tgV7gDCj4gDHqwEzxnqWtYsw2NDpXrBg3YYVEAgDEjJlvAy21RkQRnCrvFWwR2H0D/+5fH/f
        5/k8z/2+lyNxiZ2UkVpDDms0qHXyADEh3v1t3JPhFrNKMWoTM6Y7TQRzbr0YY+6NXsEY5/qi
        PzNgPYmYzkvDIqZ1+j7G9H9dJWKmWuYCGPeVUhFz3VpLMFXHn2PO9vD4y5SSP9YiUrbzEyLl
        3O0UpeOXUqS0u44iZW+fk1A+uBifIjogfiGD1WnzWONTL6WKNSV2F559NiL/cvMqUYhuhJaj
        QBLoZ+CLlaGAciQmJfQxDGoWKjcPdgTF9iLce2hCMNx5nxCQcPod+MzUt6Ej6P3wnfsUEppw
        +iYOtt9LNvFuBNaRWSR0BdBJ0F5dKhJ0KJ0M1qvX/QVN0Xvh1k+luKAJ+nFYdndsTI2kVdBT
        e1nk7QmDXpNzww+k3wLL+A8b/TjNgMkyiLxaCqNOC+bVCWCbM+PeyyVC7VgFUY3CeZ9RvA/O
        ++C8D25FxDkUdYhV5OkVu55XKJKNaSx3RLEzOT1LfxF5v2ZwG+pqyHQgmkTyYGq20qyS+Kvz
        uAK9Az1LYvJISlXisULSsjIKNGpOc9CYq2M5uYyKHXpdJQl/ZHO5aXotx2mzDA4EJC6PoCZq
        PByVoS44whqzvJgDxZCEXEplkm+qJHSmOod9n2WzWeNWdQ9JyoHqMHvAMCObyeYf0upytsry
        OAr5+flJonwrvmsxMtCBniaDPbvX6oXdXLZaz2kzN/FoLy7ZcrfRPvQKOe+6XY9LCEOWgZVJ
        qc8FnhY6NbmGR28gi6V087xKEulT2J4yg24iT4bh1McCHOz5abZ3AxUjxBW2aW5Duxo9DH2X
        An5+HIPz1XcxuNW/jMH3tkkCLN3H/eGbwWZ/eDD9j+cxWiOChxdOiGGgojgIlgong8AyskTB
        l6eHQmCp/+dQGBv4jQbX0clIKOucioKVriEpNJ7qAXC6xqKBr70TAyfdU7Fwrc4dC5Prv8bB
        smUwDkane+NhqWEtHmaHyxNgpKMuAdrMRYkwXl+VCMWNbvmMJ1jME+zMp18Jweaoc/4n2E13
        +3ayQtSQV2b96IDsw/bBCkvvH93SfK3f3ife0JcVLuxoLu09mPr2u7o/e/ZdfW0gAZmKH97b
        kZHaVlZ+WBLyGL/4qv5akc3Gr6y2vjjEL2fXd6QvVN4wrqb//d6FE+bTTX917g5O2nOmbm1p
        oCu72i9oX0v6paAfF1POayZaGw5T/35gln5SEy0nOI16ZxJu5NT/ARiiOCLOBAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 28.03.2019 10:24, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> On Wed, Mar 27, 2019 at 7:36 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
>> We've recently switched from rcar-3.7.x to rcar-3.9.x [1] kernel and the
>> latter contains this patch [2] by virtue of rcar-3.9.0 commit [3], which
>> mirrors v4.18-rc1 commit [4] in mainline.
>>
>> JFYI, quite far away in the delivery chain, we've received below report:
>>
>>> With this patch [2-4] there are reports about broken data
>>> communication with 115200 baud with SXM module. Reverting
>>> this patch results in successful communication, again.
>>
>> While this scarce information barely helps anybody, I thought that
>> sharing it with you might be beneficial in case you collect several
>> reports linked to this specific commit in future, meaning it potentially
>> adds a regression.
>>
>> Also, if you are aware of any userland changes that might be
>> required/assumed by this patch or in case you have any alternative
>> ideas how to avoid reverting this patch, your feedback would be very
>> appreciated.
> 
> Thanks for your report!
> 
> [TLDR: skip to the suggested fix below; I only noticed the bug after
>         writing the below paragraphs, which are still useful questions to
>         let us reproduce the issue]
> 
> Which SoC are you using?
> I assume this is on a custom board, as Salvator-X(S) and ULCB have
> external SCIF clock crystals, which allow to use a perfect 115200 bps,
> hence the affected code path is not exercised:
> 
>      sh-sci e6550000.serial: BRG: 115200+0 bps using DL 4 SR 32
>      sh-sci e6550000.serial: Using clk scif for 115200+0 bps
> 
> Does your board have an external SCIF clock? Which frequency?
> Can you check the clock values and deviation for your configuration, by
> changing the calls to print the above information from dev_dbg() to
> dev_info()?
> 
> Does adding the DIV_ROUND_CLOSEST(), as suggested in my review
> of the posted patch, help?
> Perhaps the sampling point shift is inverted? Does -shift work better?
> 
> [possible solution]
> 
>> +                               int shift = min(-8, max(7, deviation / 2));
> 
> Oops, min and max are exchanged!
> 
> I guess using
> 
>      int shift = clamp(deviation / 2, -8, 7)
> 
> instead fixes the issue?


Uh, that was fast :) Many thanks!

We will test this as fast as possible! But due to the long delivery 
chain Eugeniu mentioned this will take some time. I'll try my best to 
come back to you as fast as possible.

Thanks again!

Dirk


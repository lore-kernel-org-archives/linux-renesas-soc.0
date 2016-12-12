Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo2.mail-out.ovh.net ([178.32.228.2]:60883 "EHLO
        mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbcLLSUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 13:20:17 -0500
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id DC887149A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 19:12:05 +0100 (CET)
Subject: Re: [PATCH] iio: Add Maxim MAX11100 driver
To: Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
References: <1481041823-18382-1-git-send-email-jacopo@jmondi.org>
 <alpine.DEB.2.02.1612062143480.10644@pmeerw.net>
 <adc93632-e487-0251-1d27-a56e9215e9f6@jmondi.org>
 <b9a7ac4d-4c48-b540-bfe9-91529567371a@kernel.org>
Cc: wsa+renesas@sang-engineering.com, magnus.damm@gmail.com,
        knaack.h@gmx.de, lars@metafoo.de, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: "jacopo@jmondi.org" <jacopo@jmondi.org>
Message-ID: <c18d166c-b6f1-0c69-7616-289da4f9c3c9@jmondi.org>
Date: Mon, 12 Dec 2016 19:11:54 +0100
MIME-Version: 1.0
In-Reply-To: <b9a7ac4d-4c48-b540-bfe9-91529567371a@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jonathan,

On 10/12/2016 19:04, Jonathan Cameron wrote:
> On 07/12/16 08:29, jacopo@jmondi.org wrote:
>>

  [snip]

>> This driver is so minimal, I wonder if there are not drivers for
>> similar devices to which I can add support for MAX11100 instead of
>> writing a new one from scratch. Anyone with more expertise than me in
>> IIO codebase maybe can suggest something here...
> Could possibly blugeon it into the ad7476 code, but it wouldn't be pretty...
> Some of the SPI TI parts perhaps, but again you'll end up with a fair refactoring of
> the existing drivers to get it in.
>
> Seems simple I agree, but somehow there are an awful lot of simple ways to interface
> and ADC via a couple of spi transfers!

Yes there are :)
I'll continue trying to submit this driver alone then as it seems 
merging with existing ones is not feasible at this time!

Thanks
    j


>
> Jonathan
>> Thanks
>>    j
>>
>>
>

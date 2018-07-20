Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44099 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbeGTLxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 07:53:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id q127-v6so10794636ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 04:06:10 -0700 (PDT)
Subject: Re: [PATCH/RFC 02/02] ravb: Clean up duplex handling
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200107566.13504.725250500519176904.sendpatchset@little-apple>
 <8dc5f9e6-2572-4223-42d3-3928a69f989b@cogentembedded.com>
 <CANqRtoRyUV9D1qj0wjtkRntATZvLMX6q7ctmV9CFHRodi_PRRQ@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <33e70d5e-9a5c-10ec-7b89-dadd8e14f54f@cogentembedded.com>
Date: Fri, 20 Jul 2018 14:06:07 +0300
MIME-Version: 1.0
In-Reply-To: <CANqRtoRyUV9D1qj0wjtkRntATZvLMX6q7ctmV9CFHRodi_PRRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/19/2018 08:30 PM, Magnus Damm wrote:

>>> From: Magnus Damm <damm+renesas@opensource.se>
>>>
>>> Since only full-duplex operation is supported by the
>>> hardware, remove duplex handling code and keep the
>>> register setting of ECMR.DM fixed at 1.
>>>
>>> This updates the driver implementation to follow the
>>> data sheet text "This bit should always be set to 1."
>>>
>>> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>>
>>    Sounds like a fix, please provide a Fixes: tag (I think we're fixing
>> the initial driver commit here).
> 
> Yeah it is a fix if you consider not following the data sheet a bug.

   Trying to support a non-working feature seems to be a bug...

> The same applies to the first patch but it fixes the issue that we
> don't setup the PHY correctly.

   Yes.

>> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks!

   My duty as the official reviewer. :-)

[...]

MBR, Sergei

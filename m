Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40316 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731979AbeGSSOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 14:14:54 -0400
Received: by mail-wm0-f68.google.com with SMTP id z13-v6so7204955wma.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 10:30:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8dc5f9e6-2572-4223-42d3-3928a69f989b@cogentembedded.com>
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200107566.13504.725250500519176904.sendpatchset@little-apple> <8dc5f9e6-2572-4223-42d3-3928a69f989b@cogentembedded.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 20 Jul 2018 02:30:41 +0900
Message-ID: <CANqRtoRyUV9D1qj0wjtkRntATZvLMX6q7ctmV9CFHRodi_PRRQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 02/02] ravb: Clean up duplex handling
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Jul 20, 2018 at 12:44 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 07/19/2018 02:51 PM, Magnus Damm wrote:
>
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Since only full-duplex operation is supported by the
>> hardware, remove duplex handling code and keep the
>> register setting of ECMR.DM fixed at 1.
>>
>> This updates the driver implementation to follow the
>> data sheet text "This bit should always be set to 1."
>>
>> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
>    Sounds like a fix, please provide a Fixes: tag (I think we're fixing
> the initial driver commit here).

Yeah it is a fix if you consider not following the data sheet a bug.

The same applies to the first patch but it fixes the issue that we
don't setup the PHY correctly.

> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks!

>> ---
>>
>>  Written on top of renesas-drivers-2018-07-17-v4.18-rc5
>
>    Next time please base atop of DaveM's net.git repo.

Yep, will wait a while to see if there is any more feedback before
sending an updated version of the series.

> [...]
>> --- 0003/drivers/net/ethernet/renesas/ravb_main.c
>> +++ work/drivers/net/ethernet/renesas/ravb_main.c     2018-07-19 19:44:14.370607110 +0900
> [...]
>> @@ -1131,13 +1114,6 @@ static int ravb_set_link_ksettings(struc
>>       if (error)
>>               goto error_exit;
>>
>> -     if (cmd->base.duplex == DUPLEX_FULL)
>> -             priv->duplex = 1;
>> -     else
>> -             priv->duplex = 0;
>> -
>> -     ravb_set_duplex(ndev);
>> -
>
>    This fragment no longer exists in net.git...

Yeah will take care of that when I rebase.

Thanks,

/ magnus

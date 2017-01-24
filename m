Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:32854 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdAXPys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 10:54:48 -0500
Received: by mail-lf0-f45.google.com with SMTP id x1so26788654lff.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2017 07:54:47 -0800 (PST)
Subject: Re: [PATCH 3/3] sh_eth: stop using bare numbers for EESIPR values
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1636105.gp4aQxGd5K@wasted.cogentembedded.com>
 <4605565.M0SEEbnHAH@wasted.cogentembedded.com>
 <CAMuHMdWWFmDkJfhac9jLZ-ZAJfzDPw7oq4hwL5hVy21h0V13Og@mail.gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <371abddd-f4c7-8560-0c17-e30a91462ae3@cogentembedded.com>
Date: Tue, 24 Jan 2017 18:54:44 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWWFmDkJfhac9jLZ-ZAJfzDPw7oq4hwL5hVy21h0V13Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/23/2017 11:00 AM, Geert Uytterhoeven wrote:

>> Now  that we  have almost all EESIPR bits declared (and those that  are
>> still not are most probably reserved anyway) we can at last replace the
>> bare  numbers used for 'sh_eth_cpu_data::eesipr_value' initializers with
>> the bit names ORed together...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  drivers/net/ethernet/renesas/sh_eth.c |   89 +++++++++++++++++++++++++++++-----
>>  1 file changed, 78 insertions(+), 11 deletions(-)
>>
>> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
>> ===================================================================
>> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
>> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
>
>> @@ -800,7 +843,12 @@ static struct sh_eth_cpu_data sh7734_dat
>>
>>         .ecsr_value     = ECSR_ICD | ECSR_MPD,
>>         .ecsipr_value   = ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
>> -       .eesipr_value   = EESIPR_RFCOFIP | EESIPR_ECIIP | 0x003f07ff,
>> +       .eesipr_value   = EESIPR_RFCOFIP | EESIPR_ECIIP |
>> +                         EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
>> +                         EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
>
> Missing:
>
>         EESIPR_DLCIP | EESIPR_CDIP | EESIPR_TROIP |

    Hm, I thought I'd double-checked all the initializers... TY!

>> +                         EESIPR_RMAFIP | EESIPR_CEEFIP | EESIPR_CELFIP |
>> +                         EESIPR_RRFIP | EESIPR_RTLFIP | EESIPR_RTSFIP |
>> +                         EESIPR_PREIP | EESIPR_CERFIP,
>>
>>         .tx_check       = EESR_TC1 | EESR_FTC,
>>         .eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |
>> @@ -830,7 +878,12 @@ static struct sh_eth_cpu_data sh7763_dat
>>
>>         .ecsr_value     = ECSR_ICD | ECSR_MPD,
>>         .ecsipr_value   = ECSIPR_LCHNGIP | ECSIPR_ICDIP | ECSIPR_MPDIP,
>> -       .eesipr_value   = EESIPR_RFCOFIP | EESIPR_ECIIP | 0x003f07ff,
>> +       .eesipr_value   = EESIPR_RFCOFIP | EESIPR_ECIIP |
>> +                         EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
>> +                         EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
>
> Likewise

    :-<

>> +                         EESIPR_RMAFIP | EESIPR_CEEFIP | EESIPR_CELFIP |
>> +                         EESIPR_RRFIP | EESIPR_RTLFIP | EESIPR_RTSFIP |
>> +                         EESIPR_PREIP | EESIPR_CERFIP,
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Will add, thanks again...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei

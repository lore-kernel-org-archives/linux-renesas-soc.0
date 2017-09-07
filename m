Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:37869 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752778AbdIGIms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 04:42:48 -0400
Subject: Re: [PATCH 2/8] spi: sh-msiof: Fix DMA transfer size check
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-3-dirk.behme@de.bosch.com>
 <CAMuHMdWzWK5UTtmfoGmpHEwac8i3r1c6XqzT6cmwMXko2X7mvw@mail.gmail.com>
 <931484ec-8830-0e63-98cb-9dd58ce35230@de.bosch.com>
 <CAMuHMdVY5fLf+qH0rKSe5BrXSd7xDpA3x=GAnwD43cu9LT8wig@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <09ce4c7a-347c-7df8-d8ed-4eb61a00bd20@de.bosch.com>
Date: Thu, 7 Sep 2017 10:42:46 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVY5fLf+qH0rKSe5BrXSd7xDpA3x=GAnwD43cu9LT8wig@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07.09.2017 10:39, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Thu, Sep 7, 2017 at 10:33 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 07.09.2017 10:31, Geert Uytterhoeven wrote:
>>> On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>>>
>>>> DMA supports 32-bit words only,
>>>> even if BITLEN1 of SITMDR2 register is 16bit.
>>>>
>>>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>> ---
>>>>    drivers/spi/spi-sh-msiof.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
>>>> index 2b4d3a520176..f9300fdf41e5 100644
>>>> --- a/drivers/spi/spi-sh-msiof.c
>>>> +++ b/drivers/spi/spi-sh-msiof.c
>>>> @@ -904,7 +904,7 @@ static int sh_msiof_transfer_one(struct spi_master
>>>> *master,
>>>>                                   break;
>>>>                           copy32 = copy_bswap32;
>>>>                   } else if (bits <= 16) {
>>>> -                       if (l & 1)
>>>> +                       if (l & 3)
>>>>                                   break;
>>>>                           copy32 = copy_wswap32;
>>>>                   } else {
>>>
>>>
>>> Looks OK, as l is in bytes, not 16-bit words.
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> What do you think about CCing this to -stable?
> 
> Sounds OK. Have you tested this?


I tested all 8 patches together if they fix the issues I observed with 
plain mainline.

Best regards

Dirk

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:42643 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757647AbcFAIgO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 04:36:14 -0400
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
 <c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
 <CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
 <eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
 <CANqRtoR5008j-W2wbz2oVkYZv=-P4j6OZMQGz2fTXO1PwSeCtw@mail.gmail.com>
 <426527f7-d1fe-8574-7f25-66298bb55eab@de.bosch.com>
 <CAMuHMdVFZcb0VnM6E971q08c5qzJn2+dOhqv9VL9zvb0T9ocAQ@mail.gmail.com>
 <653cbab7-e7d7-476f-62b1-e9479827cfbb@de.bosch.com>
 <CAMuHMdWVM7dD90wcJQyx6d39DOoRmXUHGXwY54du6Ypm3qEejw@mail.gmail.com>
CC: Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <d5c7a87c-c945-73dc-7bea-f59d15481beb@de.bosch.com>
Date: Wed, 1 Jun 2016 10:36:06 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWVM7dD90wcJQyx6d39DOoRmXUHGXwY54du6Ypm3qEejw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 01.06.2016 10:26, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Wed, Jun 1, 2016 at 9:38 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> Sorry, if that was unclear. I took the example and transferred it to R-Car3
>> where we have ES1 - ES3.
>>
>> So, taking this example, on R-Car3 we might end up with
>>
>>         {
>>                 .compatible = "renesas,sata-r8a7795",
>>                 .data = (void *)RCAR_GEN2_SATA
>>         },
>>         {
>>                 .compatible = "renesas,sata-r8a7795-es1",
>>                 .data = (void *)RCAR_R8A7795_ES1_SATA
>>         },
>>         {
>>                 .compatible = "renesas,sata-r8a7795-es2",
>>                 .data = (void *)RCAR_R8A7795_ES2_SATA
>>         },
>>         {
>>                 .compatible = "renesas,sata-r8a7795-es3",
>>                 .data = (void *)RCAR_R8A7795_ES3_SATA
>>         },
>
> Are there known differences in the SATA implementations on R-Car H3 ES1, ES2,
> and ES3?


It's just an *example* what *might* happen.


> BTW having different compatible values in the driver makes it much easier to
> audit kernel sources for support for ESx deviations.


Why?

Having these compatible values in the driver doesn't tell you if the 
drivers uses them at all. No?

So you have to look into the driver code (not the compatible values) if 
and how the ESx are handled. And there, I don't think it makes any 
difference if you look for

if (priv->type == RCAR_R8A7790_ES1_SATA)
	ap->flags	|= ATA_FLAG_NO_DIPM;

or

if (revision_is_rcar2_es1)
	ap->flags	|= ATA_FLAG_NO_DIPM;

?


Best regards

Dirk

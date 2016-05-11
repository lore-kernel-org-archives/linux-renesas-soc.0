Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:31678 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932297AbcEKOWN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 10:22:13 -0400
Subject: Re: [PATCH v2 09/10] ARM: dts: r8a779x: Add reset module support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
 <1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
 <dd14821f-9b1c-6ea9-06f8-bc6698f7cba7@de.bosch.com>
 <CAMuHMdXE1fQzv+CDfRb8Tb-kMushBKAQ+dC+zR-vXLF2FjxMmg@mail.gmail.com>
 <dbaad273-a2e9-6334-7446-9d350022b6db@de.bosch.com>
 <CAMuHMdVqHSQ0Wkj8rBO2N12yhxNjkcE+Sjx93WdU-tJS86zT5Q@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <7f4a9ed2-2519-9c03-3582-fd5e24063c67@de.bosch.com>
Date: Wed, 11 May 2016 16:22:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVqHSQ0Wkj8rBO2N12yhxNjkcE+Sjx93WdU-tJS86zT5Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11.05.2016 15:51, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> CC Laurent
>
> On Wed, May 11, 2016 at 3:36 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> Just an understanding question:
>>
>> Why do you prefer the solution with the drivers/misc/boot-mode-reg/ solution
>> done in this patch series over the solution you proposed in
>>
>> http://www.spinics.net/lists/linux-sh/msg44755.html
>>
>> and the reset of that series?
>
> Do I? :-)
>
> drivers/misc/boot-mode-reg/ will need agreement outside the linux-renesas-soc
> community. My renesas,modemr proposal won't.


Then I'll have a look at

http://www.spinics.net/lists/linux-sh/msg44757.html

and drop the boot-mode-reg patches?

Ok?

Do you remember the status of

http://www.spinics.net/lists/linux-sh/msg44755.html

Anything I should know looking at it?

Best regards

Dirk

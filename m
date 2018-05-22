Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40716 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753321AbeEVXUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 19:20:19 -0400
Subject: Re: [PATCH 2/9] ARM: dts: lager: Drop MTD partitioning from DT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-2-marek.vasut+renesas@gmail.com>
 <CAMuHMdV1TFH_QwTv4fsOGnUOCNftC9369_1AQmZDK+NBLDmw-Q@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7f72e09a-3c02-7985-2c42-14e4034ff77e@gmail.com>
Date: Tue, 22 May 2018 23:55:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV1TFH_QwTv4fsOGnUOCNftC9369_1AQmZDK+NBLDmw-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/22/2018 04:32 PM, Geert Uytterhoeven wrote:
> On Tue, May 22, 2018 at 2:02 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Drop the MTD partitioning from DT, since it does not describe HW
>> and to give way to a more flexible kernel command line partition
>> passing.
>>
>> To retain the original partitioning, assure you have enabled
>> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
>> following to your kernel command line:
>>
>>   mtdparts=spi0.0:256k@0(loader),4096k(user),-(flash)
> 
> I guess s/4096k/4m/ works, too?

Yes, but all the other boards use nnn k, so let's stick with k . I don't
want one value to stick out like a sore thumb.

>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from saturn.retrosnub.co.uk ([178.18.118.26]:37511 "EHLO
        saturn.retrosnub.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752029AbdD0FBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 01:01:50 -0400
Subject: Re: [PATCH] iio: adc: Drop if clock from Renesas GyroADC bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
References: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXFMOZ0c4ptVCUpTK0u7aHfUx1=HfvSozgnbFjJDRorxA@mail.gmail.com>
From: Jonathan Cameron <jic23@kernel.org>
Message-ID: <f1c43c87-f2bf-9c9d-bd83-23257ca1795f@kernel.org>
Date: Thu, 27 Apr 2017 06:01:40 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXFMOZ0c4ptVCUpTK0u7aHfUx1=HfvSozgnbFjJDRorxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GH
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20/04/17 18:30, Geert Uytterhoeven wrote:
> On Thu, Apr 20, 2017 at 5:42 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> The "if" interface clock speed is actually derived from the "fck"
>> block clock, as in the hardware they are the same clock. Drop the
>> incorrect second "if" clock and retain only the "fck" clock.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jonathan Cameron <jic23@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: devicetree@vger.kernel.org
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Applied to the togreg branch of iio.git and pushed out as testing.
Device tree ack welcome, but I 'think' this is safe enough to take without
as it won't break any existing device trees.

Jonathan
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

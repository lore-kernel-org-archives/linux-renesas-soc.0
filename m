Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33464 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbcGNMJL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 08:09:11 -0400
Received: by mail-lf0-f49.google.com with SMTP id b199so61917997lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2016 05:09:10 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <1525017.NKJprrWkDB@wasted.cogentembedded.com>
 <CAMuHMdV086grEjTUxkhihF5t5NcO-pKt_8GfXhUWrMsq1zVbYg@mail.gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c97c4dfe-9db0-d8ec-0bd1-6b26911e653e@cogentembedded.com>
Date: Thu, 14 Jul 2016 15:09:08 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV086grEjTUxkhihF5t5NcO-pKt_8GfXhUWrMsq1zVbYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 7/13/2016 9:13 AM, Geert Uytterhoeven wrote:

>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> ---
>> The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
>> repo plus my 2 R8A7792 PFC patches posted before...
>>
>> Changes in version 2:
>> - added AVB_AVTP_MATCH pin group.
>
> Thanks for the update!

    Not at all. How about queuing the PFC patches? :-)

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34786 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758345AbcHDNkS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 09:40:18 -0400
Received: by mail-lf0-f54.google.com with SMTP id l69so182260197lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Aug 2016 06:39:57 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add missing pinmux data
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
 <CACRpkdbPsu=uhHW7N0GS1evMkbYUrA+465Ou5m0R-kOoDUtQ0w@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d3951fc0-589d-9128-cd68-371dd526ac38@cogentembedded.com>
Date: Thu, 4 Aug 2016 16:39:54 +0300
MIME-Version: 1.0
In-Reply-To: <CACRpkdbPsu=uhHW7N0GS1evMkbYUrA+465Ou5m0R-kOoDUtQ0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/04/2016 11:04 AM, Linus Walleij wrote:

>> The patch I've based my R8A7792 PFC work on had some VIN pinmux data missing
>> and I  just  noticed that while adding the VIN pin groups...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> This looks like a fix that should go in ASAP?

    It would be enough if it gets queued before the patch adding VIN pin groups.

[...]

> Yours,
> Linus Walleij

MBR, Sergei

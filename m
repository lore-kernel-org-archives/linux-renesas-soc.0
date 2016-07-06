Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33682 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754068AbcGFRTH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 13:19:07 -0400
Received: by mail-lf0-f43.google.com with SMTP id f6so159022047lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jul 2016 10:19:06 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <1734030.FmmGtJt7OA@wasted.cogentembedded.com>
 <CAMuHMdX9bxt9W_0NxPZn5Hi9314rBuDnecvL2TfqrwKm6r0q6g@mail.gmail.com>
 <CACRpkdb3QSU_6HJR8kLtQ5t4wnH7mkAs-C=Mxz+suggDW+UxYQ@mail.gmail.com>
 <CAMuHMdXWJVBt7=b46cyz_Gzh4QQDDPGa72HoXupNvR9NCc03tA@mail.gmail.com>
 <CACRpkdY27GY6wLbabyzMiFSAEn0LP_iHgheW19+44trerfYnPA@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a0c96d18-4bba-d640-5b1a-ca519567bed1@cogentembedded.com>
Date: Wed, 6 Jul 2016 20:18:58 +0300
MIME-Version: 1.0
In-Reply-To: <CACRpkdY27GY6wLbabyzMiFSAEn0LP_iHgheW19+44trerfYnPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/06/2016 12:14 AM, Linus Walleij wrote:

>>>>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> Should I just apply it?
>>>
>>> It's late in the kernel cycle but I do not mind stuff like
>>> this so much.
>>
>> You can't, as I haven't send a pull request for the initial r8a7792 support yet,
>> so this patch won't apply ;-)
>
> Bring it on. None of your stuff has ever bit me so I'm still happy to
> pull in some more Renesas stuff.

    Geert was going to take the rest of week off. This patch needs a bit more 
work but you can merge the 2-patch series that this one's based on. I would be 
really thankful if so. :-)

> Yours,
> Linus Walleij

MBR, Sergei

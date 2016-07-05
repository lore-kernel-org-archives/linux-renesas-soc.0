Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35724 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbcGEVOk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 17:14:40 -0400
Received: by mail-oi0-f48.google.com with SMTP id r2so246949138oih.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 14:14:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXWJVBt7=b46cyz_Gzh4QQDDPGa72HoXupNvR9NCc03tA@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <1734030.FmmGtJt7OA@wasted.cogentembedded.com>
 <CAMuHMdX9bxt9W_0NxPZn5Hi9314rBuDnecvL2TfqrwKm6r0q6g@mail.gmail.com>
 <CACRpkdb3QSU_6HJR8kLtQ5t4wnH7mkAs-C=Mxz+suggDW+UxYQ@mail.gmail.com> <CAMuHMdXWJVBt7=b46cyz_Gzh4QQDDPGa72HoXupNvR9NCc03tA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Jul 2016 23:14:38 +0200
Message-ID: <CACRpkdY27GY6wLbabyzMiFSAEn0LP_iHgheW19+44trerfYnPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 5, 2016 at 5:46 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 5, 2016 at 4:54 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Jul 5, 2016 at 8:57 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> Hi Sergei,
>>>
>>> On Mon, Jul 4, 2016 at 9:52 PM, Sergei Shtylyov
>>> <sergei.shtylyov@cogentembedded.com> wrote:
>>>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Should I just apply it?
>>
>> It's late in the kernel cycle but I do not mind stuff like
>> this so much.
>
> You can't, as I haven't send a pull request for the initial r8a7792 support yet,
> so this patch won't apply ;-)

Bring it on. None of your stuff has ever bit me so I'm still happy to
pull in some more Renesas stuff.

Yours,
Linus Walleij

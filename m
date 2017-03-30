Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34721 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753749AbdC3Jjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 05:39:52 -0400
Received: by mail-lf0-f53.google.com with SMTP id z15so22494635lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2017 02:39:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7791: add missing DVC_MUTE signal
To: Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20170329183658.618942497@cogentembedded.com>
 <HK2PR0601MB132955B398D6CE3FA300C222B7340@HK2PR0601MB1329.apcprd06.prod.outlook.com>
 <CAMuHMdU++fKJjAAjjEHmj0W8WZj5L+kmBeW1tjqTA+JhchKbHA@mail.gmail.com>
 <CAMuHMdU_imTfh5Hb=BtKj6u1rJhuj4vAWarC7Xq2RZWQQkH8pg@mail.gmail.com>
 <HK2PR0601MB1329C1778065759E02CCC15BB7340@HK2PR0601MB1329.apcprd06.prod.outlook.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <023fbd64-9337-d126-9c9c-9d713454e547@cogentembedded.com>
Date: Thu, 30 Mar 2017 12:39:48 +0300
MIME-Version: 1.0
In-Reply-To: <HK2PR0601MB1329C1778065759E02CCC15BB7340@HK2PR0601MB1329.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/30/2017 12:16 PM, Chris Paterson wrote:

>>>>> From: linux-renesas-soc-owner@vger.kernel.org
>>>>> [mailto:linux-renesas-soc- owner@vger.kernel.org] On Behalf Of
>>>>> Sergei Shtylyov
>>>>> Sent: 29 March 2017 19:37
>>>>>
>>>>> The R8A7791 PFC driver  was apparently based on the preliminary
>>>>> revisions of the user's  manual, which  omitted the DVC_MUTE signal
>>>>> altogether in the PFC section. The modern manual has the signal
>>>>> described,  so just add the necassary data to the driver...
>>>>>
>>>>> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Should this patch also CC stable? (Patch 1/2 does)
>>>
>>> No need to spam stable with all these patches and reviews.
>>> If it has a Fixes-tag, the stable team will pick it up anyway. After
>>> it has ended up upstream.
>
> Okay.
>
>>
>> And in this case, there's not really a need to backport it to stable, as there
>> cannot be any users due to lack of pins using these definitions.
>
> Whereas the first patch in the series fixes a problem that *is* currently seen by users, so will need backporting. Makes sense now, thanks!

    Note that it might only be seen by some out-of-tree boards, as neither 
upstream supported R8A7791-based board enables HSCIF1...

> Kind regards, Chris
>
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert

MBR, Sergei

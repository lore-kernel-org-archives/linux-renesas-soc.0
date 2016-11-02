Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:26465 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753502AbcKBB3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 21:29:05 -0400
Subject: Re: The failure summary report of GEN3(RCAR H3) for linux upstream
 v4.9-rc2
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
 <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <58060015.3020702@jinso.co.jp>
 <b4efb8cc-bf55-cf34-a537-4ffa5041291a@jinso.co.jp>
 <CAMuHMdU4Siv1ogpv9S-Bq8BRHP0uiXjYAa0Zkdvcts4X+VU10w@mail.gmail.com>
Cc: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@sang-engineering.com>
From: duclm <lm-duc@jinso.co.jp>
Message-ID: <72e82c60-9fa5-c3d8-12e6-e74b2c96ab6f@jinso.co.jp>
Date: Wed, 2 Nov 2016 10:29:00 +0900
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU4Siv1ogpv9S-Bq8BRHP0uiXjYAa0Zkdvcts4X+VU10w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Mr Geert,

Thank you for your information.

Sorry for my stupid question, could you tell me what kind of firmware 
(v2.12.0) are you mentioning?

On 2016年10月31日 22:16, Geert Uytterhoeven wrote:

> Hi Duc-san,
>
> On Mon, Oct 31, 2016 at 2:10 PM, duclm <lm-duc@jinso.co.jp> wrote:
>> We have tested the linux upstream v4.9-rc2 for Gen3(RCAR H3).
>>
>> So we would like to report the summary of the failure.
> Issue 1 ("PM: Automatically resumes after suspending system. "): suspend
> and resume are handled by PSCI. To gix the issue, you have to upgrade the
> firmware to v2.12.0, and follow the accompanying procedures to prepare the
> system for suspend, and to resume.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>

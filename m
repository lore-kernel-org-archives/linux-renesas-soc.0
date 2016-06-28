Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:47061 "EHLO
	www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbcF1BG4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 21:06:56 -0400
Message-ID: <5771C59E.7010700@jinso.co.jp>
Date: Tue, 28 Jun 2016 09:32:30 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa@the-dreams.de>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>,
	=?UTF-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>
Subject: Re: [Bug]:Koelsch: DU, Could not show an image or picture on HDMI
 display.
References: <56FE29DC.4060605@jinso.co.jp>	<CAMuHMdWQL4S5Lf1pqXmHp7L5Dojo=HKWGRuu=-OhQ0FiKa+DZg@mail.gmail.com>	<5703247F.2060600@jinso.co.jp>	<CAMuHMdWM-JiB4y9-SxX9toiQvu429tG91vFd+t=bTvyLoTz5+w@mail.gmail.com>	<57046AB8.5020307@jinso.co.jp>	<CAMuHMdVZGsgXDpa=dQFNCi+nEVt1+1w6sPw8m+xZy0wSZE5O-Q@mail.gmail.com>	<5705B36D.5000803@jinso.co.jp> <CAMuHMdUNZUEuni9U6gPAPGyb7G-EM339c=KT+0ik=JXdSa2hOg@mail.gmail.com>
In-Reply-To: <CAMuHMdUNZUEuni9U6gPAPGyb7G-EM339c=KT+0ik=JXdSa2hOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

Sorry to bother you again!
I would like to confirm the fixed patch for this issue.
The issue still happens at the Linux upstream version v4.7-rc2
Have you released the fixed patch yet?
Please tell me the version and test method if you have already released it.

Thank you!
Hiep.

On 04/07/2016 03:56 PM, Geert Uytterhoeven wrote:
> Hi Hiep-san.
>
> On Thu, Apr 7, 2016 at 3:10 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp> wrote:
>>> 2. Your Koelsch has U-Boot 46367b1, while mine has b6af5fc. The former
>>> disables
>>>      many MSTP clocks (incl . GPIO), while the latter keeps them enabled,
>>> so
>>>      that's why v4.5-rc3 worked for me.
>> Thanks for your explanation.
>> Your U-boot is older or newer than mine?. Should I update my U-boot?
> Mine is older. So no need for you to upgrade ;-)
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

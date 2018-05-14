Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:37016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753691AbeENMyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 08:54:43 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [GIT PULL FOR renesas-drivers] drm/du/m3n
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20180512080922.22025-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdUwdnrL2uJ-S4cp14+rLoON-2hj_DB3rGxDQobaV=yz2Q@mail.gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <ef4c673a-ca13-83e7-16a5-232eb4b06b97@ideasonboard.com>
Date: Mon, 14 May 2018 13:54:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUwdnrL2uJ-S4cp14+rLoON-2hj_DB3rGxDQobaV=yz2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 14/05/18 13:52, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Sat, May 12, 2018 at 10:09 AM, Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> Please consider including this release in renesas-drivers.
>>
>> --
>> Regards
>>
>> Kieran
>>
>> The following changes since commit 6d08b06e67cd117f6992c46611dfb4ce267cd71e:
>>
>>   Linux 4.17-rc2 (2018-04-22 19:20:09 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/drm/du/m3n
>>
>> for you to fetch changes up to f1e9a22ac3cff749077f40bf1a149aaaf587ae2d:
>>
>>   drm: rcar-du: Add R8A77965 support (2018-05-05 17:11:20 +0300)
> 
> Thanks, merged clealy into today's linux-next.

Great, thanks.

> 
>> ----------------------------------------------------------------
>> drm: rcar-du: Provide support for the M3-N
>>
>> The M3-N has non linear addressing of it's group objects, which was not
> 
> non-linear?

Probably :)

> its

Definitely !



> 
>> supported by the rcar-du driver implementation due to asumptions on the

Hrm ... also s/asumptions/assumptions/

--
Thanks

Kieran

>> match between a CRTC index, and the hardware indexes.
>>
>> Implement support to remove this assumption and enable the M3-N
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:23624 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932456AbcE0Ioc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 27 May 2016 04:44:32 -0400
Subject: Re: [PATCH 0/4] ARM: Renesas: R-Car3: Add product register support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Magnus Damm <magnus.damm@gmail.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWoBv-13eNMr_ymtmRo-LPdznarRMyXFw0pG7xF_07A6A@mail.gmail.com>
 <c0890925-f003-8aa5-22fd-315229593037@de.bosch.com>
 <CANqRtoSHkH2N6_UJ_mjij9k3GaAsSBDuUxjTTLZryHzy74Sh1Q@mail.gmail.com>
 <eccba76d-465c-ca86-bda2-1f0ededc6918@de.bosch.com>
 <CAMuHMdWHwu3V6-QtrQdNm-b3Wu4_r15mv9Lpi487cEZxWUvwLg@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <b96e8ee5-7b8f-31a0-f4dc-9dbdd2c3ce9d@de.bosch.com>
Date: Fri, 27 May 2016 10:44:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWHwu3V6-QtrQdNm-b3Wu4_r15mv9Lpi487cEZxWUvwLg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27.05.2016 10:39, Geert Uytterhoeven wrote:
> On Fri, May 27, 2016 at 9:56 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>>>> Given the use of PRR you saw is in a patch that's definitely not ready for
>>>>> upstream, I think adding a full-fledged PRR driver is a bit premature.
>
>>> I don't think anyone disagrees that it makes sense to be able to
>>> determine ES version during runtime. The questions in my mind are how
>>> to do it
>>
>> I've made a proposal ;) And I'm happy to discuss technically about it.
>>
>>> and the urgency.
>>
>> Regarding the urgency: Someone has accepted the hard coded PRODUCT register
>> (and MODEMR) being in renesas-drivers, now:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest#n177
>
> I will drop the topic branch topic/salvator-x-hdmi-prototype-v2-rebased1
> from next renesas-drivers release, as it's definitely not ready.
>
> People who want to use that branch can still merge it themselves.


Ok, fine, thanks. But maybe it makes sense to continue to discuss about 
the SoC/revision detection independently, then. Maybe with less urgency ;)


Btw, what's about the MODEMR patch series? As it's from you and there 
have been no further comments with v3, I'm somehow hoping to get it 
integrated.


Best regards

Dirk

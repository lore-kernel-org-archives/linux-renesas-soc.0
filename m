Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28073 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763AbcEMFBR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 01:01:17 -0400
Subject: Re: [PATCH 0/6] arm64: renesas: Obtain MD pin values using
 syscon/regmap
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWEe44Kr4LB0PW996oes+ijpVjwCH9=QSHH5y+YAh9vFg@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <8e0893f1-3767-fb38-50d5-df15d113d8a8@de.bosch.com>
Date: Fri, 13 May 2016 07:01:07 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWEe44Kr4LB0PW996oes+ijpVjwCH9=QSHH5y+YAh9vFg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12.05.2016 19:48, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Thu, May 12, 2016 at 10:27 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> This is a resend of
>>
>> http://www.spinics.net/lists/linux-sh/msg44757.html
>>
>> It's rebased against
>>
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest
>> 0ea1cc9f0c9537d3fb42722c188
>> [WIP] arm64: r8a7796: Integration
>>
>> and adds support for r8a7796, too.
>>
>> It's boot tested on r8a7795 Salvator-X and checked that the same
>> mode value is read without and with this patch series.
>
> Thanks a lot for updating my old series!
>
> Now we have both variants (drivers/misc vs. syscon) public, perhaps we can make
> an educated decision about which route to take?


I definitely vote for syscon as it's cleaner and more "mainline compatible".

Best regards

Dirk

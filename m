Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35393 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964917AbcFQUYk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 16:24:40 -0400
Received: by mail-lf0-f54.google.com with SMTP id l188so5166247lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2016 13:24:39 -0700 (PDT)
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Correct arch timer
 frequency on R-Car V2H
To: Simon Horman <horms@verge.net.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <1465813872-11937-1-git-send-email-geert+renesas@glider.be>
 <20160616051918.GD10590@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f7f5436e-230b-eadd-35d5-6684b41bd31d@cogentembedded.com>
Date: Fri, 17 Jun 2016 23:24:36 +0300
MIME-Version: 1.0
In-Reply-To: <20160616051918.GD10590@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/16/2016 08:19 AM, Simon Horman wrote:

>> According to the datasheet, the frequency of the ARM architecture timer
>> on R-Car V2H depends on the frequency of the ZS clock, just like on
>> R-Car E2.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Against renesas-devel-20160613-v4.7-rc3 with "ARM: shmobile: rcar-gen2:
>> Obtain extal frequency from DT" applied.
>>
>> Untested due to lack of hardware.
>
> Sergei, could you test this?

    Done, now 'sleep 5' takes 5 seconds indeed. :-)

Tested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei

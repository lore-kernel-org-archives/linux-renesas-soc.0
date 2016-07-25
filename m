Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33565 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123AbcGYKkt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Jul 2016 06:40:49 -0400
Received: by mail-lf0-f52.google.com with SMTP id b199so125612918lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jul 2016 03:40:48 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add R8A7792 I2C support
To: Simon Horman <horms@verge.net.au>
References: <17288006.ERHB6654v5@wasted.cogentembedded.com>
 <20160725020947.GI12825@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <162faf65-4286-add4-6eb2-ac07a6d04deb@cogentembedded.com>
Date: Mon, 25 Jul 2016 13:40:48 +0300
MIME-Version: 1.0
In-Reply-To: <20160725020947.GI12825@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 7/25/2016 5:09 AM, Simon Horman wrote:

>>    Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
>> 'renesas-devel-20160722-v4.7-rc7' tag plus the SDHI/I2C patches just posted.
>> We're adding the R8A7792 VIN clocks and device nodes. The patches have been
>> tested on the Blanche board with the switches set to the HDMI input mode...
>>
>> [1/2] ARM: dts: r8a7792: add VIN clocks
>> [2/2] ARM: dts: r8a7792: add VIN support
>
> Thanks, I have queued these up for v4.9.

    Oops, sorry for using a stale subject. :-(
    Thank you!

MBR, Sergei

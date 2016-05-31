Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:34008 "EHLO
	mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804AbcEaQ2I (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 12:28:08 -0400
MIME-Version: 1.0
In-Reply-To: <a1d8aeea-2e62-ef2b-fd01-a219e4863785@cogentembedded.com>
References: <1464553500-19043-1-git-send-email-ykaneko0929@gmail.com>
	<ac6ed5e5-0adf-3147-2bd6-1752cf31d587@cogentembedded.com>
	<a1d8aeea-2e62-ef2b-fd01-a219e4863785@cogentembedded.com>
Date: Wed, 1 Jun 2016 01:28:07 +0900
Message-ID: <CAH1o70J+KM+sTh2jyiCOf1pYK=h7S++uHnqEO7Q4=Vug+BiwgA@mail.gmail.com>
Subject: Re: [PATCH net-next] ravb: Add ESF in RCR for enabling separation filter
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

2016-05-31 6:19 GMT+09:00 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>:
> On 05/30/2016 05:30 PM, Sergei Shtylyov wrote:
>
>>> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>>>
>>> This patch adds enabling separation filter(ESF) is setting value of B'11.
>>> This setting filter for separating AVB stream frames from non-AVB stream
>>> frames is enabled. Non-matching frames from a stream are processed in
>>> queue 0(best effort). H/W manual recommends B'11 or B'10.
>>> When B'10 is setting, Non-mating frames are discarded.
>>
>>
>>    It was somewhat hard for me to parse that...
>
>
>    Forgot about s/Non-mating/Non-matching/.

Thanks for your review.
I will revise the commit message.

Thanks,
kaneko

>
>
>>> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
>>> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>>
>>
>> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
>
> MBR, Sergei
>

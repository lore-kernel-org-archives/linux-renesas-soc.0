Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34060 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162549AbcE3VUD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 17:20:03 -0400
Received: by mail-lf0-f49.google.com with SMTP id k98so78461281lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 14:20:01 -0700 (PDT)
Subject: Re: [PATCH net-next] ravb: Add ESF in RCR for enabling separation
 filter
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, netdev@vger.kernel.org
References: <1464553500-19043-1-git-send-email-ykaneko0929@gmail.com>
 <ac6ed5e5-0adf-3147-2bd6-1752cf31d587@cogentembedded.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a1d8aeea-2e62-ef2b-fd01-a219e4863785@cogentembedded.com>
Date: Tue, 31 May 2016 00:19:58 +0300
MIME-Version: 1.0
In-Reply-To: <ac6ed5e5-0adf-3147-2bd6-1752cf31d587@cogentembedded.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/30/2016 05:30 PM, Sergei Shtylyov wrote:

>> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>>
>> This patch adds enabling separation filter(ESF) is setting value of B'11.
>> This setting filter for separating AVB stream frames from non-AVB stream
>> frames is enabled. Non-matching frames from a stream are processed in
>> queue 0(best effort). H/W manual recommends B'11 or B'10.
>> When B'10 is setting, Non-mating frames are discarded.
>
>    It was somewhat hard for me to parse that...

    Forgot about s/Non-mating/Non-matching/.

>> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
>> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei

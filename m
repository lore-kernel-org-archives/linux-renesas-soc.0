Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35591 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752521AbcD0ISZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 04:18:25 -0400
Received: by mail-wm0-f52.google.com with SMTP id e201so27368929wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Apr 2016 01:18:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <571FAD61.7000106@cogentembedded.com>
References: <1461686127-3217-1-git-send-email-wsa@the-dreams.de>
	<1461686127-3217-4-git-send-email-wsa@the-dreams.de>
	<571FAD61.7000106@cogentembedded.com>
Date: Wed, 27 Apr 2016 10:18:23 +0200
Message-ID: <CAPDyKFrqEcFqJo8B5dn3Qo1ae9mqKmmUrT+r4xhYZJ7z=S1Vew@mail.gmail.com>
Subject: Re: [PATCH V2 3/6] mmc: tmio: remove now unneeded seperate irq handlers
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26 April 2016 at 20:03, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 04/26/2016 06:55 PM, Wolfram Sang wrote:
>
>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> We removed installation of seperate handlers previously, so we can also
>
>
>    Separate.
>
>> remove the seperate handlers.
>
>
>    Again. :-)
>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
>
> [...]
>
> MBR, Sergei
>

Acutally checkpatch complains about this as well. This time I decided
to amend the patches myself!

Kind regards
Uffe

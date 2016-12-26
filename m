Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34058 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751660AbcLZTpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2016 14:45:13 -0500
Received: by mail-lf0-f45.google.com with SMTP id y21so177112792lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2016 11:45:12 -0800 (PST)
Subject: Re: [PATCH] drm: rcar-du: enable VSPDs on R8A7791
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <4947043.txDs5ZU4mH@wasted.cogentembedded.com>
 <1823239.KB8yzOkpmW@avalon>
 <1e9a678f-939d-fa4a-1550-d806ffe47697@cogentembedded.com>
 <17860203.AIUhP9KGSE@avalon>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b7ad18e7-4766-60ea-232f-f26c98e3bc32@cogentembedded.com>
Date: Mon, 26 Dec 2016 22:45:08 +0300
MIME-Version: 1.0
In-Reply-To: <17860203.AIUhP9KGSE@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/19/2016 11:24 PM, Laurent Pinchart wrote:

>>>> We're going to use R8A7791 VSPDs to control DU, so set the corresponding
>>>> flag.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> For the same reason I nacked the corresponding patch to the VSP1 driver, I
>>> have to nack this one as well. The Gen2 DU has native planes, this patch
>>> would prevent using them. I don't see a good reason to do so.
>>
>> One of the reasons is that these patches kill the horizontal noise when
>> playing video in Weston...
>
> What horizontal noise ? :-)

    Occurs with V4L2 renderer... :-)

MBR, Sergei
